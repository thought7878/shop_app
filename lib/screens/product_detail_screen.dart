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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              product.title,
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                product.description * 100,
                // textAlign: TextAlign.center,
                // softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
