import 'package:chegamlab/auth/auth_method.dart';
import 'package:chegamlab/home.dart';
import 'package:chegamlab/page_all_user/consultation.dart';
import 'package:chegamlab/page_all_user/glosarium.dart';
import 'package:chegamlab/student/list_materi.dart';
import 'package:chegamlab/student/studentmaterial.dart';
import 'package:chegamlab/student/profil.dart';
import 'package:chegamlab/student/vlab.dart';
import 'package:chegamlab/student/vlab_menu.dart';
import 'package:chegamlab/variabel/utis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../variabel/color.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({Key? key}) : super(key: key);

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMarker();
  }

  Future<String> getMarker() async {
    final data = await _firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (data.data() == null) {
      await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'nama': 'user',
        'nim': '0',
        'pretest 4': 0,
        'pretest 11': 0,
        'posttest 4': 0,
        'posttest 11': 0,
      });
    }
    return 'sukses';
  }

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
                          'Menu Akun Mahasiswa',
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
                    Image.asset(
                      'assets/img/student/pp.png',
                      width: height * 0.3,
                      fit: BoxFit.cover,
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
                        "Student",
                        style: TextStyle(color: primary, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => StudentProfile()));
                            },
                            child: Image.asset(
                              'assets/img/student/profile.png',
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => VlabMenu()));
                            },
                            child: Image.asset(
                              'assets/img/student/virtual_lab.png',
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 50),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ListMateri()));
                            },
                            child: Image.asset(
                              'assets/img/student/material.png',
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Glosarium()));
                            },
                            child: Image.asset(
                              'assets/img/student/glossary.png',
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 100),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Consultation()));
                            },
                            child: Image.asset(
                              'assets/img/student/consultation.png',
                              width: 110,
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
