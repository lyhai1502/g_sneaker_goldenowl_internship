import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g_sneaker/models/shoe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OurProductsShoeRepository extends ChangeNotifier {
  final List<Shoe> _ourProductsShoes = [];

  List<Shoe> get ourProductsShoes => _ourProductsShoes;

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('lib/assets/data/shoes.json');
    final data = await json.decode(response);
    for (var i = 0; i < data['shoes'].length; i++) {
      _ourProductsShoes.add(Shoe.fromJson(data['shoes'][i]));
    }

    checkAddedShoe();
    notifyListeners();
  }

  Shoe getShoeFromId(int id) {
    return _ourProductsShoes.firstWhere((shoe) => shoe.id == id);
  }

  void checkAddedShoe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (Shoe shoe in _ourProductsShoes) {
      if (prefs.containsKey(shoe.id.toString())) {
        shoe.isAdded = true;
      }
    }
  }
}
