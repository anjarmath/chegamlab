// ignore_for_file: prefer_const_constructors

import 'package:chegamlab/dosen/dashboardl.dart';
import 'package:chegamlab/dosen/login.dart';
import 'package:chegamlab/student/dashboards.dart';
import 'package:chegamlab/student/login.dart';
import 'package:chegamlab/variabel/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              image: AssetImage('assets/img/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
                    'Fitur Virtual Lab',
                    style: TextStyle(
                      color: dark,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 48),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => StudentLogin()));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/img/student.png',
                            width: 160,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: primary, width: 3),
                                borderRadius: BorderRadius.circular(48)),
                            child: Text(
                              "Student",
                              style: TextStyle(color: primary, fontSize: 24),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/img/chegam_home.png',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => LectureLogin()));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/img/lecture.png',
                            width: 160,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: primary, width: 3),
                                borderRadius: BorderRadius.circular(48)),
                            child: Text(
                              "Lecture",
                              style: TextStyle(color: primary, fontSize: 24),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
