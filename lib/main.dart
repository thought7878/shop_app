import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_shop_app/providers/cart_container.dart';
import './providers/products.dart';
import './screens/product_detail_screen.dart';
import 'screens/product_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Products>(builder: (ctx) => Products()),
        ChangeNotifierProvider<CartContainer>(builder: (ctx) => CartContainer())
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'Lato',
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => ProductOverviewScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
