import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_shop_app/providers/cart_container.dart';
import 'package:udemy_shop_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartContainer = Provider.of<CartContainer>(context);
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
                    label: Text(
                      '\$${cartContainer.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          color:
                              Theme.of(context).primaryTextTheme.title.color),
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
            child: ListView.builder(
              itemCount: cartContainer.itemCount,
              itemBuilder: (ctx, i) =>
                  // TODO improve
                  CartItem(cartContainer.items.values.toList()[i]),
            ),
          ),
        ],
      ),
    );
  }
}
