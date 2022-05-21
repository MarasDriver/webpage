import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  String? text;
  // late String text; - to samo co String? - zaciągnie ta daną potem
  Color? color;
  double? size;
  bool? checkbox;

  MyTextWidget({
    this.text,
    this.color,
    this.size,
    this.checkbox,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        decoration:
            checkbox == true ? TextDecoration.lineThrough : TextDecoration.none,
        color: color!,
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }
}
