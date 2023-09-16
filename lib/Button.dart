import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String text;
  Function onButtonClick;

  Button({required this.text, required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
            margin: EdgeInsets.all(2),
            child: ElevatedButton(
                onPressed: () {
                  onButtonClick(text);
                },
                child: Text(
                  "$text",
                  style: TextStyle(fontSize: 40),
                ))));
  }
}
