import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g_sneaker/models/shoe.dart';

class OurProductsShoeRepository extends ChangeNotifier {
  List<Shoe> _ourProductsShoes = [];

  List<Shoe> get ourProductsShoes => _ourProductsShoes;

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('lib/assets/data/shoes.json');
    final data = await json.decode(response);
    for (var i = 0; i < data['shoes'].length; i++) {
      _ourProductsShoes.add(Shoe.fromJson(data['shoes'][i]));
    }
    notifyListeners();
  }
}
