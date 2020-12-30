import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppers_Stop/providers/products.dart';
// import '../Screens/products_overview_screen.dart';
import '../Screens/product_detail_screen.dart';
import '../providers/products.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // final double price;
  // ProductItem(
  //   this.id,
  //   this.title,
  //   this.imageUrl,
  //   this.price,
  // );
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(
      context,
    );
    final cart = Provider.of<Cart>(
      context,
      listen: false,
    );
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 5,
        color: Colors.transparent,
        child: Consumer<Product>(
          builder: (ctx, product, child) => ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: GridTile(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ProductDetailScreen.routeName,
                    arguments: product.id,
                  );
                },
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              header: GridTileBar(
                leading: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    product.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Basic',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),

                    // textAlign: TextAlign.center,
                  ),
                ),
                backgroundColor: Colors.black54,
              ),
              footer: GridTileBar(
                leading: IconButton(
                  icon: Icon(
                    product.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  // size: 20,
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    product.toggleFavouriteStatus();
                  },
                ),
                backgroundColor: Colors.black54,
                title: Text(
                  '₹ ${product.price}',
                  style: TextStyle(
                    fontFamily: 'Basic',
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Theme.of(context).accentColor,
                    size: 20,
                  ),
                  onPressed: () {
                    cart.addToCart(
                      product.id,
                      product.price,
                      product.title,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
