import 'package:shared_preferences/shared_preferences.dart';
import "dart:async";
import 'package:eduroam_autologin/globals.dart';

Future<String> loadLogin() async {
  final prefs = await SharedPreferences.getInstance();
  final login = prefs.getString('login');

  return login;
}

Future<String> loadPassword() async {
  final prefs = await SharedPreferences.getInstance();
  final password = prefs.getString('password');

  return password;
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
  login = await loadLogin();
  password = await loadPassword();
}
