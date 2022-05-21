import 'package:flutter/material.dart';
import 'package:webpage/screens/screen1_home.dart';
import 'package:webpage/screens/screen2_calc.dart';
import 'package:webpage/screens/screen3_todo.dart';
import 'package:webpage/widgets/text_widget.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens = [
    Container(child: ScreenHome()),
    Container(child: CalculatorPage()),
    Container(child: TodoPage())
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(children: [
            TextButton(
                child: MyTextWidget(
                  size: 20.0,
                  color: Colors.black,
                  text: "Kliken Machen",
                ),
                onPressed: () {
                  setState(() {
                    index = 0;
                    Navigator.of(context).pop();
                  });
                }),
            TextButton(
                child: MyTextWidget(
                  size: 20.0,
                  color: Colors.black,
                  text: "Calculator",
                ),
                onPressed: () {
                  setState(() {
                    index = 1;
                    Navigator.of(context).pop();
                  });
                }),
            TextButton(
                child: MyTextWidget(
                  size: 20.0,
                  color: Colors.black,
                  text: "Lista zadań",
                ),
                onPressed: () {
                  setState(() {
                    index = 2;
                    Navigator.of(context).pop();
                  });
                })
          ]),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: MyTextWidget(
            text: "Launcher",
            color: Colors.black,
            size: 20,
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomAppBar(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                },
                icon: Icon(Icons.menu)),
            IconButton(
                onPressed: () {
                  setState(() {
                    index = 1;
                  });
                },
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  setState(() {
                    index = 2;
                  });
                },
                icon: Icon(Icons.done)),
          ]),
        ),
        body: screens[index],
      ),
    );
  }
}
