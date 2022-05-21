import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webpage/widgets/text_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WILKOMEN PAGEN MACHEN"),
        centerTitle: true,
      ),
    );
  }
}
