import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  CartItem(
    this.id,
    this.price,
    this.quantity,
    this.title,
    this.productId,
  );
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(
        id,
      ),
      background: Container(
        color: Colors.orange[300],
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 25),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          //needs context, builder, title and content
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('You sure homie?'),
            content: Text(
              'Do you want to remove the item from the cart?',
            ),
            actions: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.of(ctx).pop(
                      false); //Future resolves the value that gets passed to Navigator.pop
                },
                child: Text('No'),
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
                child: Text('Yes'),
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(
          context,
          listen: false,
        ).removeItem(
          productId,
        );
      },
      child: Card(
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
                  ),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Row(
              children: [
                Text(
                  'Total : ₹ ${price * quantity}',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: 'Alatsi'),
                ),
              ],
            ),
            trailing: Text('Quantity : $quantity'),
          ),
        ),
      ),
    );
  }
}
