import 'package:chegamlab/variabel/glosarium_item.dart';
import 'package:flutter/material.dart';

import '../variabel/color.dart';

class Glosarium extends StatefulWidget {
  const Glosarium({Key? key}) : super(key: key);

  @override
  State<Glosarium> createState() => _GlosariumState();
}

class _GlosariumState extends State<Glosarium> {
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
                            'Glosarium',
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
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListView.builder(
                      itemCount: glosariumItem.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: primary.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: secondary.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(48),
                                ),
                                child: Icon(
                                  Icons.catching_pokemon_outlined,
                                  color: Colors.indigo,
                                  size: 48,
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    glosariumItem[index].nama,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    glosariumItem[index].deskripsi,
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
