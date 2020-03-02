import 'package:flutter/material.dart';
import 'package:tea_cafe/Login/user_auth_page.dart';

class LoginPage extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Login'),
    Tab(text: 'Register'),
  ];
  @override
  Widget build(BuildContext context) {
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
