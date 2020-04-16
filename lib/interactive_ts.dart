import 'package:flutter/material.dart';

///Listener监听屏幕触摸事件
class ListenerTst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 240.0,
        height: 120.0,
        child: Text(
          'ListenerTst',
          style: TextStyle(color: Colors.white),
        ),
      ),
      onPointerDown: (PointerDownEvent event) => print('onPointerDown'),
      onPointerMove: (PointerMoveEvent event) => print('onPointerMove'),
      onPointerUp: (PointerUpEvent event) => print('onPointerUp'),
      onPointerCancel: (PointerCancelEvent event) => print('onPointerCancel'),
    );
  }
}

///GestureDetector手势
///在Listener基础上组合了GestureRecognizer手势识别器，
///手势识别竞技以Pointerdown事件开始，以Pointerdown时间结束
///事件符合竞技规则就拿到竞技场入场券
///如果只有一个竞技者参与那么这个竞技者为获胜者
///如果有两个或者以上的竞技者那么第一个手势会判断为胜利，其他判断为失败
///如果有手势冲突则会进入hold住竞技场， 等待竞技者的退出，以最后留存的的竞技者为胜出者
class GestureDetectorPage extends StatefulWidget {
  @override
  _GestureDetectorState createState() => new _GestureDetectorState();
}

class _GestureDetectorState extends State<GestureDetectorPage> {
  String _opName = "未检测到操作";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GestureDetector手势识别"),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 240.0,
            height: 120.0,
            child: Text(
              _opName,
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () => _showEventText("Tap"),
          onTapUp: (e) => _showEventText("TapUp"),
          onTapDown: (e) => _showEventText("TapDown"),
          onTapCancel: () => _showEventText("TapCancel"),
          onDoubleTap: () => _showEventText("DoubleTap"),
          onLongPress: () => _showEventText("LongPress"),
          onVerticalDragDown: (e) => _showEventText("onVerticalDragDown"),
          onVerticalDragStart: (e) => _showEventText("onVerticalDragStart"),
          onVerticalDragUpdate: (e) => _showEventText("onVerticalDragUpdate"),
          onVerticalDragEnd: (e) => _showEventText("onVerticalDragEnd"),
          onVerticalDragCancel: () => _showEventText("onVerticalDragCancel"),
          onHorizontalDragDown: (e) => _showEventText("onHorizontalDragDown"),
          onHorizontalDragStart: (e) => _showEventText("onHorizontalDragStart"),
          onHorizontalDragUpdate: (e) =>
              _showEventText("onHorizontalDragUpdate"),
          onHorizontalDragEnd: (e) => _showEventText("onHorizontalDragEnd"),
          onHorizontalDragCancel: () =>
              _showEventText("onHorizontalDragCancel"),
//          onPanDown: (e) => _showEventText("onPanDown"),
//          onPanStart: (e) => _showEventText("onPanStart"),
//          onPanUpdate: (e) => _showEventText("onPanUpdate"),
//          onPanEnd: (e) => _showEventText("onPanEnd"),
//          onScaleStart: (e) => _showEventText("onScaleStart"),
//          onScaleUpdate: (e) => _showEventText("onScaleUpdate"),
//          onScaleEnd: (e) => _showEventText("onScaleEnd"),
        ),
      ),
    );
  }

  void _showEventText(String text) {
    setState(() {
      _opName = text;
    });
    print(_opName);
  }
}



///PointerEvent(忽略事件)
// IgnorePointer : ignoring是否忽略点击,默认true 不可以点击
// AbsorbPointer : absorbing child 是否接受点击事件,默认true 可以点击

class PointerEventIgnorePage extends StatefulWidget {
  @override
  _PointerEventIgnorePageState createState() =>
      new _PointerEventIgnorePageState();
}

class _PointerEventIgnorePageState extends State<PointerEventIgnorePage> {
  bool _ignore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('忽略事件')),
      body: Container(
        alignment: AlignmentDirectional.center,
        child: Column(
          children: <Widget>[
            Switch(
              value: _ignore,
              onChanged: (value) {
                setState(() => _ignore = value);
              },
            ),
            GestureDetector(
              onTap: () => print('GestureDetector Clicked!'),
              child: IgnorePointer(
                ignoring: _ignore,
                child: RaisedButton(
                  onPressed: () => print('IgnorePointer Clicked!'),
                  child: Text('IgnorePointer'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => print('GestureDetector Clicked!'),
              child: AbsorbPointer(
                absorbing: _ignore,
                child: RaisedButton(
                  onPressed: () => print('AbsorbPointer Clicked!'),
                  child: Text('AbsorbPointer'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}