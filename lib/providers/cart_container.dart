import 'package:flutter/widgets.dart';
import 'package:udemy_shop_app/models/cart_item.dart';

class CartContainer with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String id, String title, double price) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (existingItem) => CartItem(
          id: id,
          title: title,
          price: price,
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        id,
        () => CartItem(id: id, title: title, price: price, quantity: 1),
      );
    }
  }

  void removeItem(String id) {
    if (_items.containsKey(id)) {
      //
    }
  }
}
