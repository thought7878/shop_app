import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_shop_app/providers/cart_container.dart';
import 'package:udemy_shop_app/providers/order_container.dart';
import 'package:udemy_shop_app/screens/cart_screen.dart';
import 'package:udemy_shop_app/screens/edit_product_screen.dart';
import 'package:udemy_shop_app/screens/order_screen.dart';
import 'package:udemy_shop_app/screens/user_products_screen.dart';
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
        ChangeNotifierProvider<Products>(
          builder: (ctx) => Products(),
        ),
        ChangeNotifierProvider<CartContainer>(
          builder: (ctx) => CartContainer(),
        ),
        ChangeNotifierProvider<OrderContainer>(
          builder: (ctx) => OrderContainer(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.green,
            fontFamily: 'Lato',
            cardTheme: CardTheme(elevation: 0)),
        initialRoute: '/',
        routes: {
          '/': (ctx) => ProductOverviewScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
