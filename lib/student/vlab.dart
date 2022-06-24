import 'package:chegamlab/variabel/color.dart';
import 'package:chegamlab/variabel/utis.dart';
import 'package:flutter/material.dart';

class VirtualLab extends StatefulWidget {
  const VirtualLab({Key? key}) : super(key: key);

  @override
  State<VirtualLab> createState() => _VirtualLabState();
}

class _VirtualLabState extends State<VirtualLab> {
  int drag = 0;
  double radius = 5;

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
              image: AssetImage('assets/img/bg_gold.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (drag == 0) {
                showSnackBar(context, 'Selesaikan proses terlebih dahulu!');
              } else {}
            },
            backgroundColor: drag == 0 ? Colors.red : Colors.green,
            child: Icon(Icons.skip_next_rounded),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Draggable<int>(
                              data: 1,
                              child: Image.asset(
                                'assets/img/lab/flask.png',
                                width: height * 0.3,
                              ),
                              feedback: Image.asset(
                                'assets/img/lab/flask.png',
                                width: height * 0.3,
                              ),
                              childWhenDragging: Container(
                                width: height * 0.3,
                                height: height * 0.3,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: drag == 0
                                  ? Text('Belum di drag')
                                  : Text('Sudah di drag'),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/img/lab/panah.png',
                          width: width * 0.1,
                          height: width * 0.15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DragTarget<int>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return drag == 0
                                    ? Container(
                                        width: height * 0.3,
                                        height: height * 0.3,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      )
                                    : Stack(
                                        children: [
                                          Image.asset(
                                            'assets/img/lab/flask.png',
                                            width: height * 0.3,
                                          ),
                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            child: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  drag = 0;
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(12),
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Icon(
                                                  Icons.cancel_outlined,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                              },
                              onAccept: (int data) {
                                setState(() {
                                  drag = data;
                                });
                              },
                            ),
                            Image.asset(
                              'assets/img/lab/danger.png',
                              width: height * 0.3,
                            ),
                          ],
                        ),
                      ],
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
