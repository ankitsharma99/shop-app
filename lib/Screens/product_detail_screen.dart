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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 15,
              child: ClipRRect(
                child: Container(
                  height: 400,
                  width: double.infinity,
                  child: Image.network(
                    loadedProduct.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.transparent,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '₹ ${loadedProduct.price}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
