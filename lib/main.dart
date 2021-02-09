import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eduroam_autologin/storageHelper.dart';

void main() {
  runApp(MyApp());
}

final List<String> credentialLocal = List<String>();
bool _credenitalUpdated = false;
bool autologinAtStartUp = true;
bool startUpState = true;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'rfct eduroam autologin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'rfct eduroam autologin'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  void connectToEduroam(List<String> credential) async {
    if (credential.isNotEmpty && credential[0]!= null && credential[1]!=null) {
    final link = 'http://'+credential[0]+":"+credential[1]+'@10.0.0.10/connect.html';
    if (await canLaunch (link)) {
      await launch(link, forceSafariVC: false);
      print('Eduroam get happen');
    }
    }
  }

  Future<List<String>> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final credential = prefs.getStringList('credential');

    return credential;
  }

  getData() async {
    List<String> cred = await loadData();
    print(cred);
    if (cred!=null && cred.isNotEmpty) {
      setState(() {
        credentialLocal.clear();
        credentialLocal.addAll(cred);
      });
    }
  }

  void saveData(List<String> credential) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('credential', credential);
  }

  Color getColor(Set<MaterialState> states) {
    if (autologinAtStartUp) {
      return Colors.blue;
    }
    return Colors.blueGrey;
  }

  String getButtonText() {
    if (autologinAtStartUp)
      return 'Автологин при запуске приложения включён';
    return 'Автологин при запуске приложения выключен';
  }

  final TextStyle _styleLight = TextStyle(
    color: Colors.red[50].withOpacity(0.9),
    // color: Colors.black38,
    fontSize: 15,
    fontWeight: FontWeight.w200,
  );

  final TextStyle _styleDark = TextStyle(
    // color: Colors.red[50].withOpacity(0.9),
    color: Colors.black38,
    fontSize: 15,
    fontWeight: FontWeight.w200,
  );

  changeLogin(String login) {
    if (login!=null || login.length != 0) {
      if (credentialLocal == null || credentialLocal.isEmpty) {
        setState(() {
          credentialLocal.clear();
          credentialLocal.add(login);
          credentialLocal.add('');
        });
      }
      else {
        setState(() {
          credentialLocal[0] = login;
        });
      }
      saveData(credentialLocal);
    }
  }

  changePassword(String password) {
    if (password!=null || password.length != 0) {
      print(credentialLocal);
      if (credentialLocal == null || credentialLocal.isEmpty) {
        setState(() {
          credentialLocal.clear();
          credentialLocal.add('');
          credentialLocal.add(password);
        });
      }
      else {
        credentialLocal[1] = password;
      }
      saveData(credentialLocal);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (startUpState) {
      getData();

      if (credentialLocal != null && credentialLocal.isNotEmpty) {
        setState(() {
          loginController.text = credentialLocal[0];
          passwordController.text = credentialLocal[1];
        });
      }
      
      if (autologinAtStartUp) {
        connectToEduroam(credentialLocal);
      }

      startUpState = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(children: [Text('Логин: ', textAlign: TextAlign.left, style: _styleDark,),]),
              Row(children: <Widget>[
                Flexible(child: TextField(
                  style: _styleDark,
                  controller: loginController,
                  onChanged: (text) {
                    changeLogin(text);
                  },
                  decoration: InputDecoration(
                      hintText: "Введите имя пользователя"),
                ),
                ),
              ],),
              Row(children: [Text('')],),
              Row(children: [Text('Пароль: ', textAlign: TextAlign.left, style: _styleDark,),]),
              Row(children: <Widget>[
                Flexible(child: TextField(
                  style: _styleDark,
                  onChanged: (text) {
                    changePassword(text);
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: "Введите пароль"),
                ),
                ),
              ],),
              Row(children: [Text('')],),
              ElevatedButton(
                child: Text(getButtonText(), style: _styleLight,),
                onPressed: () {
                  setState(() {
                    autologinAtStartUp = !autologinAtStartUp;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(getColor),),
              ),
              ElevatedButton(
                child: Text("ТЫК"),
                onPressed: () {
                  print(credentialLocal);
                  getData();
                  // print()
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
