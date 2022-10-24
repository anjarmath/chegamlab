import 'package:chegamlab/auth/auth_method.dart';
import 'package:chegamlab/student/vlab_menu.dart';
import 'package:chegamlab/variabel/utis.dart';
import 'package:flutter/material.dart';

class Posttest1 extends StatefulWidget {
  const Posttest1({Key? key}) : super(key: key);

  @override
  State<Posttest1> createState() => _Posttest1State();
}

class _Posttest1State extends State<Posttest1> {
  var gambar = [
    'assets/img/lab/prepost/soalv4/1.png',
    'assets/img/lab/prepost/soalv4/2.png',
    'assets/img/lab/prepost/soalv4/3.png',
    'assets/img/lab/prepost/soalv4/4.png',
    'assets/img/lab/prepost/soalv4/5.png',
    'assets/img/lab/prepost/soalv4/6.png',
    'assets/img/lab/prepost/soalv4/7.png',
    'assets/img/lab/prepost/soalv4/8.png',
    'assets/img/lab/prepost/soalv4/9.png',
    'assets/img/lab/prepost/soalv4/10.png',
  ];

  double no1 = 0.0;
  double no2 = 0.0;
  double no3 = 0.0;
  double no4 = 0.0;
  double no5 = 0.0;
  double no6 = 0.0;
  double no7 = 0.0;
  double no8 = 0.0;
  double no9 = 0.0;
  double no10 = 0.0;

