import 'package:chegamlab/student/aftervlab1.dart';
import 'package:chegamlab/student/aftervlab2.dart';
import 'package:chegamlab/variabel/color.dart';
import 'package:chegamlab/variabel/utis.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VirtualLab2 extends StatefulWidget {
  const VirtualLab2({Key? key}) : super(key: key);

  @override
  State<VirtualLab2> createState() => _VirtualLab2State();
}

class _VirtualLab2State extends State<VirtualLab2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => AfterVlab2()));
        },
        child: Icon(Icons.close),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: WebView(
        initialUrl: 'https://v6p9d9t4.ssl.hwcdn.net/html/6638601/index.html',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
