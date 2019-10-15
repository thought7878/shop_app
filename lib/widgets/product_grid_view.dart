import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_shop_app/providers/products.dart';

import 'product_item.dart';

class ProductGridView extends StatelessWidget {
  final bool isFavorite;
  ProductGridView(this.isFavorite);

  //
  @override
  Widget build(BuildContext context) {
    //
    final productsContainer = Provider.of<Products>(context);
    final items =
        isFavorite ? productsContainer.favoriteItems : productsContainer.items;

    //
    return GridView.builder(
      padding: const EdgeInsets.all(6),
      itemCount: items.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (ctx) => items[i],
        value: items[i],
        child: ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
