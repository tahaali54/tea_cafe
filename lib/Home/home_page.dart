import 'package:flutter/material.dart';
import 'package:tea_cafe/Favorites/favorites_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tea & Cafe'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home), onPressed: (){}),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FavoritesPage()));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child:
                  IconButton(icon: Icon(Icons.shopping_cart), onPressed: null),
            ),
            IconButton(icon: Icon(Icons.account_circle), onPressed: null)
          ],
        ),
      ),
    );
  }
}
