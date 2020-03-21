import 'package:flutter/material.dart';
import 'package:tea_cafe/CustomWidgets/custom_scaffold.dart';

import 'popular_items.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      index: 0,
      title: 'Tea & Cafe',
      body: PopularItems(),
    );
  }
}
