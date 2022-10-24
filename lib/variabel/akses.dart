import 'package:chegamlab/variabel/utis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'color.dart';

class Akses extends StatefulWidget {
  const Akses({Key? key}) : super(key: key);

  @override
  State<Akses> createState() => _AksesState();
}

class _AksesState extends State<Akses> {
  final Stream<QuerySnapshot> _kelasStream =
      FirebaseFirestore.instance.collection('kelas').orderBy('p').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _kelasStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("something is wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 4 / 3,
          ),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, index) {
            int pertemuan = index + 1;
            QueryDocumentSnapshot qs = snapshot.data!.docs[index];
            return Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Pertemuan $pertemuan'),
                  Spacer(),
                  ToggleSwitch(
                    minWidth: 40,
                    minHeight: 30,
                    initialLabelIndex: qs['akses'],
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    icons: const [Icons.close, Icons.check],
                    activeBgColors: const [
                      [Colors.redAccent],
                      [Colors.green]
                    ],
                    onToggle: (ind) async {
                      await FirebaseFirestore.instance
                          .collection('kelas')
                          .doc('pertemuan $pertemuan')
                          .set({'akses': ind, 'p': pertemuan}).whenComplete(() {
                        showSnackBar(
                            context,
                            qs['akses'] == 0
                                ? 'Akses untuk pertemuan $pertemuan telah dibuka'
                                : 'Akses untuk pertemuan $pertemuan telah ditutup');
                      });
                    },
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
