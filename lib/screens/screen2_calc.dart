import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:webpage/widgets/text_widget.dart';

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String? equation;
  String? sum;

  @override
  void initState() {
    super.initState();
    equation = "";
    sum = "0";
  }

  List listButtons = [
    Row(
      children: [
        const Icon(
          TablerIcons.plus,
          size: 20,
          color: Colors.black,
        ),
        MyTextWidget(
          size: 20,
          color: Colors.black,
          text: "/",
        ),
        const Icon(
          TablerIcons.minus,
          size: 20,
          color: Colors.black,
        ),
      ],
    ),
    "0",
    ".",
    Icon(
      TablerIcons.equal,
      size: 40,
      color: Colors.black,
    ),
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "x",
    "CE",
    "C",
    Icon(
      TablerIcons.backspace,
      size: 40,
      color: Colors.black,
    ),
    "/",
    Icon(
      TablerIcons.percentage,
      size: 40,
      color: Colors.black,
    ),
    Icon(
      TablerIcons.square_root,
      size: 40,
      color: Colors.black,
    ),
    Icon(
      TablerIcons.superscript,
      size: 40,
      color: Colors.black,
    ),
    "1/x",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            // crossAxisAlignment: CrossAxisAlignment.end, // to do Column zamiast ListView
            // mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 16,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    MyTextWidget(
                      text: equation,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyTextWidget(
                    text: sum,
                    color: Colors.black,
                    size: 35,
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Divider(
                thickness: 1.5,
                color: Colors.grey,
              ),
              // Container(
              //   width: 250.0,
              //   height: 100.0,
              //   child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       shrinkWrap: true,
              //       itemCount: 4,
              //       itemBuilder: (ctxt, index) {
              //         return myButton(fuctionsButtons[index], () {});
              //       }),
              // ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: listButtons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, childAspectRatio: 1.11),
                  itemBuilder: (contx, index) {
                    return myButton(listButtons[index], () {
                      //  || -> or
                      // && -> and
                      if (listButtons[index] is String &&
                          listButtons[index] != "CE" &&
                          listButtons[index] != "C") {
                        setState(() {
                          equation = equation! + listButtons[index];
                        });
                      }

                      if (listButtons[index] is String &&
                          listButtons[index] == "C") {
                        setState(() {
                          equation = "";
                          sum = "0";
                        });
                      }
                      if (listButtons[index] is String &&
                          listButtons[index] == "1/x") {
                        setState(() {
                          equation = equation!;
                          sumFunction();
                        });
                      }
                      if (listButtons[index] is Icon) {
                        Icon icon = listButtons[index];
                        if (icon.icon == TablerIcons.backspace) {
                          setState(() {
                            equation =
                                equation!.substring(0, equation!.length - 1);
                          });
                        } else if (icon.icon == TablerIcons.equal) {
                          sumFunction();
                        }

                        if (icon.icon == TablerIcons.percentage) {
                          setState(() {
                            sum = (double.parse(sum!) * 0.01).toString();
                            // equation = "($equation) * 0.01";
                            // sumFunction();
                            // equation = equation! + "%";
                          });
                        }

                        if (icon.icon == TablerIcons.square_root) {
                          setState(() {
                            double one = double.parse(equation!);
                            // double one = double.parse(sum!);
                            sqrt(one);
                            double equation2 = sqrt(one);
                            equation = equation2.toStringAsFixed(5);
                            sumFunction();
                          });
                        }
                        if (icon.icon == TablerIcons.superscript) {
                          setState(() {
                            // equation = "($equation)^2";
                            equation = equation! + "*" + equation!;
                            sumFunction();
                          });
                        }
                      }
                    }, index >= listButtons.length - 4 ? Colors.white : null);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  sumFunction() {
    Parser p = Parser();
    String input = equation!.replaceAll("x", "*");
    Expression exp = p.parse(input);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      sum = eval.toStringAsFixed(5);
    });
  }

  Widget myButton(
    buttonConntent,
    function,
    color,
  ) {
    color = color ?? Colors.blueGrey[50];
    return MaterialButton(
      elevation: 0,
      color: color,
      child: (buttonConntent is String)
          ? MyTextWidget(
              color: Colors.black,
              size: 25,
              text: buttonConntent,
            )
          : buttonConntent,
      onPressed: function,
    );
  }
}
