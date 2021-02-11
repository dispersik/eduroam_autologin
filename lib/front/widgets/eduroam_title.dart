import 'package:flutter/material.dart';

class EduroamTitle extends StatelessWidget {
  const EduroamTitle();
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        "eduroam autologin",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 40,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }
}
