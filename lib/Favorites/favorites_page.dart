import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tea_cafe/CustomWidgets/circular_button.dart';
import 'package:tea_cafe/CustomWidgets/custom_scaffold.dart';
import 'package:tea_cafe/global.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      index: 1,
      title: 'Favorites',
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'Favorite Items',
              style: setTextStyle(
                  size: 23, color: primaryTextColor, weight: FontWeight.w800),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('favorites').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();

              return _buildGridView(context, snapshot.data.documents);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGridView(
      BuildContext context, List<DocumentSnapshot> documents) {
    List<Widget> gridItems = List();
    List<Widget> getRatingRow() {
      List<Widget> row = List();
      for (int i = 0; i < 5; i++) {
        row.add(Icon(
          Icons.star,
          color: Colors.orangeAccent,
          size: 11,
        ));
      }
      row.add(Container(
        width: 8,
      ));
      row.add(
        Text(
          '5.0 (23 Reviews)',
          style: setTextStyle(size: 11, color: primaryTextColor),
        ),
      );
      return row;
    }

    documents.forEach((item) {
      gridItems.add(
        InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        "assets/${item['imageName']}",
                        height: MediaQuery.of(context).size.height / 3.6,
                        width: MediaQuery.of(context).size.width / 2.2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      height: 30,
                      width: 30,
                      right: 8.0,
                      bottom: 8.0,
                      child: CircularButton(
                          icon: Icon(
                            Icons.favorite,
                            color: primaryColor,
                            size: 15,
                          ),
                          onPressed: () {}),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 2),
                  child: Text(
                    item['name'],
                    style: setTextStyle(
                        size: 20,
                        weight: FontWeight.w900,
                        color: primaryTextColor),
                  ),
                ),
                Row(
                  children: getRatingRow(),
                ),
              ],
            )),
      );
    });

    return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(8),
      crossAxisSpacing: 8,
      childAspectRatio: MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height / 1.25),
      mainAxisSpacing: 8,
      crossAxisCount: 2,
      children: gridItems,
    );
  }
}
