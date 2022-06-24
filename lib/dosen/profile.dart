import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth/auth_method.dart';
import '../variabel/_roundedButton.dart';
import '../variabel/_textContainer.dart';
import '../variabel/color.dart';
import '../variabel/utis.dart';

class LecturerProfile extends StatefulWidget {
  const LecturerProfile({Key? key}) : super(key: key);

  @override
  State<LecturerProfile> createState() => _LecturerProfileState();
}

class _LecturerProfileState extends State<LecturerProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nipController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _nipController.dispose();
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
        _nipController.text = data.data()!['nip'];
      }
    });
    return 'sukses';
  }

  void setProfile() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods()
        .addprofileDsn(nama: _nameController.text, nip: _nipController.text);
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
                    controller: _nipController,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    decoration: InputDecoration(
                        hintText: 'NIP',
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
