import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Screens/products_overview_screen.dart';
import './Screens/product_detail_screen.dart';
import './providers/products_provider.dart';
import './providers/cart.dart';
import './Screens/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue[400],
          accentColor: Colors.teal[400],
          fontFamily: 'Alatsi',
        ),
        title: "Shop App",
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
