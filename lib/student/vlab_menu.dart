import 'package:chegamlab/student/pretest2.dart';
import 'package:chegamlab/student/pretest4.dart';
import 'package:chegamlab/student/vlab.dart';
import 'package:chegamlab/student/vlab2.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

import '../variabel/color.dart';

class VlabMenu extends StatefulWidget {
  const VlabMenu({Key? key}) : super(key: key);

  @override
  State<VlabMenu> createState() => _VlabMenuState();
}

class _VlabMenuState extends State<VlabMenu> {
  var gambarItem = [
    'assets/img/lab/percobaan1.png',
    'assets/img/lab/percobaan2.png',
    'assets/img/lab/percobaan3.png',
    'assets/img/lab/percobaan4.png',
    'assets/img/lab/percobaan5.png',
    'assets/img/lab/percobaan6.png',
    'assets/img/lab/percobaan7.png',
    'assets/img/lab/percobaan8.png',
    'assets/img/lab/percobaan9.png',
    'assets/img/lab/percobaan10.png',
    'assets/img/lab/percobaan11.png',
  ];

  PDFDocument? document;

  // final pdfController = PdfController(
  //   document: PdfDocument.openAsset('assets/info.pdf'),
  // );

  @override
  void initState() {
    // TODO: implement initState
    loadDocument();
    super.initState();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/info.pdf');
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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  content: PDFViewer(document: document!),
                ),
              );
            },
            child: Icon(Icons.info_outline_rounded),
          ),
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
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 4 / 2.5,
                      ),
                      itemCount: gambarItem.length,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (index == 3) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Pretest1()));
                            } else if (index == 10) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Pretest2()));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Kelas Terkunci!')));
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(16),
                            margin: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: index == 3 || index == 10
                                  ? Colors.green.withOpacity(0.7)
                                  : Colors.red.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  gambarItem[index],
                                  height: height * 0.4,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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
