import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tea_cafe/CustomWidgets/circular_button.dart';
import 'package:tea_cafe/Favorites/favorites_page.dart';

import '../global.dart';
import 'package:http/http.dart' as http;

class PopularItems extends StatefulWidget {
  @override
  _PopularItemsState createState() => _PopularItemsState();
}

class _PopularItemsState extends State<PopularItems> {
  List<DishesModel> _dishes = List<DishesModel>();

  bool _isloading = true;

  Future<List<DishesModel>> fetchDishes() async {
    setState(() {
      _isloading = true;
    });

    final _response = await http.get(Urls.baseUrl + Urls.menu);
    if (_response.statusCode == 200) {
      var tagsJson = jsonDecode(_response.body) as List;
      _dishes = tagsJson.map((e) => DishesModel.fromJson(e)).toList();
      setState(() {
        _isloading = false;
      });
      return _dishes;
    } else {
      setState(() {
        _isloading = false;
      });
      throw Exception('Failed to load menu');
    }
  }

  @override
  void initState() {
    fetchDishes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> gridItems = List();

    return ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                'Popular Items',
                style: setTextStyle(
                    size: 23, color: primaryTextColor, weight: FontWeight.w800),
              ),
            ),
            FlatButton(
                onPressed: () {},
                child: Text(
                  'View More',
                  style: setTextStyle(
                      color: primaryColor, weight: FontWeight.bold, size: 16),
                ))
          ],
        ),
        _isloading
            ? LinearProgressIndicator()
            : GridViewWidget(context: context, documents: _dishes, x: gridItems)
      ],
    );
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    Key key,
    @required this.context,
    @required this.documents,
    @required this.x,
  }) : super(key: key);

  final BuildContext context;
  final List<DishesModel> documents;
  final List<Widget> x;

  @override
  Widget build(BuildContext context) {
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
      x.add(
        InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        item.imageUrl,
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
                            item.isFav ? Icons.favorite : Icons.favorite_border,
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
                    item.name,
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
      children: x,
    );
  }
}
