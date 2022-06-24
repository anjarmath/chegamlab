import 'package:chegamlab/dosen/dashboardl.dart';
import 'package:chegamlab/student/dashboards.dart';
import 'package:flutter/material.dart';

import '../auth/auth_method.dart';
import '../variabel/_roundedButton.dart';
import '../variabel/_textContainer.dart';
import '../variabel/color.dart';
import '../variabel/utis.dart';

class LectureLogin extends StatefulWidget {
  const LectureLogin({Key? key}) : super(key: key);

  @override
  State<LectureLogin> createState() => _LectureLoginState();
}

class _LectureLoginState extends State<LectureLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isobscure = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      if (_passwordController.text == 'dsn_c123') {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Yeay!'),
            content: Text('Berhasil Login'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'Cancel');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LectureDashboard()));
                  },
                  child: Text("Ok"))
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Oops!'),
            content: Text('Masukkan akun dengan benar'),
            actions: [
              TextButton(
                  onPressed: () {
                    AuthMethods().signOut();
                    Navigator.pop(context, 'Cancel');
                  },
                  child: Text("Ok"))
            ],
          ),
        );
      }

      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, res);
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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        'Login Mahasiswa',
                        style: TextStyle(
                          color: dark,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TextFieldContainer(
                    color: secondary,
                    child: TextField(
                      controller: _emailController,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                      decoration: InputDecoration(
                          hintText: 'email',
                          border: InputBorder.none,
                          icon: Icon(Icons.mail)),
                    ),
                  ),
                  TextFieldContainer(
                    color: secondary,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: _isobscure,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                      decoration: InputDecoration(
                        hintText: 'password',
                        border: InputBorder.none,
                        icon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_isobscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isobscure = !_isobscure;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  RoundedButton(
                      child: !_isLoading
                          ? Text("Masuk")
                          : CircularProgressIndicator(),
                      press: loginUser),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
