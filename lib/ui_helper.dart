import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

String login;
String password;

final loginController = TextEditingController();
final passwordController = TextEditingController();

TextStyle _styleDarkKey() => TextStyle(
  // color: Colors.red[50].withOpacity(0.9),
  color: Colors.black38,
  fontSize: 20,
  fontWeight: FontWeight.w300,
);

TextStyle _styleDarkValue() => TextStyle(
  // color: Colors.red[50].withOpacity(0.9),
  color: Colors.black38,
  fontSize: 20,
  fontWeight: FontWeight.w200,
);

TextStyle _titleStyle() => TextStyle(
  color: Colors.black38,
  fontSize: 40,
  fontWeight: FontWeight.w100,
);

Widget titleElement() {
  return Padding(
      padding: EdgeInsets.only(top: 40),
      child: Text("eduroam autologin", style: _titleStyle(),),
  );
}

List<Widget> loginElements() {
  return [
    Row(children: [
      Text(
        'Логин: ',
        textAlign: TextAlign.left,
        style: _styleDarkKey(),
      ),
    ]),
    Row(
      children: <Widget>[
        Flexible(
          child: TextField(
            style: _styleDarkValue(),
            controller: loginController,
            onChanged: (text) {
              // changeLogin(text);
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                // isCollapsed: true,
                isDense: true,
                hintText: "Введите имя пользователя"),
          ),
        ),
      ],
    ),
  ];
}

List<Widget> passwordElements() {
  return [
    Row(children: [
      Text(
        'Пароль: ',
        textAlign: TextAlign.left,
        style: _styleDarkKey(),
      ),
    ]),
    Row(
      children: <Widget>[
        Flexible(
          child: TextField(
            style: _styleDarkValue(),
            onChanged: (text) {
              // changePassword(text);
            },
            controller: passwordController,
            decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                hintText: "Введите пароль"),
          ),
        ),
      ],
    ),
  ];
}

Widget saveDataElement() {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        // borderRadius: BorderRadius.circular(20)
    ),
    child: Padding(
      padding: EdgeInsets.all(7),
      child: Text(
        'Сохранить данные',
        style: _styleDarkValue(),
      ),
    ),
  );
}