import 'package:flutter/material.dart';
import 'package:udemy_shop_app/models/cart_item.dart' as model;

class CartItem extends StatelessWidget {
  final model.CartItem cartItem;

  CartItem(this.cartItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              child: FittedBox(child: Text('\$${cartItem.price}')),
              padding: EdgeInsets.all(5),
            ),
          ),
          title: Text(cartItem.title),
          subtitle: Text('Total: \$${cartItem.quantity * cartItem.price}'),
          trailing: Text('${cartItem.quantity} x'),
        ),
      ),
    );
  }
}
