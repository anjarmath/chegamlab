import 'package:chegamlab/student/studentmaterial.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../variabel/color.dart';
import '../variabel/list_materi_item.dart';

class ListMateri extends StatefulWidget {
  const ListMateri({Key? key}) : super(key: key);

  @override
  State<ListMateri> createState() => _ListMateriState();
}

class _ListMateriState extends State<ListMateri> {
  var link = [
    'https://drive.google.com/file/d/19cDkHJA6RuvblvbaF5_HzOxO17lo5R2j/view?usp=sharing',
    'https://drive.google.com/file/d/1A_KENowox_6cyCdzeIAMlbjsYrV6PJoC/view?usp=sharing',
    'https://drive.google.com/file/d/1wz8iZdF-dOVBYdbg-i4tJ5HnXac2WAqK/view?usp=sharing',
    'https://drive.google.com/file/d/1gv-v5i9EkMLl7N-UAP3tcFUdrbcESoD5/view?usp=sharing',
    'https://drive.google.com/file/d/1EzZMn4PBBgpL-Wq0uNoIGBPTe2Tnp5mh/view?usp=drivesdk',
    'https://youtu.be/eGGNKAYWBRg'
  ];
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
                    child: ListView.builder(
                      itemCount: listMateriItem.length,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () async {
                            if (!await launchUrl(Uri.parse(link[index]))) {
                              throw 'Tidak dapat membuka $link[index]';
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(16),
                            margin: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listMateriItem[index].nama,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
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
