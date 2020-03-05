import 'package:flutter/material.dart';

import 'custom_bottom_appbar.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    @required this.title,
    @required this.body,
    @required this.index,
    Key key,
  }) : super(key: key);
  final String title;
  final Widget body;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppBar(
        index: index,
      ),
    );
  }
}
