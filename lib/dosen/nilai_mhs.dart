import 'package:chegamlab/variabel/utis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../variabel/color.dart';

class NilaiMhs extends StatefulWidget {
  const NilaiMhs({Key? key}) : super(key: key);

  @override
  State<NilaiMhs> createState() => _NilaiMhsState();
}

class _NilaiMhsState extends State<NilaiMhs> {
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
          body: Center(
            child: Column(
              children: [
                Container(
                  width: width * 0.5,
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    gradient: gradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Nilai Mahasiswa',
                      style: TextStyle(
                        color: dark,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(24),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(26),
                        topRight: Radius.circular(26)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('NAMA'),
                      Text('PRETEST'),
                      Text('POSTTEST'),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .78,
                    padding: EdgeInsets.all(24),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          final snap = snapshot.data!.docs;

                          return ListView.builder(
                            itemCount: snap.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 40,
                                margin: EdgeInsets.only(bottom: 14),
                                decoration: BoxDecoration(),
                                width: MediaQuery.of(context).size.width * .8,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(snap[index].get('nama')),
                                    Column(
                                      children: [
                                        Text('Pertemuan 4: ' +
                                            snap[index]
                                                .get('pretest 4')
                                                .toString()),
                                        Text('Pertemuan 11: ' +
                                            snap[index]
                                                .get('pretest 11')
                                                .toString())
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('Pertemuan 4: ' +
                                            snap[index]
                                                .get('posttest 4')
                                                .toString()),
                                        Text('Pertemuan 11: ' +
                                            snap[index]
                                                .get('posttest 11')
                                                .toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
