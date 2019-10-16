import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_shop_app/providers/cart_container.dart';
import 'package:udemy_shop_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total:',
                    style: Theme.of(context).textTheme.title,
                  ),
                  Spacer(),
                  Chip(
                    label: Consumer<CartContainer>(
                      builder: (ctx, cartContainer, child) {
                        return Text(
                          '\$${cartContainer.totalAmount.toStringAsFixed(2)}',
                          style: TextStyle(
                            color:
                                Theme.of(context).primaryTextTheme.title.color,
                          ),
                        );
                      },
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text(
                      'ORDER NOW',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Consumer<CartContainer>(
              builder: (ctx, cartContainer, child) {
                final cartItems = cartContainer.items.values.toList();
                return ListView.builder(
                  itemCount: cartContainer.itemCount,
                  itemBuilder: (ctx, i) => CartItem(cartItems[i]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
