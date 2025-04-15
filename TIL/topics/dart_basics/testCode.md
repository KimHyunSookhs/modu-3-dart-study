## Test 코드 작성

given > when > then 기법

given =준비

when = 실행

then = 검사

```dart
void main() {
  test('Cliaclic Test', () {
    //given(준비)
    Cleric cleric = Cleric();
    //when(실행)
    cleric.selfAid();
    cleric.pray(5);
    //then(검증)
    expect(cleric.mp, inInclusiveRange(0, 10));
    expect(cleric.hp, equals(50));
  });
}
```

expect가 받는 인자

| 범위 지정 | inInclusiveRange(0,10) |
|-------|------------------------|
| 동일한 값 | equals(50)             |
| 보다 크다 | greaterThan(5)         |
| 보다 작다 | lessThan(10)           |

인자의 데이터 타입 확인
expect(results[0].createdAt is DateTime, true);

에러가 발생되는지 확인
throwsException


find.byWidget(widget) = 정확히 그 인스턴스가 있는지 찾기
find.byType(type) = 해당 타입으로 화면에 있는 위젯 전체에서 찾음, 짧은 시간만 나타나는(splashscreen, dialog, snackbar)등을 찾기에 유용함