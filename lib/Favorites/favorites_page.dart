import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final List items = [
    'Fruit Salad',
    'Hamburger',
    'Steak',
    'Pizza',
    'Fruit Salad',
    'Hamburger',
    'Steak',
    'Pizza'
  ];
  @override
  Widget build(BuildContext context) {
    List<Widget> x = List();
    items.forEach((i) {
      x.add(
        Container(
            height: 50,
            width: 30,
            child: Card(
              child: Text(i),
              color: Colors.lightBlue,
            )),
      );
    });
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorites'),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(8),
          crossAxisSpacing: 8,
          childAspectRatio: 1.5,
          mainAxisSpacing: 8,
          crossAxisCount: 2,
          children: x,
        ));
  }
}
