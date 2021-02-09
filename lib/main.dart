import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eduroam_autologin/storageHelper.dart';
import 'package:eduroam_autologin/ui_helper.dart';

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
  void connectToEduroam(String login, String password) async {
    if (login != null && password != null) {
      final link =
          'http://' + login + ":" + password + '@10.0.0.10/connect.html';
      if (await canLaunch(link)) {
        await launch(link, forceSafariVC: false);
        print('Eduroam get happen');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            titleElement(),
            Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ...loginElements(),
                      SizedBox(
                        height: 20,
                      ),
                      ...passwordElements(),
                    ],
                  ),
                ),
              ),
            ),
            saveDataElement()
          ],
        ),
      ),
    );
  }
}
