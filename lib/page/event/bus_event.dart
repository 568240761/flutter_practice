//订阅者回调签名
import 'package:flutter/material.dart';

enum EventName {
  Login,
}

typedef void EventCallback(arg);

class EventBus {
  //私有构造函数
  EventBus._internal();

  //在Dart中实现单例模式的标准做法就是使用static变量+工厂构造函数的方式，
  //这样就可以保证new EventBus()始终返回都是同一个实例。
  //保存单例
  static EventBus _singleton = new EventBus._internal();

  //工厂构造函数
  factory EventBus() => _singleton;

  //保存事件订阅者队列，key:事件名(id)，value: 对应事件的订阅者队列
  var _emap = new Map<EventName, List<EventCallback>>();

  //添加订阅者
  void on(EventName eventName, EventCallback f) {
    if (eventName == null || f == null) return;
    _emap[eventName] ??= new List<EventCallback>();
    _emap[eventName].add(f);
  }

  //移除订阅者
  void off(EventName eventName, [EventCallback f]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  //触发事件，事件触发后该事件所有订阅者会被调用
  void emit(EventName eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    //反向遍历，防止订阅者在回调中移除自身带来的下标错位
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }
}

//定义一个top-level（全局）变量，页面引入该文件后可以直接使用bus
final bus = new EventBus();

class BusFirst extends StatefulWidget {
  @override
  State createState() {
    return BusFirstState();
  }
}

class BusFirstState extends State<BusFirst> {
  String _msg = "还未登录";

  @override
  void initState() {
    super.initState();
    bus.on(EventName.Login, (arg) {
      setState(() {
        _msg = "$arg登录了";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("全局事件总线"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_msg),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return BusSecond();
                    }),
                  );
                },
                child: Text("登录"),
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    bus.off(EventName.Login);
  }
}

class BusSecond extends StatefulWidget {
  @override
  State createState() {
    return BusSecondState();
  }
}

class BusSecondState extends State<BusSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("全局事件总线"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            bus.emit(EventName.Login, "牛牛");
          },
          child: Text("点击登录"),
          color: Colors.blue,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
