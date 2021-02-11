import 'package:flutter/material.dart';
import 'package:eduroam_autologin/front/ui_globals.dart';

class AutologinModeButton extends StatelessWidget {
  const AutologinModeButton({@required this.onPressed, this.mode});

  final GestureTapCallback onPressed;
  final bool mode;

  Color _color() {
    if (mode == null) return Colors.black26;
    return mode ? enabledColor : disabledColor;
  }

  TextStyle _textStyle() => TextStyle(
        color: _color(),
        fontSize: 25,
        fontWeight: FontWeight.w100,
      );

  String _text() {
    if (mode == null) return 'Автологин загружается';
    return mode ? 'Автологин включен' : 'Автологин отключен';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: _color()),
        ),
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Text(
            _text(),
            style: _textStyle(),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
