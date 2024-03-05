import 'package:flutter/material.dart';
import 'package:g_sneaker/models/shoe.dart';

class YourCartShoeRepository extends ChangeNotifier {
  final Map<Shoe, int> _yourCartShoes = {};

  Map<Shoe, int> get yourCartShoes => _yourCartShoes;

  void addShoe(Shoe shoe) {
    if (_yourCartShoes.containsKey(shoe)) {
      _yourCartShoes[shoe] = _yourCartShoes[shoe]! + 1;
    } else {
      _yourCartShoes[shoe] = 1;
    }
    shoe.isAdded = true;

    notifyListeners();
  }

  void minusShoe(Shoe shoe) {
    if (_yourCartShoes.containsKey(shoe)) {
      if (_yourCartShoes[shoe]! > 1) {
        _yourCartShoes[shoe] = _yourCartShoes[shoe]! - 1;
      } else {
        _yourCartShoes.remove(shoe);
        shoe.isAdded = false;
      }
    }
    notifyListeners();
  }

  void removeShoe(Shoe shoe) {
    _yourCartShoes.remove(shoe);
    shoe.isAdded = false;

    notifyListeners();
  }

  double get totalPrice {
    double total = 0.0;
    _yourCartShoes.forEach((shoe, quantity) {
      total += shoe.price! * quantity;
    });
    return total;
  }
}
