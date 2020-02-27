import 'package:flutter/material.dart';

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
                child: TabBarView(
                  children: myTabs.map((Tab tab) {
                    final String label = tab.text.toLowerCase();
                    return Center(
                      child: Text(
                        'This is the $label tab',
                        style: const TextStyle(fontSize: 36),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
