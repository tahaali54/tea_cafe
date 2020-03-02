import 'package:flutter/material.dart';
import 'package:tea_cafe/Home/home_page.dart';

class UserAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Log in to your account',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text(
                'LOGIN',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
