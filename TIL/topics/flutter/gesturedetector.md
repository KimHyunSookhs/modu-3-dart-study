## GestureDetector

```
class _SmallButtonState extends State<SmallButton> {
  void callOnClick() {
    widget.onClick.call();
  }

  bool _enable = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _enable = false;
        });
      },
      onTapUp: (details) {
        setState(() {
          _enable = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _enable = true;
        });
      },
      child: ElevatedButton(
        onPressed: callOnClick,
        style:
            _enable ? ButtonStyles.elevatedButton : ButtonStyles.disableButton,
        child: Container(
        ),
      ),
    );
  }
}

```

GestureDetector를 활용해
tapdown = 버튼 꾹 누르고있을때
tapup = 버튼 위치에서 손을 놓을때
tapcancle = 버튼 위치가 아닌곳에서 손을 놓을때
각 경우에 맞는 동작을 진행할 수 있다.