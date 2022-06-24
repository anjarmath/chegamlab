import 'package:chegamlab/variabel/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class messages extends StatefulWidget {
  String email;
  ScrollController scrollController;
  messages({required this.email, required this.scrollController});
  @override
  _messagesState createState() =>
      _messagesState(email: email, scrollController: scrollController);
}

class _messagesState extends State<messages> {
  String email;
  ScrollController scrollController;
  _messagesState({required this.email, required this.scrollController});

  Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('Messages')
      .orderBy('time')
      .snapshots();

  Future<String> nama() async {
    final data = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      if (data.data() != null) {
        email = data.data()!['nama'];
      } else {
        email = 'Anonymous';
      }
    });

    return email;
  }

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nama();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _messageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("something is wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            if (scrollController.hasClients) {
              scrollController.animateTo(
                  scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut);
            }
          });
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          controller: scrollController,
          itemBuilder: (_, index) {
            QueryDocumentSnapshot qs = snapshot.data!.docs[index];
            Timestamp t = qs['time'];
            DateTime d = t.toDate();
            print(d.toString());
            print(email);
            print(qs['email']);
            return Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 8),
              child: Column(
                crossAxisAlignment:
                    FirebaseAuth.instance.currentUser!.uid == qs['id']
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 400,
                    decoration: BoxDecoration(
                      color: FirebaseAuth.instance.currentUser!.uid == qs['id']
                          ? Colors.blueGrey.withOpacity(0.2)
                          : primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        qs['email'],
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.blueGrey,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 300,
                            child: Text(
                              qs['message'],
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Text(
                            d.hour.toString() + ":" + d.minute.toString(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
