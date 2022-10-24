// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../variabel/color.dart';

class StudentMaterialPage extends StatefulWidget {
  final int materi;
  const StudentMaterialPage({
    Key? key,
    required this.materi,
  }) : super(key: key);

  @override
  State<StudentMaterialPage> createState() {
    return _StudentMaterialPageState(this.materi);
  }
}

class _StudentMaterialPageState extends State<StudentMaterialPage> {
  var source;
  final int materi;
  _StudentMaterialPageState(this.materi);
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    if (materi == 0) {
      source =
          'https://drive.google.com/file/d/19cDkHJA6RuvblvbaF5_HzOxO17lo5R2j/view?usp=sharing';
    } else if (materi == 1) {
      source =
          'https://drive.google.com/file/d/1A_KENowox_6cyCdzeIAMlbjsYrV6PJoC/view?usp=sharing';
    } else if (materi == 2) {
      source =
          ' https://drive.google.com/file/d/1wz8iZdF-dOVBYdbg-i4tJ5HnXac2WAqK/view?usp=sharing';
    } else if (materi == 3) {
      source =
          'https://drive.google.com/file/d/1gv-v5i9EkMLl7N-UAP3tcFUdrbcESoD5/view?usp=sharing';
    } else if (materi == 4) {
      source =
          'https://drive.google.com/file/d/1EzZMn4PBBgpL-Wq0uNoIGBPTe2Tnp5mh/view?usp=drivesdk';
    } else if (materi == 5) {
      source = 'https://youtu.be/eGGNKAYWBRg';
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var _key = UniqueKey();

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
                            'Modul Belajar',
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
                    child: WebView(
                      key: _key,
                      initialUrl: source,
                      javascriptMode: JavascriptMode.unrestricted,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
