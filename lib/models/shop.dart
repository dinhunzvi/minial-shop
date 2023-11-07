import 'package:minimal_shop/models/product.dart';

class Shop {
  // list of products for sale
  final List<Product> _shop = [
    // product 1
    Product(name: "Product 1",
        price: 99.99,
        description: "Item Description",
        //imagePath: "Image path"
    ),

    // product 2
    Product(
        name: "Product 2",
        price: 99.99,
        description: "Item description"),

    // product 3
    Product(
        name: "Product 3",
        price: 99.99,
        description: "Item description"),

    // product 3
    Product(
        name: "Product 4",
        price: 75.00,
        description: "Item description"),

  ];

  // user cart
  List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add product to list
  void addToCart(Product item) {
    _cart.add(item);
  }

  // remove product from list
  void removeFromCart(Product item){
    _cart.remove(item);
  }

}