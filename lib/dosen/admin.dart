// ignore_for_file: prefer_const_constructors

import 'package:chegamlab/dosen/nilai_mhs.dart';
import 'package:flutter/material.dart';

import '../variabel/color.dart';

class Administrator extends StatefulWidget {
  const Administrator({Key? key}) : super(key: key);

  @override
  State<Administrator> createState() => _AdministratorState();
}

class _AdministratorState extends State<Administrator> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 48, horizontal: 56),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.5,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Admin Soal dan Data',
                        style: TextStyle(
                          color: dark,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Klik untuk mengedit soal pretest, postest, dan mengoreksi data pengamatan peserta didik',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Image.asset(
                            'assets/img/edit tugas.png',
                            height: height,
                            fit: BoxFit.cover,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => NilaiMhs()));
                          },
                          child: Image.asset(
                            'assets/img/penilaian tugas.png',
                            height: height,
                            fit: BoxFit.cover,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Image.asset(
                            'assets/img/laprak.png',
                            height: height,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
