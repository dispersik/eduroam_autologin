import 'package:url_launcher/url_launcher.dart';

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