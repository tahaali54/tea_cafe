import 'package:flutter/material.dart';
import 'package:tea_cafe/Login/login_page.dart';

void main() => runApp(TeaCafe());

class TeaCafe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tea & Cafe',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginPage(),
    );
  }
}
