import 'package:flutter/material.dart';
import 'package:g_sneaker/models/shoe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourCartShoeRepository extends ChangeNotifier {
  final Map<Shoe, int> _yourCartShoes = {};

  Map<Shoe, int> get yourCartShoes => _yourCartShoes;

  Future<void> addShoe(Shoe shoe) async {
    if (_yourCartShoes.containsKey(shoe)) {
      _yourCartShoes[shoe] = _yourCartShoes[shoe]! + 1;
    } else {
      _yourCartShoes[shoe] = 1;
    }
    shoe.isAdded = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    yourCartShoes.forEach((shoe, quantity) {
      prefs.setInt(shoe.id.toString(), quantity);
    });

    notifyListeners();
  }

  Future<void> minusShoe(Shoe shoe) async {
    if (_yourCartShoes.containsKey(shoe)) {
      if (_yourCartShoes[shoe]! > 1) {
        _yourCartShoes[shoe] = _yourCartShoes[shoe]! - 1;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        yourCartShoes.forEach((shoe, quantity) {
          if (shoe.id == shoe.id) {
            prefs.setInt(shoe.id.toString(), quantity - 1);
          }
        });
      } else {
        removeShoe(shoe);
        // shoe.isAdded = false;
      }
    }
    notifyListeners();
  }

  void removeShoe(Shoe shoe) {
    _yourCartShoes.remove(shoe);
    shoe.isAdded = false;

    SharedPreferences.getInstance().then((prefs) {
      prefs.remove(shoe.id.toString());
    });

    notifyListeners();
  }

  double get totalPrice {
    double total = 0.0;
    _yourCartShoes.forEach((shoe, quantity) {
      total += shoe.price! * quantity;
    });
    return total;
  }

  void clearShoes() {
    _yourCartShoes.clear();
  }

  void updateRepository() {
    notifyListeners();
  }
}
