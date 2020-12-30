import 'package:flutter/material.dart';

import './product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductsGridView extends StatelessWidget {
  final bool showFavs;

  ProductsGridView(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        showFavs ? productsData.favouriteItems : productsData.items;

    //
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 25),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        // create: (ctx) => products[index],
        value: products[index],
        child: ProductItem(
            // products[index].id,
            // products[index].title,
            // products[index].imageUrl,
            // products[index].price,
            ),
      ),
      itemCount: products.length,
    );
  }
}
