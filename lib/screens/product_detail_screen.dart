import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_shop_app/providers/products.dart';
import '../providers/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static String routeName = 'product-detail';
  // final Product product;

  // ProductDetailScreen(this.product);

  @override
  Widget build(BuildContext context) {
    final String productId = ModalRoute.of(context).settings.arguments;
    Product product =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        elevation: 0.0,
      ),
    );
  }
}
