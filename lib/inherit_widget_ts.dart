import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestInheit extends InheritedWidget {
  final int index;

  final Widget child;

  TestInheit(this.index, this.child) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return (oldWidget is TestInheit && oldWidget.index != index);
  }
}

class AWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TestInheit a = context.inheritFromWidgetOfExactType(TestInheit);
    return Container(
      color: Colors.blue,
      child: Text(a.index.toString()),
    );
  }
}
