# Dart 프로젝트 트러블슈팅

## 1. VSCode Debug Console 입력 오류

### 문제
콘솔 입력을 사용하는 Dart 프로그램을 VSCode Debug Console에서 실행할 때 발생하는 오류

```dart
import 'dart:io';

int main() {
  stdout.write('학생의 점수를 입력하세요: ');
  String? score = stdin.readLineSync();
  // ...
}
```

### 에러 메시지
```
Unknown evaluation response type: null
```

### 원인 및 해결방법
- VSCode Debug Console에서는 `stdin.readLineSync()` 같은 사용자 입력을 처리할 수 없음
- **해결방법**: 1) Settings → 2) Dart라고 검색 → Run and debug → Cli console → terminal 또는 external terminal 클릭하기

**참고 링크**: https://tofu.inblog.io/dart-unknown-evaluation-response-type-null-에러-23633

## 2. Double to Int 타입 캐스팅 오류

### 문제
할인 금액 계산 시 double 값을 int로 잘못 캐스팅하여 발생한 런타임 에러

```dart
int getDiscountPrice() {
  if (checkSales()) {
    return getTotalPrice() * 0.1 as int;  // 잘못된 방법
  }
  return 0;
}
```

### 에러 메시지
```
Unhandled exception:
type 'double' is not a subtype of type 'int' in type cast
```

### 해결방법
`as int` 대신 `.toInt()` 메소드 사용

```dart
int getDiscountPrice() {
  if (checkSales()) {
    return (getTotalPrice() * 0.1).toInt();  // 올바른 방법
  }
  return 0;
}
```

### 차이점
- `as int`: 타입 캐스팅 (double을 int로 변환 불가)
- `.toInt()`: 실제 값 변환 (소수점 이하 버림)