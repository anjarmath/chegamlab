// ignore_for_file: prefer_const_constructors

import 'package:chegamlab/auth/auth_method.dart';
import 'package:chegamlab/dosen/admin.dart';
import 'package:chegamlab/dosen/akses_kelas.dart';
import 'package:chegamlab/dosen/profile.dart';
import 'package:chegamlab/page_all_user/consultation.dart';
import 'package:flutter/material.dart';

import '../home.dart';
import '../variabel/color.dart';

class LectureDashboard extends StatefulWidget {
  const LectureDashboard({Key? key}) : super(key: key);

  @override
  State<LectureDashboard> createState() => _LectureDashboardState();
}

class _LectureDashboardState extends State<LectureDashboard> {
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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              AuthMethods().signOut().whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
            },
            backgroundColor: Colors.red,
            child: Icon(Icons.logout_rounded),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.4,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: gradient,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Menu Akun Dosen',
                          style: TextStyle(
                            color: dark,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/img/dosen/pp.png',
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 26),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: primary, width: 3),
                          borderRadius: BorderRadius.circular(48)),
                      child: Text(
                        "Lecturer",
                        style: TextStyle(color: primary, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Administrator()));
                            },
                            child: Image.asset(
                              'assets/img/dosen/admin.png',
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AksesKelas()));
                            },
                            child: Image.asset(
                              'assets/img/dosen/permission.png',
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Image.asset(
                              'assets/img/dosen/qna.png',
                              width: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LecturerProfile()));
                            },
                            child: Image.asset(
                              'assets/img/dosen/profile.png',
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Consultation()));
                            },
                            child: Image.asset(
                              'assets/img/dosen/consultation.png',
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
