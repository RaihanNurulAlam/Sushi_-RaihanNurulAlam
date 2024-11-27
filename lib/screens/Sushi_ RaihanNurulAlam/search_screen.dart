import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_latihan/models/food.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Food> foods = [];
  List<Food> _foundedFoods = [];

  Future<void> getFoods() async {
    String dataFoodJson = await rootBundle.loadString('assets/json/food.json');
    List<dynamic> jsonMap = json.decode(dataFoodJson);

    setState(() {
      foods = jsonMap.map((e) => Food.fromJson(e)).toList();
      _foundedFoods = foods;
    });

    debugPrint(foods[0].name);
  }

  @override
  void initState() {
    getFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Food'),
      ),
      body: ListView.builder(
        itemCount: _foundedFoods.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(_foundedFoods[index].imagePath.toString()),
            title: Text(_foundedFoods[index].name.toString()),
            subtitle: Text(_foundedFoods[index].price.toString()),
            trailing: Text(_foundedFoods[index].rating.toString()),
          );
        },
      ),
    );
  }
}
