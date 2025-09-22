/*
[ 설명 ]

- 제시된 예시 점수에  해당하는 등급을 알맞게 출력하세요!

[ 조건 ]

- 예시 점수 : 84점
- 점수에 따른 등급 기준
    - 90점 ~ 100점 : A등급
    - 80점 ~ 89점 : B등급
    - 80점 이하는 C등급
- 출력 형태 : 이 학생의 점수는 [점수] 이며, 등급은 [등급]입니다!
- 출력 예시
--------------------------------------------------

필 수 문 제 1번
이 학생의 점수는 84점 이며, 등급은 B등급입니다!

--------------------------------------------------
*/

import 'dart:io';

void runScoreToGarde() {
  stdout.write('학생의 점수를 입력하세요: ');

  String? intput = stdin.readLineSync();
  int score = parseScore(input: intput);
  String grade = getGrade(score: score);

  printScore(score: score, grade: grade);
}

int parseScore({required String? input}) {
  if (input != null && input.isNotEmpty) {
    int? score = int.tryParse(input);
    if (score == null) {
      throw Exception('잘못된 형식입니다. 숫자를 입력해 주세요.');
    }
    return score;
  } else {
    throw Exception('점수 입력이 안되었습니다.');
  }
}

String getGrade({required int score}) {
  if (score > 100 || score < 0) {
    throw Exception('점수 입력 범위를 벗어났습니다. 0~100 사이의 점수를 입력해 주세요.');
  }
  if (score >= 90) {
    return 'A';
  } else if (score >= 80) {
    return 'B';
  } else {
    return 'C';
  }
}

void printScore({required int score, required String grade}) {
  print('-----------------------------------------');
  print('');
  print('필수 문제 1번');
  print('');
  print('이 학생의 점수는 $score 이며, 등급은 $grade입니다!');
  print('-----------------------------------------');
}