  var nilai = [
    // DBACCDBAEA
    [0.1, 0.2, 0.3, 10.0, 0.4],
    [0.1, 10.0, 0.3, 0.2, 0.4],
    [10.0, 0.2, 0.3, 0.1, 0.4],
    [0.1, 0.2, 10.0, 0.3, 0.4],
    [0.1, 0.2, 10.0, 0.3, 0.4],
    [0.1, 0.2, 0.3, 10.0, 0.4],
    [0.1, 10.0, 0.3, 0.2, 0.4],
    [10.0, 0.2, 0.3, 0.1, 0.4],
    [0.1, 0.2, 0.3, 0.4, 10.0],
    [10.0, 0.2, 0.3, 0.4, 0.1],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            int total = no1.toInt() +
                no2.toInt() +
                no3.toInt() +
                no4.toInt() +
                no5.toInt() +
                no6.toInt() +
                no7.toInt() +
                no8.toInt() +
                no9.toInt() +
                no10.toInt();

            String res = await AuthMethods()
                .addNilaiPosttest(nilai: total, pertemuan: 4);
            if (res == 'success') {
              showDialog(
                context: context,
                builder: (_) => Dialog(
                  child: Container(
                    width: MediaQuery.of(context).size.height * 0.8,
                    height: MediaQuery.of(context).size.height * 0.8,
                    padding: EdgeInsets.all(22),
                    child: Column(
                      children: [
                        Text(total.toString(), style: TextStyle(fontSize: 48)),
                        Container(
                          child: total >= 80
                              ? Text('Selamat! Anda Lulus!')
                              : Text('Anda Belum Lulus!'),
                        ),
                        Expanded(child: Container()),
                        TextButton(
                          onPressed: () async {
                            if (total >= 80) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => VlabMenu()));
                            } else {
                              Navigator.pop(context);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 24),
                            color: Colors.blue,
                            child: Text(
                              'Lanjutkan',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              showSnackBar(context, res);
            }
          },
          child: Icon(Icons.send)),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, position) {
          return Container(
            child: Column(
              children: [
                Image.asset(gambar[position],
                    width: MediaQuery.of(context).size.width * .8,
                    fit: BoxFit.cover),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Column(
                        children: [
                          RadioListTile(
                            title: Text("A"),
                            value: nilai[position][0],
                            groupValue: position == 0
                                ? no1
                                : position == 1
                                    ? no2
                                    : position == 2
                                        ? no3
                                        : position == 3
                                            ? no4
                                            : position == 4
                                                ? no5
                                                : position == 5
                                                    ? no6
                                                    : position == 6
                                                        ? no7
                                                        : position == 7
                                                            ? no8
                                                            : position == 8
                                                                ? no9
                                                                : no10,
                            onChanged: (value) {
                              setState(() {
                                position == 0
                                    ? no1 = double.tryParse(value.toString())!
                                    : position == 1
                                        ? no2 =
                                            double.tryParse(value.toString())!
                                        : position == 2
                                            ? no3 = double.tryParse(
                                                value.toString())!
                                            : position == 3
                                                ? no4 = double.tryParse(
                                                    value.toString())!
                                                : position == 4
                                                    ? no5 = double.tryParse(
                                                        value.toString())!
                                                    : position == 5
                                                        ? no6 = double.tryParse(
                                                            value.toString())!
                                                        : position == 6
                                                            ? no7 = double
                                                                .tryParse(value
                                                                    .toString())!
                                                            : position == 7
                                                                ? no8 = double
                                                                    .tryParse(value
                                                                        .toString())!
                                                                : position == 8
                                                                    ? no9 = double.tryParse(
                                                                        value
                                                                            .toString())!
                                                                    : no10 =
                                                                        double.tryParse(value.toString())!;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Column(
                        children: [
                          RadioListTile(
                            title: Text("B"),
                            value: nilai[position][1],
                            groupValue: position == 0
                                ? no1
                                : position == 1
                                    ? no2
                                    : position == 2
                                        ? no3
                                        : position == 3
                                            ? no4
                                            : position == 4
                                                ? no5
                                                : position == 5
                                                    ? no6
                                                    : position == 6
                                                        ? no7
                                                        : position == 7
                                                            ? no8
                                                            : position == 8
                                                                ? no9
                                                                : no10,
                            onChanged: (value) {
                              setState(() {
                                position == 0
                                    ? no1 = double.tryParse(value.toString())!
                                    : position == 1
                                        ? no2 =
                                            double.tryParse(value.toString())!
                                        : position == 2
                                            ? no3 = double.tryParse(
                                                value.toString())!
                                            : position == 3
                                                ? no4 = double.tryParse(
                                                    value.toString())!
                                                : position == 4
                                                    ? no5 = double.tryParse(
                                                        value.toString())!
                                                    : position == 5
                                                        ? no6 = double.tryParse(
                                                            value.toString())!
                                                        : position == 6
                                                            ? no7 = double
                                                                .tryParse(value
                                                                    .toString())!
                                                            : position == 7
                                                                ? no8 = double
                                                                    .tryParse(value
                                                                        .toString())!
                                                                : position == 8
                                                                    ? no9 = double.tryParse(
                                                                        value
                                                                            .toString())!
                                                                    : no10 =
                                                                        double.tryParse(value.toString())!;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Column(
                        children: [
                          RadioListTile(
                            title: Text("C"),
                            value: nilai[position][2],
                            groupValue: position == 0
                                ? no1
                                : position == 1
                                    ? no2
                                    : position == 2
                                        ? no3
                                        : position == 3
                                            ? no4
                                            : position == 4
                                                ? no5
                                                : position == 5
                                                    ? no6
                                                    : position == 6
                                                        ? no7
                                                        : position == 7
                                                            ? no8
                                                            : position == 8
                                                                ? no9
                                                                : no10,
                            onChanged: (value) {
                              setState(() {
                                position == 0
                                    ? no1 = double.tryParse(value.toString())!
                                    : position == 1
                                        ? no2 =
                                            double.tryParse(value.toString())!
                                        : position == 2
                                            ? no3 = double.tryParse(
                                                value.toString())!
                                            : position == 3
                                                ? no4 = double.tryParse(
                                                    value.toString())!
                                                : position == 4
                                                    ? no5 = double.tryParse(
                                                        value.toString())!
                                                    : position == 5
                                                        ? no6 = double.tryParse(
                                                            value.toString())!
                                                        : position == 6
                                                            ? no7 = double
                                                                .tryParse(value
                                                                    .toString())!
                                                            : position == 7
                                                                ? no8 = double
                                                                    .tryParse(value
                                                                        .toString())!
                                                                : position == 8
                                                                    ? no9 = double.tryParse(
                                                                        value
                                                                            .toString())!
                                                                    : no10 =
                                                                        double.tryParse(value.toString())!;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Column(
                        children: [
                          RadioListTile(
                            title: Text("D"),
                            value: nilai[position][3],
                            groupValue: position == 0
                                ? no1
                                : position == 1
                                    ? no2
                                    : position == 2
                                        ? no3
                                        : position == 3
                                            ? no4
                                            : position == 4
                                                ? no5
                                                : position == 5
                                                    ? no6
                                                    : position == 6
                                                        ? no7
                                                        : position == 7
                                                            ? no8
                                                            : position == 8
                                                                ? no9
                                                                : no10,
                            onChanged: (value) {
                              setState(() {
                                position == 0
                                    ? no1 = double.tryParse(value.toString())!
                                    : position == 1
                                        ? no2 =
                                            double.tryParse(value.toString())!
                                        : position == 2
                                            ? no3 = double.tryParse(
                                                value.toString())!
                                            : position == 3
                                                ? no4 = double.tryParse(
                                                    value.toString())!
                                                : position == 4
                                                    ? no5 = double.tryParse(
                                                        value.toString())!
                                                    : position == 5
                                                        ? no6 = double.tryParse(
                                                            value.toString())!
                                                        : position == 6
                                                            ? no7 = double
                                                                .tryParse(value
                                                                    .toString())!
                                                            : position == 7
                                                                ? no8 = double
                                                                    .tryParse(value
                                                                        .toString())!
                                                                : position == 8
                                                                    ? no9 = double.tryParse(
                                                                        value
                                                                            .toString())!
                                                                    : no10 =
                                                                        double.tryParse(value.toString())!;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Column(
                        children: [
                          RadioListTile(
                            title: Text("E"),
                            value: nilai[position][4],
                            groupValue: position == 0
                                ? no1
                                : position == 1
                                    ? no2
                                    : position == 2
                                        ? no3
                                        : position == 3
                                            ? no4
                                            : position == 4
                                                ? no5
                                                : position == 5
                                                    ? no6
                                                    : position == 6
                                                        ? no7
                                                        : position == 7
                                                            ? no8
                                                            : position == 8
                                                                ? no9
                                                                : no10,
                            onChanged: (value) {
                              setState(() {
                                position == 0
                                    ? no1 = double.tryParse(value.toString())!
                                    : position == 1
                                        ? no2 =
                                            double.tryParse(value.toString())!
                                        : position == 2
                                            ? no3 = double.tryParse(
                                                value.toString())!
                                            : position == 3
                                                ? no4 = double.tryParse(
                                                    value.toString())!
                                                : position == 4
                                                    ? no5 = double.tryParse(
                                                        value.toString())!
                                                    : position == 5
                                                        ? no6 = double.tryParse(
                                                            value.toString())!
                                                        : position == 6
                                                            ? no7 = double
                                                                .tryParse(value
                                                                    .toString())!
                                                            : position == 7
                                                                ? no8 = double
                                                                    .tryParse(value
                                                                        .toString())!
                                                                : position == 8
                                                                    ? no9 = double.tryParse(
                                                                        value
                                                                            .toString())!
                                                                    : no10 =
                                                                        double.tryParse(value.toString())!;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20)
              ],
            ),
          );
        },
      ),
    );
  }
}
