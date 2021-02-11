import 'package:eduroam_autologin/back/networkRoutine.dart';
import 'package:eduroam_autologin/back/storageHelper.dart';
import 'package:eduroam_autologin/front/widgets/autologin_mode_button.dart';
import 'package:eduroam_autologin/front/widgets/credential_form.dart';
import 'package:eduroam_autologin/front/widgets/eduroam_title.dart';
import 'package:eduroam_autologin/front/widgets/save_data_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eduroam_autologin/front/ui_helper.dart';

import 'back/globals.dart';
import 'front/widgets/ConnectToEduroamButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eduroam autologin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _callSetState() => setState(() {});

  void _saveUserData() {
    saveData(loginController.text, passwordController.text).then((value) {
      valueChanged = false;
      login = loginController.text;
      password = passwordController.text;
      print("save button tap\n$valueChanged");
      setState(() {});
    });
  }

  void _changeAutologinState() {
    autologinState = !autologinState;
    saveAutloginState(autologinState).then((value) {
      print("autologin state: $autologinState");
      setState(() {});
    });
  }

  void _onChangedCredential() {
    setState(() {
      valueChanged = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (initState) {
      loadData().then((value) {
        loginController.text = login;
        passwordController.text = password;
        if (autologinState == null) autologinState = false;
        initState = false;
        setState(() {});
        if (autologinState) connectToEduroam(login, password);
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const EduroamTitle(),
            CredentialForm(
              loginController: loginController,
              passwordController: passwordController,
              onChanged: _onChangedCredential,
            ),
            SaveDataButton(
              onPressed: _saveUserData,
              valueChanged: valueChanged,
            ),
            SizedBox(height: 20),
            AutologinModeButton(
              mode: autologinState,
              onPressed: _changeAutologinState,
            ),
            SizedBox(height: 20),
            ConnectToEduroamButton(
                onTap: () => connectToEduroam(login, password))
          ],
        ),
      ]),
    );
  }
}
