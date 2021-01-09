import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import './edit_product_screen.dart';
import '../Widgets/user_product_item.dart';
import '../Widgets/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/userpscreen';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: const Text(
                "Your ",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.teal,
                ),
              ),
            ),
            const Text(
              "Products",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
          itemBuilder: (_, i) => Column(
            children: [
              Card(
                elevation: 5,
                shadowColor: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: UserProductItem(
                    productsData
                        .items[i].title, //i comes with context as the index
                    productsData.items[i].imageUrl,
                  ),
                ),
              ),
              Divider(),
            ],
          ),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
