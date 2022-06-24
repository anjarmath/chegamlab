import 'package:chegamlab/dosen/dashboardl.dart';
import 'package:chegamlab/firebase_options.dart';
import 'package:chegamlab/home.dart';
import 'package:chegamlab/student/dashboards.dart';
import 'package:chegamlab/variabel/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

User? firebaseUser;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  firebaseUser = await FirebaseAuth.instance.currentUser;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    Widget halaman;

    if (firebaseUser == null) {
      halaman = Home();
    } else if (firebaseUser != null &&
        firebaseUser!.email == 'dosen@chegam.lab') {
      halaman = LectureDashboard();
    } else {
      halaman = StudentDashboard();
    }
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: halaman,
    );
  }
}
