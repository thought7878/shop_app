import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_shop_app/providers/order_container.dart';
import 'package:udemy_shop_app/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/order';

  @override
  Widget build(BuildContext context) {
    final orderContainer = Provider.of<OrderContainer>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('OrderScreen'),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 400,
          child: ListView.builder(
            itemCount: orderContainer.orders.length,
            itemBuilder: (ctx, i) {
              return OrderItem(orderContainer.orders[i]);
            },
          ),
        ),
      ),
    );
  }
}
