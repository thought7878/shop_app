import 'package:flutter/material.dart';
import 'package:udemy_shop_app/providers/product.dart';

class UserProductsItem extends StatelessWidget {
  final Product product;

  UserProductsItem(this.product);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.title),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
