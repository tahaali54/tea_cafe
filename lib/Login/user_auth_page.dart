import 'package:flutter/material.dart';
import 'package:tea_cafe/CustomWidgets/custom_text_field.dart';
import 'package:tea_cafe/Home/home_page.dart';

import '../global.dart';

class UserAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            'Log in to your account',
            style: setTextStyle(
                color: primaryColor,
                weight: FontWeight.bold,
                textScaleConstant: 4),
          ),
        ),
        CustomTextField(
          hintText: 'Username',
          prefixIcon: Icons.perm_identity,
        ),
        CustomTextField(
          hintText: 'Password',
          prefixIcon: Icons.lock_outline,
          obscureText: true,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: FlatButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style:
                    setTextStyle(color: primaryColor, weight: FontWeight.w500),
              )),
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
                'LOGIN',
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

class CircularButton extends StatelessWidget {
  const CircularButton(
      {Key key,
      @required this.icon,
      @required this.onPressed,
      this.bgColor = Colors.white})
      : super(key: key);

  final Image icon;
  final void Function() onPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: new CircleBorder(),
      elevation: 4.0,
      fillColor: bgColor,
      padding: const EdgeInsets.all(4.0),
      onPressed: onPressed,
      child: CircleAvatar(
        child: icon,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
