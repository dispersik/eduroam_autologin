import 'package:eduroam_autologin/back/networkRoutine.dart';
import 'package:eduroam_autologin/back/storageHelper.dart';
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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'rfct eduroam autologin',
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
        setState(() {});
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
            titleElement(),
            credentialElement(_callSetState),
            saveDataElement(_callSetState),
            SizedBox(height: 20,),
            autologinModeElement(_callSetState),
            SizedBox(height: 20,),
            testElement(),
          ],
        ),
      ]),
    );
  }
}
