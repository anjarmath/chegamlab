import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../variabel/_textContainer.dart';
import '../variabel/color.dart';
import '../variabel/message.dart';

class Consultation extends StatefulWidget {
  const Consultation({Key? key}) : super(key: key);

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  final TextEditingController _msgController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String email = '';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nama();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/bg_gold.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: gradient,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Laman Konsultasi',
                            style: TextStyle(
                              color: dark,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            child: messages(
                              email: email,
                              scrollController: _scrollController,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            TextFieldContainer(
                              color: primary.withOpacity(0.2),
                              child: TextField(
                                controller: _msgController,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if (_msgController.text.isNotEmpty) {
                                  FirebaseFirestore.instance
                                      .collection('Messages')
                                      .doc()
                                      .set({
                                    'message': _msgController.text.trim(),
                                    'time': DateTime.now(),
                                    'email': email,
                                    'id':
                                        FirebaseAuth.instance.currentUser!.uid,
                                  }).whenComplete(() {
                                    WidgetsBinding.instance
                                        ?.addPostFrameCallback((_) {
                                      if (_scrollController.hasClients) {
                                        _scrollController.animateTo(
                                            _scrollController
                                                .position.maxScrollExtent,
                                            duration: const Duration(
                                                milliseconds: 200),
                                            curve: Curves.easeInOut);
                                      }
                                    });
                                  });

                                  _msgController.clear();
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 12),
                                padding: EdgeInsets.all(5),
                                height: 62,
                                width: 62,
                                decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(29)),
                                child: Center(
                                  child: Icon(
                                    Icons.send_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
