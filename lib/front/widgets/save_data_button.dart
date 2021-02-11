import 'package:flutter/material.dart';
import 'package:eduroam_autologin/front/ui_globals.dart';

class SaveDataButton extends StatelessWidget {
  const SaveDataButton({@required this.onPressed, this.valueChanged});

  final GestureTapCallback onPressed;
  final bool valueChanged;

  Color _color() => !valueChanged ? enabledColor : disabledColor;

  TextStyle _textStyle() => TextStyle(
    color: _color(),
    fontSize: 25,
    fontWeight: FontWeight.w100,
  );

  String _text() => !valueChanged ? 'Данные сохранены' : 'Сохранить данные';

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
