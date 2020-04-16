import 'dart:async';

///
///在 Flutter 中，整个 Stream 设计，主要包含了 StreamController 、Sink 、Stream 、StreamSubscription 四个对象。
///

class StreamTst {

  ///stream默认为async模式， 此模式下注册的事件会加入scheduleMicrotask队列， 
  ///scheduleMicrotask消息队列优先级高于Event， 属于Microtask队列
  StreamController<List<String>> _dataController =
      StreamController<List<String>>();

  StreamSink<List<String>> get _dataSink => _dataController.sink;

  Stream<List<String>> get _dataStream => _dataController.stream;

  StreamSubscription _dataSubscription;

  init() {
    ///广播模式
    // _dataStream.asBroadcastStream().listen((val) {
    //   print('Subscription::::');
    //   print(val);
    // });
    //单个模式， 只能被注册一次
    _dataSubscription = _dataStream.listen((value) {
      print('Subscription::::');
      print(value);
    });
    _dataSink.add(["first", "second", "three", "more"]);
  }

  close() {
    _dataSubscription.cancel();
    _dataController.close();
  }
}
