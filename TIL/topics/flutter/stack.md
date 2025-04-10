## Stack

- 자식 위젯들을 겹쳐서 배치, 첫번째 자식이 맨 아래, 그위로 하나씩 붙임

```
Stack(
  children: [
    Container(color: Colors.red, width: 100, height: 100),
    Container(color: Colors.green, width: 80, height: 80),
    Container(color: Colors.blue, width: 60, height: 60),
  ],
)
```

주요 속성

1. children : Stack안에 쌓을 위젯 리스트
2. alignment : 자식 정렬 기준
3. fit : 자식이 Stack에 얼마나 맞춰지는지 설정
4. clipBehavior : Stack영역을 넘는 위젯을 자를지 여부 파악

### alignment

```
Stack(
alignment: Alignment.center
children: [...]
)
```

1. center : 중앙 정렬
2. centerRight : 우측 중앙
3. bottomCenter : 하단 중앙
4. topLeft : 좌상단 정렬
   등등 이 있음

### fit

```
fit : StackFit.expand
```

1. expand : 자식들이 Stack의 크기까지 확장됨
2. loose(기본값) : 자식들의 크기 자유롭게 결정

### clipBehavior

```
clipBehavior: Clip.none, // 영역 넘는 것 보여줌
```

1. Clip.hardEdge: 넘는 부분은 자름
2. Clip.none : 넘는 부분 그대로 납둠

### ★ Positioned ★

Stack의 자식 중 위치를 정확히 제어하기 위해 사용

```
Stack(
  children: [
    Container(color: Colors.red, width: 300, height: 300),
    Positioned(
      left: 20,
      top: 40,
      child: Container(color: Colors.blue, width: 100, height: 100),
    ),
  ],
)

```

### Stack을 활용한 이미지 + gradient 효과 추가

```
 return Stack(
      children: [
        Container(
          height: 150,
          width: 315,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('../assets/images/bibimbop.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: 150,
          width: 315,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              //transparent = 투명한 색
              colors: [Colors.transparent, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
```

Colors.transparent를 추가하여 투명한 색으로 그라데이션을 줘서 아랫부분이미지를 더 어둡게 할 수 있음