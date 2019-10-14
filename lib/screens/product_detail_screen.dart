import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static String routeName = 'product-detail';
  // final Product product;

  // ProductDetailScreen(this.product);

  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        elevation: 0.0,
      ),
    );
  }
}
