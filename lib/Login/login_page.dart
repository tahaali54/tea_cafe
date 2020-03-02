import 'package:flutter/material.dart';
import 'package:tea_cafe/Login/user_auth_page.dart';

import '../global.dart';

class LoginPage extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Login',
    ),
    Tab(text: 'Register'),
  ];
  @override
  Widget build(BuildContext context) {
    GlobalCache.instance.fontSize = MediaQuery.of(context).size.width * 0.04;
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Material(
                elevation: 4,
                child: TabBar(
                    tabs: myTabs,
                    indicatorColor: Colors.red,
                    labelColor: Colors.red,
                    labelStyle: setTextStyle(weight: FontWeight.bold, textScaleConstant: 6),
                    unselectedLabelColor: Colors.grey),
              ),
              Expanded(
                child: TabBarView(children: [
                  UserAuthPage(),
                  UserAuthPage(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
