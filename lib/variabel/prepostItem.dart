// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class PrepostItem extends StatefulWidget {
  const PrepostItem({Key? key}) : super(key: key);

  @override
  State<PrepostItem> createState() => _PrepostItemState();
}

class _PrepostItemState extends State<PrepostItem> {
  final Stream<QuerySnapshot> _prepost =
      FirebaseFirestore.instance.collection('prepost').orderBy('p').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _prepost,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("something is wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, index) {
            int nomor = index + 1;
            QueryDocumentSnapshot qs = snapshot.data!.docs[index];
            return Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(nomor.toString()),
                    ],
                  ),
                  Column(
                    children: [
                      // Text(),
                    ],
                  ),
                  Column(),
                  //   Text('Pertemuan $pertemuan'),
                  //   Spacer(),
                  //   ToggleSwitch(
                  //     minWidth: 40,
                  //     minHeight: 30,
                  //     initialLabelIndex: qs['akses'],
                  //     cornerRadius: 20.0,
                  //     activeFgColor: Colors.white,
                  //     inactiveBgColor: Colors.grey,
                  //     inactiveFgColor: Colors.white,
                  //     totalSwitches: 2,
                  //     icons: const [Icons.close, Icons.check],
                  //     activeBgColors: const [
                  //       [Colors.redAccent],
                  //       [Colors.green]
                  //     ],
                  //     onToggle: (ind) async {
                  //       await FirebaseFirestore.instance
                  //           .collection('kelas')
                  //           .doc('pertemuan $pertemuan')
                  //           .set({'akses': ind}).whenComplete(() {
                  //         showSnackBar(
                  //             context,
                  //             qs['akses'] == 0
                  //                 ? 'Akses untuk pertemuan $pertemuan telah dibuka'
                  //                 : 'Akses untuk pertemuan $pertemuan telah ditutup');
                  //       });
                  //     },
                  //   ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
