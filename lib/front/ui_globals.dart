import 'package:eduroam_autologin/back/globals.dart';
import 'package:flutter/material.dart';

String getAutologinText() {
  if (autologinState==null) return 'Автологин загружается';
  return autologinState ? 'Автологин включен' : 'Автологин отключен';
}

String getSaveButtonText() =>
    !valueChanged ? 'Данные сохранены' : 'Сохранить данные';

Color getAutologinColor() {
  if (autologinState==null) return Colors.black26;
  return autologinState ? enabledColor : disabledColor;
}

Color getSaveButtonColor() {
  return !valueChanged ? enabledColor : disabledColor;
}

Color enabledColor = Colors.lightGreen;
Color disabledColor = Colors.redAccent;

TextStyle styleDarkKey() => TextStyle(
  color: Colors.black54,
  fontSize: 20,
  fontWeight: FontWeight.w300,
);

TextStyle styleDarkValue() => TextStyle(
  color: Colors.black38,
  fontSize: 20,
  fontWeight: FontWeight.w200,
);

TextStyle titleStyle() => TextStyle(
  color: Colors.black54,
  fontSize: 40,
  fontWeight: FontWeight.w100,
);

TextStyle saveButtonStyle() => TextStyle(
  color: getSaveButtonColor(),
  fontSize: 25,
  fontWeight: FontWeight.w100,
);

TextStyle autologinStyle() => TextStyle(
  color: getAutologinColor(),
  fontSize: 25,
  fontWeight: FontWeight.w100,
);