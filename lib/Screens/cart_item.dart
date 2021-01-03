import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;

  CartItem(
    this.id,
    this.price,
    this.quantity,
    this.title,
  );
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Padding(
        //*************cant add const here due to change in price for different kinds of products!!!!!!!!!!!!!*********
        padding: EdgeInsets.all(15),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: FittedBox(
                  child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  '₹ $price',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
            ),
          ),
          title: Text(title),
          subtitle: Text(
            'Total : ₹ ${price * quantity}',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                fontFamily: 'Alatsi'),
          ),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
