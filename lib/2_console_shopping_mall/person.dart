import 'package:dart_basic_assignment/2_console_shopping_mall/cart.dart';
import 'package:dart_basic_assignment/2_console_shopping_mall/products.dart';

class Person {
  final Cart _cart;

  Person() : _cart = Cart();

  Cart get cart => _cart;

  void addProduct(Product product) {
    _cart.addProduct(product);
  }

  void addProducts(Iterable<Product> products) {
    _cart.addProducts(products);
  }

  List<Product> get products => _cart.products;

  int get totalSpent => _cart.totalPrice;
}
