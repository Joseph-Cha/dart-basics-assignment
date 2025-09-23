class Product {
  late String name;
  late int price;
}

class TShirt extends Product {
  TShirt({String name = "티셔츠", int price = 10000}) {
    super.name = name;
    super.price = price;
  }
}

class Pants extends Product {
  Pants({String name = "바지", int price = 8000}) {
    super.name = name;
    super.price = price;
  }
}

class Hat extends Product {
  Hat({String name = "모자", int price = 4000}) {
    super.name = name;
    super.price = price;
  }
}
