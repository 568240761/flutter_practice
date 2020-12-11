import 'package:flutter/material.dart';
import 'package:flutter_practice/page/event/bus_event.dart';
import 'gesture_event.dart';
import 'handle_event.dart';
import 'notification_event.dart';

class EventNotificationManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("事件处理与通知"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return HandleEvent1();
                    }),
                  );
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("事件处理_1"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return HandleEvent2();
                    }),
                  );
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("事件处理_2"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return HandleEvent3();
                    }),
                  );
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("事件处理_3"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return HandleEvent4();
                    }),
                  );
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("忽略处理"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return GestureEvent();
                    }),
                  );
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("手势识别(点击、双击、长按)"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return GestureEvent1();
                    }),
                  );
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("手势识别(拖动)"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return GestureEvent2();
                    }),
                  );
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("手势识别(单一方向拖动)"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return GestureEvent3();
                    }),
                  );
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("手势识别(缩放)"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return GestureEvent4();
                    }),
                  );
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("GestureRecognizer"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return GestureEvent5();
                    }),
                  );
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("手势竞争"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return GestureEvent6();
                    }),
                  );
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("手势冲突"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return BusFirst();
                    }),
                  );
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("全局事件总线"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ScrollNotificationSimple();
                    }),
                  );
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("监听通知"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return NotificationRoute();
                    }),
                  );
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("自定义通知"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
