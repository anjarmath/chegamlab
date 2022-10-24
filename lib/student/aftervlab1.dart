import 'package:chegamlab/student/posttest1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../variabel/utis.dart';

class AfterVlab1 extends StatefulWidget {
  const AfterVlab1({Key? key}) : super(key: key);

  @override
  State<AfterVlab1> createState() => _AfterVlab1State();
}

class _AfterVlab1State extends State<AfterVlab1> {
  // Data 1
  String v11 = '';
  String v12 = '';
  String v13 = '';
  String v14 = '';
  String v15 = '';
  String v16 = '';
  String v17 = '';
  String v18 = '';
  String v19 = '';
  String v110 = '';
  String v111 = '';
  String v112 = '';
  String v113 = '';
  bool p1 = false;

  // Data 2
  String v21 = '';
  String v22 = '';
  String v23 = '';
  String v24 = '';
  String v25 = '';
  String v26 = '';
  String v27 = '';
  String v28 = '';
  String v29 = '';
  String v210 = '';
  bool p2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'A. Perubahan Materi',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            PerubahanMateri(context),
            SizedBox(height: 20),
            Row(children: [
              TextButton(
                onPressed: () {
                  if (v11 != '' &&
                      v12 != '' &&
                      v13 != '' &&
                      v14 != '' &&
                      v15 != '' &&
                      v16 != '' &&
                      v17 != '' &&
                      v18 != '' &&
                      v19 != '' &&
                      v110 != '' &&
                      v111 != '' &&
                      v112 != '') {
                    setState(() {
                      p1 = true;
                    });
                  } else {
                    showSnackBar(context, 'Ada input yang salah!');
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: Colors.blue,
                  child: Text(
                    'Cek & Next',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Container(
                child: p1 == true
                    ? Icon(Icons.check_circle, color: Colors.green)
                    : Container(),
              ),
            ]),
            SizedBox(height: 20),
            Text(
              'B. Reaksi Kimia',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            ReaksiKimia(),
            SizedBox(height: 20),
            Row(children: [
              TextButton(
                onPressed: () {
                  if (v21 != '' &&
                      v22 != '' &&
                      v23 != '' &&
                      v24 != '' &&
                      v25 != '' &&
                      v26 != '' &&
                      v27 != '' &&
                      v28 != '' &&
                      v29 != '' &&
                      v210 != '') {
                    setState(() {
                      p2 = true;
                    });
                  } else {
                    showSnackBar(context, 'Ada input yang salah!');
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: Colors.blue,
                  child: Text(
                    'Cek & Next',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Container(
                child: p2 == true
                    ? Icon(Icons.check_circle, color: Colors.green)
                    : Container(),
              ),
            ]),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                if (p1 && p2) {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => Posttest1()));
                } else {
                  showSnackBar(context, 'Anda belum menyelesaikan bagian ini!');
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                color: Colors.blue,
                child: Text(
                  'Lanjutkan',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  DataTable ReaksiKimia() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Aspek Yang Diamati')),
        DataColumn(label: Text('Hasil Pengamatan'))
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(
              Text(
                'B.1. 	Reaksi antara larutan Pb(NO3)2 dengan larutan KI',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataCell(Container(width: MediaQuery.of(context).size.width * 0.5)),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Wujud fisik larutan Pb(NO3)2 ')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v21 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Wujud fisik larutan KI')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v22 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text(
                'Peristiwa ketika larutan Pb(NO3)2 dan larutan KI dicampur')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v23 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text(
                'B.2. Reaksi antara padatan Na2CO3 dengan larutan HCl',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataCell(Container()),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Wujud fisik larutan HCl')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v24 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Wujud fisik padatan Na2CO3 ')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v25 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text(
                'Peristiwa ketika padatan Na2CO3 dimasukkan ke dalam larutan HCl')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v26 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Kondisi bagian bawah tabung reaksi')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v27 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text(
                'B.3. Reaksi antara larutan KI dengan larutan KMnO4 berasam',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataCell(Container()),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Wujud fisik larutan KI')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v28 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Wujud fisik larutan KMnO4 berasam')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v29 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text(
                'Peristiwa ketika larutan KMnO4 berasam ditambahkan tetes demi tetes ke dalam larutan KI')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v210 = val : {};
              });
            }))
          ],
        ),
      ],
    );
  }

  DataTable PerubahanMateri(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Aspek Yang Diamati')),
        DataColumn(label: Text('Hasil Pengamatan'))
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(
              Text(
                'A.1. Perubahan pada kristal natrium klorida (NaCl)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataCell(Container(width: MediaQuery.of(context).size.width * 0.5)),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Wujud fisik kristal NaCl')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v11 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text(
                'Peristiwa yang terjadi dalam larutan selama proses pelarutan kristal NaCl')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v12 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text(
                'Wujud fisik zat yang tertinggal pada cawan setelah proses penguapan selesai')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v13 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text(
                'A.2.	Perubahan pada pita Mg',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataCell(Container()),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Wujud fisik pita Mg')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v14 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text(
                'Peristiwa yang terjadi dalam larutan hingga pita Mg habis')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v15 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text(
                'Wujud fisik zat yang dihasilkan pada cawan setelah proses penguapan selesai')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v16 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text(
                'A.3.	Perubahan pada kapur barus (naftalena)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataCell(Container()),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Wujud fisik serbuk kapur barus')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v17 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text(
                'Peristiwa yang terjadi dalam Beakerglass selama proses pemanasan kapur barus')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v18 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text(
                'Wujud fisik zat yang menempel pada bagian bawah kaca arloji setelah proses pemanasan selesai')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v19 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text(
                'A.4.	Perubahan pada gula pasir (sukrosa)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataCell(Container()),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Wujud fisik kristal gula pasir')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v110 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text(
                'Peristiwa yang terjadi dalam tabung reaksi selama proses pemanasan gula pasir')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v111 = val : {};
              });
            }))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text(
                'Wujud fisik zat yang dihasilkan pada bagian dasar tabung reaksi')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v112 = val : {};
              });
            }))
          ],
        ),
      ],
    );
  }
}
