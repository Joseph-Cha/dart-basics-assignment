import 'package:dart_basic_assignment/2_console_shopping_mall/person.dart';

class ShoppingMall {
  Person person;

  ShoppingMall(this.person);

  int getTotalPrice() {
    int totalPrice = person.getAllProducts().fold(0, (previous, product) {
      return previous + product.price;
    });

    return totalPrice;
  }

  bool checkSales() {
    return getTotalPrice() > 20000;
  }

  int getDiscountPrice() {
    if (checkSales()) {
      return (getTotalPrice() * 0.1).toInt();
    }
    return 0;
  }

  void printCartPrice() {
    int priceBeforeDiscount = getTotalPrice();
    int discoutPrice = getDiscountPrice();
    int priceAfterDiscount = getTotalPrice() - getDiscountPrice();
    print('-----------------------------------------');
    print('');
    print('필수 문제 2번');
    print('');
    print('장바구니에 $priceBeforeDiscount 어치를 담으셨네요!');
    print('');
    if (checkSales()) {
      print('할인 금액: $discoutPrice');
      print('');
    }
    print('최종적으로 결제하실 금액은 $priceAfterDiscount원입니다!');
    print('');
    print('-----------------------------------------');
  }
}
