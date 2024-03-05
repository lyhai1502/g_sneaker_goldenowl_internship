import 'package:flutter/material.dart';
import 'package:g_sneaker/models/shoe.dart';

class YourCartShoeRepository extends ChangeNotifier {
  List<Shoe> _yourCartShoes = [];

  List<Shoe> get yourCartShoes => _yourCartShoes;

  void addShoe(Shoe shoe) {
    _yourCartShoes.add(shoe);
    notifyListeners();
  }

  void removeShoe(Shoe shoe) {
    _yourCartShoes.remove(shoe);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;
    for (Shoe shoe in _yourCartShoes) {
      total += shoe.price ?? 0;
    }
    return double.parse(total.toStringAsFixed(2));
  }
}
