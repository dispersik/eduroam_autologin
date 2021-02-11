import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConnectToEduroamButton extends StatelessWidget {
  ConnectToEduroamButton({@required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
        ),
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Text(
            "Тестовый запуск",
            style: TextStyle(
              color: Colors.black45,
              fontSize: 25,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      ),
    );
  }
}