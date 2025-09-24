import 'dart:io';

import 'package:dart_basic_assignment/1_score_to_grade/score_to_grade.dart';
import 'package:dart_basic_assignment/2_console_shopping_mall/console_shopping_mall.dart';
import 'package:dart_basic_assignment/3_lottery_program/lottery_program.dart';

void main() {
  stdout.write(
    '실행할 과제를 선택해 주세요. \n1: 점수에 맞는 등급 출력하기\n2: 가상의 쇼핑몰 결제 프로그램 만들기\n3: 가상의 복권 프로그램 만들기\n',
  );

  String? intput = stdin.readLineSync();
  int? number = int.tryParse(intput!);

  if (number == 1) {
    runScoreToGarde();
  } else if (number == 2) {
    runMall();
  } else if (number == 3) {
    runLottery();
  } else {
    throw Exception('1~3번 숫자를 입력해 주세요.');
  }
}
