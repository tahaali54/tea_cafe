import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tea_cafe/Login/login_page.dart';
import 'package:tea_cafe/global.dart';

void main() => runApp(TeaCafe());

class TeaCafe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: secondaryColor,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tea & Cafe',
      theme: ThemeData(
        backgroundColor: secondaryColor,
        scaffoldBackgroundColor: secondaryColor,
        cursorColor: primaryColor,
        appBarTheme: AppBarTheme(
          color: secondaryColor,
          brightness: Brightness.light,
          elevation: 0,
          textTheme: TextTheme(
            title: TextStyle(
              color: primaryTextColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w800,
            ),
          ),
          iconTheme: IconThemeData(
            color: primaryTextColor,
          ),
        ),
        primarySwatch: Colors.red,
      ),
      home: LoginPage(),
    );
  }
}
