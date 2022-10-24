import 'package:chegamlab/variabel/color.dart';
import 'package:flutter/material.dart';

class TextFieldContainerPrepost extends StatelessWidget {
  final Widget child;
  final Color color;
  const TextFieldContainerPrepost({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}
