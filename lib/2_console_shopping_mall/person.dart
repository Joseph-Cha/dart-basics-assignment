import 'package:dart_basic_assignment/2_console_shopping_mall/cart.dart';
import 'package:dart_basic_assignment/2_console_shopping_mall/products.dart';

class Person {
  Cart cart;

  Person(this.cart);

  void addProduct(Product product) {
    cart.add(product);
  }

  void addAllProduct(Iterable<Product> products) {
    cart.addAll(products);
  }

  List<Product> getAllProducts() {
    return cart.getAllProducts();
  }
}
