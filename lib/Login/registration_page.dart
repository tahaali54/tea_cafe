import 'package:flutter/material.dart';
import 'package:tea_cafe/CustomWidgets/circular_button.dart';
import 'package:tea_cafe/CustomWidgets/custom_text_field.dart';
import 'package:tea_cafe/Home/home_page.dart';

import '../global.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            'Create an account',
            style: setTextStyle(
                color: primaryColor, weight: FontWeight.bold, size: 18),
          ),
        ),
        CustomTextField(
          hintText: 'Username',
          prefixIcon: Icons.perm_identity,
        ),
        CustomTextField(
          hintText: 'Email',
          prefixIcon: Icons.mail_outline,
        ),
        CustomTextField(
          hintText: 'Password',
          prefixIcon: Icons.lock_outline,
          obscureText: true,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text(
                'REGISTER',
                style: setTextStyle(
                    color: secondaryColor, weight: FontWeight.w500),
              ),
              color: Colors.red,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Divider(
            color: Colors.red,
            height: 0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/fb_logo.png',
                color: Colors.white,
              ),
              bgColor: Colors.blue[800],
            ),
            CircularButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/google_logo.png',
                color: Colors.blue[800],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
