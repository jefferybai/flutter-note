import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  StatefulElement createElement() {
    print('createElement');
    return super.createElement();
  }

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int num = 0;

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
    NumProvider numProvider = context.inheritFromWidgetOfExactType(NumProvider);
    num = numProvider.num;
  }

  @override
  void initState() {
    print('initState');
    super.initState();
  }

  @override
  void didUpdateWidget(Counter oldWidget) {
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Column(
      children: <Widget>[
        Container(
          height: 500,
          color: Colors.black12,
          child: Center(
            child: Text(
              num.toString(),
              style: TextStyle(fontSize: 38),
            ),
          ),
        ),
        GestureDetector(
            onTap: () => this.setState(() => num += 1),
            child: Container(
              width: 50,
              height: 50,
              color: Colors.yellowAccent,
              child: Center(child: Text('+', style: TextStyle(fontSize: 38))),
            ))
      ],
    );
  }
}

class NumProvider extends InheritedWidget {
  final int num;

  final Widget child;

  NumProvider(this.num, this.child) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return (oldWidget is NumProvider && num != oldWidget.num);
  }
}

class NumContainer extends StatefulWidget {
  @override
  _NumContainerState createState() => _NumContainerState();
}

class _NumContainerState extends State<NumContainer> {
  int num = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NumProvider(num, Counter()),
      floatingActionButton:
          FloatingActionButton(onPressed: () => this.setState(() => num += 1)),
    );
  }
}
