import 'package:shared_preferences/shared_preferences.dart';

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

void saveLogin(String login) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('login', login);
}

void savePassword(String password) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('password', password);
}

void saveData() {

}