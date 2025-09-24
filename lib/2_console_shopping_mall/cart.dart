import 'package:dart_basic_assignment/2_console_shopping_mall/products.dart';

class Cart {
  final List<Product> _products = [];

  void addProduct(Product product) {
    _products.add(product);
  }

  void addProducts(Iterable<Product> products) {
    _products.addAll(products);
  }

  List<Product> get products => List.unmodifiable(_products);

  int get totalPrice =>
      _products.fold(0, (sum, product) => sum + product.price);

  void clear() {
    _products.clear();
  }

  bool removeProduct(Product product) {
    return _products.remove(product);
  }
}
