import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'products.dart';

//ChangeNotifier is a Mix-in, which provides with already existing functions:
class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'PREDATOR HELIOS 300',
      isFavourite: false,
      description: 'The best in bugdet gaming laptop!',
      price: 120999,
      imageUrl:
          'https://images.idgesg.net/images/article/2018/03/acer-predator-helios-300-1-100753274-large.jpg',
    ),
    Product(
      id: 'p2',
      title: 'NVIDIA RTX 3080',
      isFavourite: false,
      description: 'NVIDIA RTX 3090 - The most powerful GPU ever!',
      price: 156000,
      imageUrl:
          'https://specials-images.forbesimg.com/imageserve/5f615e7f718725a0a188f91c/960x0.jpg?fit=scale',
    ),
    Product(
      id: 'p3',
      title: 'MSI MONITOR',
      isFavourite: false,
      description: '144 Hz MSI Monitor @17k',
      price: 17499,
      imageUrl:
          'https://images.costco-static.com/ImageDelivery/imageService?profileId=12026540&imageId=1444843-847__1&recipeName=350',
    ),
    Product(
      id: 'p4',
      title: 'KFC CONSOLE',
      description: 'Prepare any meal you want.',
      price: 65999,
      isFavourite: false,
      imageUrl:
          'https://www.hitc.com/static/uploads/2020/12/Is-the-KFC-console-real-or-fake-Fans-want-price-and-release-date-1024x651.jpg',
    ),
    Product(
      id: 'p5',
      title: 'GAMING MOUSE',
      description: 'Lets have a game of CS:GO!',
      price: 2599,
      isFavourite: false,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/m3XrwcaHT4eXuHHuKpsMDF-970-80.jpg.webp',
    ),
    Product(
      id: 'p6',
      title: 'GAMING KEYBOARD',
      description: 'Lets have a game of CS:GO!',
      price: 5599,
      isFavourite: false,
      imageUrl:
          'https://www.trustedreviews.com/wp-content/uploads/sites/54/2019/03/Razer-BlackWidow-2019-Close-Up-1220x813.png',
    ),
    Product(
      id: 'p7',
      title: 'iPhone 12',
      description: 'Be an apple user!',
      price: 12599,
      isFavourite: false,
      imageUrl:
          'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-12-pro-family-hero?wid=470&amp;hei=556&amp;fmt=jpeg&amp;qlt=95&amp;op_usm=0.5,0.5&amp;.v=1604021663000',
    ),
  ];

  List<Product> get items {
    // if (_showFavouritesOnly) {
    //   return _items.where((element) => element.isFavourite).toList();
    // }
    return [..._items];
  }

  List<Product> get favouriteItems {
    return _items.where((prodItem) => prodItem.isFavourite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  // void showFavouritesOnly() {
  //   _showFavouritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavouritesOnly = false;
  //   notifyListeners();
  // }
}
