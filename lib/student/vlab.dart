import 'package:chegamlab/student/aftervlab1.dart';
import 'package:chegamlab/variabel/color.dart';
import 'package:chegamlab/variabel/utis.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VirtualLab1 extends StatefulWidget {
  const VirtualLab1({Key? key}) : super(key: key);

  @override
  State<VirtualLab1> createState() => _VirtualLab1State();
}

class _VirtualLab1State extends State<VirtualLab1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => AfterVlab1()));
        },
        child: Icon(Icons.close),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: WebView(
        initialUrl: 'https://v6p9d9t4.ssl.hwcdn.net/html/6573879/index.html',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
