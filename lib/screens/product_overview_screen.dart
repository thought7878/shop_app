import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_shop_app/providers/cart_container.dart';
import 'package:udemy_shop_app/screens/cart_screen.dart';
import 'package:udemy_shop_app/widgets/badge.dart';
import 'package:udemy_shop_app/widgets/product_grid_view.dart';

enum FilterOptions { Favorite, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    // final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductOverviewScreen'),
        elevation: 0.0,
        actions: <Widget>[
          Consumer<CartContainer>(
            builder: (ctx, cartContainer, ch) => Badge(
              value: cartContainer.itemCount.toString(),
              child: ch,
              color: Colors.red,
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton<FilterOptions>(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only favorites'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: FilterOptions.All,
              )
            ],
            onSelected: (val) {
              setState(() {
                if (val == FilterOptions.Favorite) {
                  isFavorite = true;
                } else {
                  isFavorite = false;
                }
              });
            },
          ),
        ],
      ),
      body: ProductGridView(isFavorite),
    );
  }
}
