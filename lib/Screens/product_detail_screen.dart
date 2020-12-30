import 'package:flutter/material.dart';
import '../providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;

  // ProductDetailScreen(this.title);
  static const routeName = '/Product-Detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(
      context,
    ).settings.arguments as String; //Catching arguments
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              loadedProduct.title,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontFamily: 'Basic',
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
