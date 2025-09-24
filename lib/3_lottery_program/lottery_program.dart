/*
가상 복권 프로그램을 만들어봅니다.

1. 1~45까지의 숫자중 중복되지 않게 6개의 번호를 뽑아 1장의 복권을 발급합니다.
2. 발급한 복권 번호를 지정된 당첨 번호와 비교하여 당첨 여부를 확인합니다.
3. 다음 당첨 조회를 위해 복권 번호를 초기화합니다.

### 1. 중복 없이 번호를 추첨하여 복권을 발급 기능

[ 설명 ]

- 1~45사이의 숫자들 중 6개의 숫자를 중복없이 뽑아 하나의 복권(리스트)으로 만듭니다.

[ 조건 ]

- 출력 형태  : 발급한 로또 번호 : [로또 번호 목록 전체]

```dart
발급한 로또 번호: [3, 11, 15, 29, 35, 42]
```

[ 힌트 ]

- Set 또는  List의 `contains()` 등을 통해 선택한 번호가 리스트에 포함되어 있는지 여부를 판별할 수 있습니다.
- 숫자를 랜덤으로 뽑는 기능은 `dart:math` 라이브러리의 Random().nextInt(int nubmer) 를 사용합니다.
    - Random().nextInt(int nubmer) 는 0부터, number-1 사이의  int 값중 하나를 무작위로 골라 반환하는 메서드입니다.

### 2. 발급한 복권의 번호와 당첨 번호 비교 기능

[ 설명 ] 

- 앞서 발급한 복권 번호를 **지정된 당첨 번호와 비교하여, 일치하는 번호의 개수를 세고 당첨 등수를 판정**합니다.

[ 조건 ]

- 당첨 번호: `[9, 19, 29, 35, 37, 38]`
- 일치 개수에 따른 당첨 기준
    - 1등: 5개 이상 일치
    - 2등: 4개 일치
    - 3등: 3개 일치
    - 실패: 2개 이하 일치
- 출력 형태
    - 당첨이 되었을 경우 `당첨 여부 : [당첨 등수]`를 출력합니다.
    - 단, 당첨에 실패한 경우는  `당첨 여부 : 당첨 실패!`  를 출력합니다

[ 힌트 ] 

- 조건문과 연산자를 통해 할인 여부, 할인 금액을 계산할 수 있습니다.

### 3. 발급한 로또를 초기화 할 수 있는 기능

[ 설명 ]

- 당첨 번호 조회 이후, 다음 당첨 여부 조회를 위해 복권번호를 초기화 합니다.

[ 조건 ]

- 추후에 당첨 여부를 다시 확인할 수 있도록 복권 **번호를 초기 상태로 되돌린 뒤**, 현재 상태를 출력하세요.

```dart
현재 발급한 로또 번호: []
```

### 4. 프로그램 출력 예시

-------------------------------------------------------------

도전 문제

발급한 로또 번호 : [22, 37, 24, 6, 23, 9]

당첨 여부: 당첨 실패

현재 발급한 로또 번호: []

-------------------------------------------------------------

### 추가. 나만의 기능
몇번을 테스트를 진행했을 때 계속 실패만 나오고 있어서 당첨이 될 때까지 프로그램을 돌리는 기능을 추가해 보려고 한다.

*/

import 'dart:math';

void runLottery() {
  Set<int> selectedNumbers = {};
  Iterable<int> check = {};
  String result = '';
  while (true) {
    selectedNumbers = selectNumber();
    check = checkWinningNumbers(selectedNumbers);
    result = getSuccess(check);
    if (result != '실패') {
      break;
    }
  }

  printResult(selectedNumbers, result);
}

Set<int> selectNumber() {
  final Set<int> selectedNumbers = {};
  for (int i = 0; i < 6; i++) {
    addNumber(selectedNumbers, i);
  }
  return selectedNumbers;
}

void addNumber(Set<int> selectedNumbers, int index) {
  while (true) {
    int number = getNumber();
    selectedNumbers.add(number);
    if (selectedNumbers.length == index + 1) {
      break;
    }
  }
}

int getNumber() {
  while (true) {
    int number = Random().nextInt(46);
    if (number > 0) {
      return number;
    }
  }
}

Iterable<int> checkWinningNumbers(Set<int> list) {
  final Set<int> winningNumbers = {9, 19, 29, 35, 37, 38};
  return list.where((n) {
    return winningNumbers.contains(n);
  });
}

String getSuccess(Iterable<int> list) {
  if (list.length > 5) {
    return '1등';
  } else if (list.length == 4) {
    return '2등';
  } else if (list.length == 3) {
    return '3등';
  } else {
    return '실패';
  }
}

void printResult(Set<int> selectedNumbers, String result) {
  print('-----------------------------------------');
  print('');
  print('도전 문제');
  print('');
  print('발급한 로또 번호: $selectedNumbers');
  print('');
  if (result == '실패') {
    print('당청 여부: 당첨 실패');
    print('');
  } else {
    print('당청 여부: $result');
    print('');
  }
  clear(selectedNumbers);
  print('현재 발급한 로또 번호: $selectedNumbers');
}

void clear(Set<int> list) {
  list.clear();
}
