abstract class Product {
  final String name;
  final int price;

  const Product({required this.name, required this.price});
}

class TShirt extends Product {
  const TShirt({super.name = "티셔츠", super.price = 10000});
}

class Pants extends Product {
  const Pants({super.name = "바지", super.price = 8000});
}

class Hat extends Product {
  const Hat({super.name = "모자", super.price = 4000});
}
