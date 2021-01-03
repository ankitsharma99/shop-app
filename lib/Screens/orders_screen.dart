import 'package:flutter/material.dart';
import '../Widgets/app_drawer.dart';
import '../providers/orders.dart' show Orders;
import 'package:provider/provider.dart';
import '../Widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Text(
                "Your ",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.teal,
                ),
              ),
            ),
            Text(
              "Orders",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, index) => OrderItem(
          orderData.orders[index],
        ),
      ),
    );
  }
}
