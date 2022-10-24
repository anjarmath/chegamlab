import 'package:chegamlab/student/posttest2.dart';
import 'package:chegamlab/variabel/utis.dart';
import 'package:flutter/material.dart';

class AfterVlab2 extends StatefulWidget {
  const AfterVlab2({Key? key}) : super(key: key);

  @override
  State<AfterVlab2> createState() => _AfterVlab2State();
}

class _AfterVlab2State extends State<AfterVlab2> {
  // Data 1
  int v112 = 0;
  int v113 = 0;
  int v115 = 0;
  int v122 = 0;
  int v123 = 0;
  int v125 = 0;
  int v132 = 0;
  int v133 = 0;
  int v135 = 0;
  int v142 = 0;
  int v143 = 0;
  int v145 = 0;
  int v152 = 0;
  int v153 = 0;
  int v155 = 0;
  bool p1 = false;
  // Data 2
  int v212 = 0;
  int v214 = 0;
  int v222 = 0;
  int v224 = 0;
  int v232 = 0;
  int v234 = 0;
  int v242 = 0;
  int v244 = 0;
  int v252 = 0;
  int v254 = 0;
  bool p2 = false;
  // Data 3
  int v312 = 0;
  int v314 = 0;
  int v322 = 0;
  int v324 = 0;
  int v332 = 0;
  int v334 = 0;
  int v342 = 0;
  int v344 = 0;
  int v352 = 0;
  int v354 = 0;
  bool p3 = false;
  // Data 4
  int v412 = 0;
  int v414 = 0;
  int v422 = 0;
  int v424 = 0;
  int v432 = 0;
  int v434 = 0;
  int v442 = 0;
  int v444 = 0;
  int v452 = 0;
  int v454 = 0;
  bool p4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Text(
              'Percobaan 1',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Percobaan1(),
            SizedBox(height: 20),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    if (v112 == 26 &&
                        v122 == 26 &&
                        v132 == 26 &&
                        v142 == 26 &&
                        v152 == 26 &&
                        v113 == 46 &&
                        v123 == 46 &&
                        v133 == 46 &&
                        v143 == 46 &&
                        v153 == 46 &&
                        v115 == 35 &&
                        v125 == 35 &&
                        v135 == 34 &&
                        v145 == 34 &&
                        v155 == 33) {
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
                SizedBox(width: 20),
                Container(
                    child: p1 == true
                        ? TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => Dialog(
                                        child: Image.asset(
                                            'assets/img/lab/hasil/hasilvlab11.png'),
                                      ));
                            },
                            child: Text('Hasil'))
                        : Container()),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Percobaan 2',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Percobaan2(),
            SizedBox(height: 20),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    if (v212 == 27 &&
                        v222 == 27 &&
                        v232 == 27 &&
                        v242 == 27 &&
                        v252 == 27 &&
                        v214 == 31 &&
                        v224 == 31 &&
                        v234 == 30 &&
                        v244 == 30 &&
                        v254 == 30) {
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
                SizedBox(width: 20),
                Container(
                    child: p2 == true
                        ? TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => Dialog(
                                        child: Image.asset(
                                            'assets/img/lab/hasil/hasilvlab112.png'),
                                      ));
                            },
                            child: Text('Hasil'))
                        : Container()),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Percobaan 3',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Percobaan3(),
            SizedBox(height: 20),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    if (v312 == 27 &&
                        v322 == 27 &&
                        v332 == 27 &&
                        v342 == 27 &&
                        v352 == 27 &&
                        v314 == 30 &&
                        v324 == 30 &&
                        v334 == 30 &&
                        v344 == 30 &&
                        v354 == 30) {
                      setState(() {
                        p3 = true;
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
                  child: p3 == true
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Container(),
                ),
                SizedBox(width: 20),
                Container(
                    child: p3 == true
                        ? TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => Dialog(
                                        child: Image.asset(
                                            'assets/img/lab/hasil/hasilvlab113.png'),
                                      ));
                            },
                            child: Text('Hasil'))
                        : Container()),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Percobaan 4',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Percobaan4(),
            SizedBox(height: 20),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    if (v412 == 27 &&
                        v422 == 27 &&
                        v432 == 27 &&
                        v442 == 28 &&
                        v452 == 28 &&
                        v414 == 30 &&
                        v424 == 30 &&
                        v434 == 30 &&
                        v444 == 30 &&
                        v454 == 30) {
                      setState(() {
                        p4 = true;
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
                  child: p4 == true
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Container(),
                ),
                SizedBox(width: 20),
                Container(
                    child: p4 == true
                        ? TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => Dialog(
                                        child: Image.asset(
                                            'assets/img/lab/hasil/hasilvlab113.png'),
                                      ));
                            },
                            child: Text('Hasil'))
                        : Container()),
              ],
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                if (p1 && p2 && p3 && p4) {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => Posttest2()));
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

  DataTable Percobaan4() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Menit ke-')),
        DataColumn(label: Text('Suhu Larutan HCl')),
        DataColumn(label: Text('Menit ke-')),
        DataColumn(label: Text('Suhu Campuran larutan HCl dan larutan NH4OH')),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(Text('1')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v312 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('7')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v214 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('2')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v222 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('8')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v224 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('3')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v232 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('9')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v234 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('4')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v242 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('10')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v244 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('5')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v252 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('11')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v254 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
      ],
    );
  }

  DataTable Percobaan3() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Menit ke-')),
        DataColumn(label: Text('Suhu Larutan HCl')),
        DataColumn(label: Text('Menit ke-')),
        DataColumn(label: Text('Suhu Campuran larutan HCl dan larutan NH4OH')),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(Text('1')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v312 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('7')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v214 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('2')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v222 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('8')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v224 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('3')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v232 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('9')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v234 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('4')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v242 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('10')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v244 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('5')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v252 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('11')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v254 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
      ],
    );
  }

  DataTable Percobaan2() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Menit ke-')),
        DataColumn(label: Text('Suhu Larutan HCl')),
        DataColumn(label: Text('Menit ke-')),
        DataColumn(label: Text('Suhu Campuran larutan HCl dan larutan NH4OH')),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(Text('1')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v312 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('7')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v314 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('2')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v322 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('8')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v324 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('3')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v332 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('9')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v334 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('4')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v342 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('10')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v344 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('5')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v352 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('11')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v354 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
      ],
    );
  }

  DataTable Percobaan1() {
    return DataTable(
      columns: [
        // Menit ke-	Suhu Air Dingin	Suhu Air Panas	Menit ke-	Suhu campuran
        DataColumn(label: Text('Menit ke-')),
        DataColumn(label: Text('Suhu Air Dingin')),
        DataColumn(label: Text('Suhu Air Panas')),
        DataColumn(label: Text('Menit ke-')),
        DataColumn(label: Text('Suhu Campuran')),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(Text('1')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v112 = int.tryParse(val)! : {};
              });
            })),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v113 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('7')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v115 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('2')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v122 = int.tryParse(val)! : {};
              });
            })),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v123 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('8')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v125 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('3')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v132 = int.tryParse(val)! : {};
              });
            })),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v133 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('9')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v135 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('4')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v142 = int.tryParse(val)! : {};
              });
            })),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v143 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('10')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v145 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('5')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v152 = int.tryParse(val)! : {};
              });
            })),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v153 = int.tryParse(val)! : {};
              });
            })),
            DataCell(Text('11')),
            DataCell(TextField(onChanged: (val) {
              setState(() {
                val.isNotEmpty ? v155 = int.tryParse(val)! : {};
              });
            })),
          ],
        ),
      ],
    );
  }
}
