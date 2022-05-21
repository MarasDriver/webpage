import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webpage/widgets/text_widget.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int width = Random().nextInt(100) + 140;
  int height = Random().nextInt(100) + 140;
  int index = 0;
  List<Color> kolorki = [
    Colors.black,
    Colors.green,
    Colors.pink,
    Colors.blue,
    Colors.cyan,
    Colors.pink.shade400,
    Colors.grey.shade700,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  width: width.toDouble() + 140,
                  height: height.toDouble() + 140,
                  color: kolorki[index],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 250.0),
                child: Center(
                  child: MaterialButton(
                    color: Colors.blue[400],
                    shape: StadiumBorder(),
                    onPressed: () {
                      setState(() {
                        width = Random().nextInt(100);
                        height = Random().nextInt(100);
                        index = Random().nextInt(kolorki.length - 1);
                      });
                    },
                    child: MyTextWidget(
                      color: Colors.pink,
                      size: 40.0,
                      text: "Don't do this",
                    ),
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
