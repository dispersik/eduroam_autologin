import 'package:eduroam_autologin/back/networkRoutine.dart';
import 'package:eduroam_autologin/back/storageHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:eduroam_autologin/back/globals.dart';
import 'ui_globals.dart';

Widget titleElement() {
  return Padding(
    padding: EdgeInsets.only(top: 20),
    child: Text(
      "eduroam autologin",
      style: titleStyle(),
      textAlign: TextAlign.center,
    ),
  );
}

List<Widget> loginElements(void callSetState()) {
  return [
    Row(children: [
      Text(
        'Логин: ',
        textAlign: TextAlign.left,
        style: styleDarkKey(),
      ),
    ]),
    Row(
      children: <Widget>[
        Flexible(
          child: TextField(
            style: styleDarkValue(),
            controller: loginController,
            onChanged: (text) {
              valueChanged = true;
              callSetState();
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

List<Widget> passwordElements(void callSetState()) {
  return [
    Row(children: [
      Text(
        'Пароль: ',
        textAlign: TextAlign.left,
        style: styleDarkKey(),
      ),
    ]),
    Row(
      children: <Widget>[
        Flexible(
          child: TextField(
            style: styleDarkValue(),
            onChanged: (text) {
              valueChanged = true;
              // passwordController.text = text;
              callSetState();
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

Widget credentialElement(void callSetState()) {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: /*_getAutologinLightColor()*/ Colors.black12),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ...loginElements(callSetState),
            SizedBox(
              height: 20,
            ),
            ...passwordElements(callSetState),
          ],
        ),
      ),
    ),
  );
}

Widget saveDataElement(void callSetState()) {
  return GestureDetector(
      onTap: () async {
        saveData(loginController.text, passwordController.text).then((value) {
          valueChanged = false;
          login = loginController.text;
          password = passwordController.text;
          print("save button tap\n$valueChanged");
          callSetState();
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: getSaveButtonColor() /*Colors.black12*/),
        ),
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Text(
            getSaveButtonText(),
            style: saveButtonStyle(),
          ),
        ),
      ));
}

Widget autologinModeElement(void callSetState()) {
  return GestureDetector(
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: getAutologinColor()),
      ),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Text(
          getAutologinText(),
          style: autologinStyle(),
        ),
      ),
    ),
    onTap: () {
      autologinState = !autologinState;
      saveAutloginState(autologinState).then((value) {
        print("autologin state: $autologinState");
        callSetState();
      });
    },
  );
}

Widget testElement() {
  return GestureDetector(
    onTap: () {
      connectToEduroam(login, password);
    },
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