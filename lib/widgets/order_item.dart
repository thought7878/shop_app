import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udemy_shop_app/models/order.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy  hh:mm:ss').format(order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
