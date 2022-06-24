import 'package:chegamlab/auth/auth_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../variabel/_roundedButton.dart';
import '../variabel/_textContainer.dart';
import '../variabel/color.dart';
import '../variabel/utis.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _nimController.dispose();
  }

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
    setState(() {
      if (data.data() != null) {
        _nameController.text = data.data()!['nama'];
        _nimController.text = data.data()!['nim'];
      }
    });
    return 'sukses';
  }

  void setProfile() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods()
        .addprofileMhs(nama: _nameController.text, nim: _nimController.text);
    if (res == 'success') {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Yeay!'),
          content: Text('Berhasil Lengkapi Profil'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context, 'Cancel');
                },
                child: Text("Ok"))
          ],
        ),
      );

      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, res);
    }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      throw UnimplementedError();
    }
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
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(top: 48),
                  decoration: BoxDecoration(
                    gradient: gradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Profil Mahasiswa',
                      style: TextStyle(
                        color: dark,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFieldContainer(
                  color: Colors.white,
                  child: TextField(
                      controller: _nameController,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                      decoration: InputDecoration(
                          hintText: 'Nama',
                          border: InputBorder.none,
                          icon: Icon(Icons.person))),
                ),
                TextFieldContainer(
                  color: Colors.white,
                  child: TextField(
                    controller: _nimController,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    decoration: InputDecoration(
                        hintText: 'NIM',
                        border: InputBorder.none,
                        icon: Icon(Icons.account_box)),
                  ),
                ),
                RoundedButton(
                    child: !_isLoading
                        ? Text("Atur Profil")
                        : CircularProgressIndicator(),
                    press: setProfile),
              ],
            ),
          ),
        )
      ],
    );
  }
}
