import 'package:flutter/widgets.dart';
import 'package:udemy_shop_app/models/cart_item.dart';

class CartContainer with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, item) {
      total += item.price * item.quantity;
    });
    return total;
  }

  void addItem(String id, String title, double price) {
    if (_items.containsKey(id)) {
      //existed update
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
      // not add
      _items.putIfAbsent(
        id,
        () => CartItem(id: id, title: title, price: price, quantity: 1),
      );
    }
    notifyListeners();
  }

  void removeItem(String id) {
    if (_items.containsKey(id)) {
      _items.remove(id);
      notifyListeners();
    }
  }

  void undoAddedItem(String id) {
    if (_items.containsKey(id)) {
      if (_items[id].quantity > 1) {
        _items.update(
          id,
          (oldItem) => CartItem(
            id: oldItem.id,
            title: oldItem.title,
            price: oldItem.price,
            quantity: oldItem.quantity - 1,
          ),
        );
      } else {
        _items.remove(id);
      }
      notifyListeners();
    }
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  // void updateQuantity()
}
