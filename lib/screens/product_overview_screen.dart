import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import 'package:udemy_shop_app/providers/products.dart';
import '../widgets/product_item.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final items = productsData.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductOverviewScreen'),
        elevation: 0.0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(6),
        itemCount: items.length,
        itemBuilder: (ctx, i) => ProductItem(items[i]),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
