import 'package:dart_basic_assignment/2_console_shopping_mall/products.dart';

class Cart {
  List<Product> products = [];

  void add(Product product) {
    products.add(product);
  }

  void addAll(Iterable<Product> products) {
    this.products.addAll(products);
  }

  List<Product> getAllProducts() {
    return products;
  }
}
