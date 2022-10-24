// ignore_for_file: prefer_const_constructors

import 'package:chegamlab/variabel/akses.dart';
import 'package:flutter/material.dart';

import '../variabel/color.dart';

class AksesKelas extends StatefulWidget {
  const AksesKelas({Key? key}) : super(key: key);

  @override
  State<AksesKelas> createState() => _AksesKelasState();
}

class _AksesKelasState extends State<AksesKelas> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(children: [
      Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
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
                          'Akses Kelas',
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
                  child: Akses(),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
