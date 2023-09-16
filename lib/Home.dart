import 'package:calculator1/Button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String resText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Text("$resText", style: TextStyle(fontSize: 50)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(
                  text: "7",
                  onButtonClick: onDigitClick,
                ),
                Button(text: "8", onButtonClick: onDigitClick),
                Button(text: "9", onButtonClick: onDigitClick),
                Button(text: "*", onButtonClick: onOperatorClick),
                Button(text: "C", onButtonClick: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(text: "4", onButtonClick: onDigitClick),
                Button(text: "5", onButtonClick: onDigitClick),
                Button(text: "6", onButtonClick: onDigitClick),
                Button(text: "/", onButtonClick: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(text: "1", onButtonClick: onDigitClick),
                Button(text: "2", onButtonClick: onDigitClick),
                Button(text: "3", onButtonClick: onDigitClick),
                Button(text: "+", onButtonClick: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(text: ".", onButtonClick: onDigitClick),
                Button(text: "0", onButtonClick: onDigitClick),
                Button(text: "=", onButtonClick: onEqualClick),
                Button(text: "-", onButtonClick: onOperatorClick),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onDigitClick(text) {
    resText += text;
    setState(() {});
  }

  String lhs = " ";

  String operator = " ";

  void onOperatorClick(String clickedOPerator) {
    if (operator.isEmpty) {
      lhs = resText;
    } else {
      String rhs = resText;
      lhs = calculate(lhs, rhs, operator);
    }

    operator = clickedOPerator;
    resText = " ";

    setState(() {});
  }

  String calculate(String lhs, String rhs, String operator) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    double res = 0.0;

    if (operator == "+") {
      res = num1 + num2;
    } else if (operator == "-") {
      res = num1 - num2;
    } else if (operator == "*") {
      res = num1 * num2;
    } else if (operator == "/") {
      res = num1 / num2;
    } else if (operator == "C") {
      resText = " ";
    }

    return res.toString();
  }

  void onEqualClick(text) {
    String rhs = resText;
    resText = calculate(lhs, rhs, operator);
    lhs = " ";
    operator = " ";

    setState(() {});
  }
}
