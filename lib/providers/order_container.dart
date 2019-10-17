import 'package:flutter/foundation.dart';
import 'package:udemy_shop_app/models/cart_item.dart';
import 'package:udemy_shop_app/models/order.dart';

class OrderContainer with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartItems, double amount) {
    _orders.insert(
      0,
      Order(
        id: DateTime.now().toString(),
        amount: amount,
        cartItems: cartItems,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
