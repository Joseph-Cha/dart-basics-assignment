import 'package:dart_basic_assignment/2_console_shopping_mall/person.dart';

class ShoppingMall {
  static const int _discountThreshold = 20000;
  static const double _discountRate = 0.1;

  final Person _customer;

  ShoppingMall(this._customer);

  int get totalPrice => _customer.totalSpent;

  bool get hasDiscount => totalPrice > _discountThreshold;

  int get discountAmount {
    if (hasDiscount) {
      return (totalPrice * _discountRate).toInt();
    }
    return 0;
  }

  int get finalPrice => totalPrice - discountAmount;

  void printReceipt() {
    print('-----------------------------------------');
    print('');
    print('필수 문제 2번');
    print('');
    print('장바구니에 $totalPrice원 어치를 담으셨네요!');
    print('');

    if (hasDiscount) {
      print('할인 금액: $discountAmount원');
      print('');
    }

    print('최종적으로 결제하실 금액은 $finalPrice원입니다!');
    print('');
    print('-----------------------------------------');
  }
}
