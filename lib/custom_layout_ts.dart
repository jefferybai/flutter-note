import 'package:flutter/cupertino.dart';

class CustomLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CustomSingleChildLayout(
      delegate: CustomDeleget(listenable: ChangeNotifier()),
      child: Text('自定义布局'),
    ));
  }
}

class CustomDeleget extends SingleChildLayoutDelegate {
  Listenable listenable;

  CustomDeleget({this.listenable}) : super(relayout: listenable);

  @override
  Size getSize(BoxConstraints constraints) {
    return super.getSize(constraints);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(100, 100);
  }

  @override
  bool shouldRelayout(SingleChildLayoutDelegate oldDelegate) {
    return null;
  }
}
