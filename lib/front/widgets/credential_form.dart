import 'package:eduroam_autologin/front/widgets/minimal_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CredentialForm extends StatelessWidget {
  CredentialForm(
      {@required this.loginController,
      this.passwordController,
      this.onChanged});

  final loginController;
  final passwordController;
  final Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              MinimalForm(
                text: 'Логин:',
                hintText: 'Введите логин:',
                onChanged: (_) => onChanged(),
                controller: loginController,
              ),
              SizedBox(
                height: 20,
              ),
              MinimalForm(
                text: 'Пароль:',
                hintText: 'Введите пароль:',
                onChanged: (_) => onChanged(),
                controller: passwordController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
