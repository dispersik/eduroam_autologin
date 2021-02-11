import 'package:shared_preferences/shared_preferences.dart';
import "dart:async";
import 'package:eduroam_autologin/back/globals.dart';

Future<String> loadLogin() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('login');
}

Future<String> loadPassword() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('password');
}

Future<bool> loadAutoLoginState() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('autologinState');
}

Future saveAutloginState(bool value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('autologinState', value);
}

Future saveLogin(String login) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('login', login);
}

Future savePassword(String password) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('password', password);
}

Future saveData(String login, String password) async {
  await saveLogin(login).then((value) async {
    await savePassword(password);
  });
  return;
}

Future loadData() async {
  login = await loadLogin() ?? '';
  password = await loadPassword() ?? '';
  autologinState = await loadAutoLoginState() ?? false;
  print("load data occurs:\nlogin: $login\n$password: \nstate: $autologinState");
}
