import 'package:eduroam_autologin/back/networkRoutine.dart';
import 'package:eduroam_autologin/back/storageHelper.dart';
import 'package:eduroam_autologin/front/widgets/autologinModeButton.dart';
import 'package:eduroam_autologin/front/widgets/eduroamTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eduroam_autologin/front/ui_helper.dart';

import 'back/globals.dart';

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
  void _callSetState() => setState((){});

  @override
  Widget build(BuildContext context) {

    if (initState) {
      loadData().then((value) {
        loginController.text = login;
        passwordController.text = password;
        if (autologinState==null) autologinState = false;
        initState = false;
        // setState(() {});
        if (autologinState) connectToEduroam(login, password);
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const EduroamTitle(),
            // titleElement(),
            credentialElement(_callSetState),
            saveDataElement(_callSetState),
            SizedBox(height: 20,),
            AutologinModeButton(
              mode: autologinState,
              onPressed: () {
                autologinState = !autologinState;
                saveAutloginState(autologinState).then((value) {
                  print("autologin state: $autologinState");
                  setState(() {});
                });
              },
            ),
            SizedBox(height: 20,),
            testElement(),
          ],
        ),
      ]),
    );
  }
}
