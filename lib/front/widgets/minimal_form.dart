import 'package:flutter/material.dart';

class MinimalForm extends StatelessWidget {
  MinimalForm(
      {@required this.text, this.hintText, this.onChanged, this.controller});

  final String text;
  final String hintText;
  final Function(String) onChanged;
  final TextEditingController controller;

  static const TextStyle _styleDarkValue = TextStyle(
    color: Colors.black38,
    fontSize: 20,
    fontWeight: FontWeight.w200,
  );

  static const TextStyle _styleDarkKey = TextStyle(
    color: Colors.black54,
    fontSize: 20,
    fontWeight: FontWeight.w300,
  );

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Text(
          text,
          textAlign: TextAlign.left,
          style: _styleDarkKey,
        ),
      ]),
      Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              style: _styleDarkValue,
              onChanged: onChanged,
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none, isDense: true, hintText: hintText),
            ),
          ),
        ],
      ),
    ]);
  }
}
