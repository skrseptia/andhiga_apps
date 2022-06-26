import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

import 'package:ikhsanproject/models/item_cart.dart';

class Cart with ChangeNotifier {
  final List<ItemCart> _carts = [];

  List<ItemCart> get carts => _carts;

  void addToCart(ItemCart itemCart) {
    ItemCart? itemExist = _carts.firstWhereOrNull((e) => e.id == itemCart.id);
    if (itemExist != null) {
      var oldQty = itemExist.qty;
      var newQty = oldQty + itemCart.qty;
      print("old => $oldQty new => $newQty");
      itemExist.qty = newQty;
      print("item exist $itemExist");
    } else {
      _carts.add(itemCart);
    }

    // var itemExist = _carts.where((e) => e.id == 1111).first;
    // print("test");
    // print(itemExist);

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
