import 'package:flutter/cupertino.dart';
import 'package:ikhsanproject/models/item_cart.dart';

class Cart with ChangeNotifier {
  final List<ItemCart> _carts = [];

  List<ItemCart> get carts => _carts;

  void addToCart(ItemCart itemCart) {
    _carts.add(itemCart);
    notifyListeners();
  }

  void removeAllCart() {
    _carts.clear();
    notifyListeners();
  }

  void removeItemById(int id) {
    // _carts.remove(())
    notifyListeners();
  }
}
