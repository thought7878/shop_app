import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_shop_app/providers/products.dart';
import 'package:udemy_shop_app/widgets/user_products_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user_products';
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        // margin: EdgeInsets.all(8),
        child: Consumer<Products>(builder: (ctx, container, child) {
          final products = container.items;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (_, i) => Column(
              children: <Widget>[
                UserProductsItem(products[i]),
                Divider(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
