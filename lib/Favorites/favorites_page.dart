import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tea_cafe/CustomWidgets/custom_scaffold.dart';
import 'package:tea_cafe/Home/popular_items.dart';
import 'package:tea_cafe/global.dart';
import 'package:http/http.dart' as http;

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<DishesModel> _dishes = List<DishesModel>();

  bool _isloading = true;
  Future<List<DishesModel>> fetchDishes() async {
    final _response = await http.get(Urls.baseUrl + Urls.favoriteList);
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
    super.initState();
    fetchDishes();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      index: 1,
      title: 'Favorites',
      body: !_isloading
          ? ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    'Favorite Items',
                    style: setTextStyle(
                        size: 23,
                        color: primaryTextColor,
                        weight: FontWeight.w800),
                  ),
                ),
                GridViewWidget(
                  context: context,
                  documents: _dishes,
                  x: [],
                  key: widget.key,
                )
              ],
            )
          : Text("Loading..."),
    );
  }
}

class DishesModel {
  final String id;
  final String name;
  final String imageUrl;
  final bool isFav;
  final String rating;

  DishesModel({this.imageUrl, this.id, this.isFav, this.name, this.rating});

  factory DishesModel.fromJson(dynamic json) {
    return DishesModel(
        name: json['name'],
        id: json['id'],
        imageUrl: json['imageUrl'],
        rating: json['rating'],
        isFav: json['isFav'] == "1" ? true : false);
  }
}

abstract class Urls {
  static final baseUrl = Platform.isAndroid
      ? 'http://192.168.43.232:8888/'
      : 'http://localhost:8888/';

  static final menu = 'menu';

  static final favoriteList = 'favourite';

  static final setList = 'menu';
}
