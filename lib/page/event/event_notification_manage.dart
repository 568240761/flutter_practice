import 'package:flutter/material.dart';
import 'handle_event.dart';

class EventNotificationManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("事件处理与通知"),
      ),
      body: Center(
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
          ],
        ),
      ),
    );
  }
}
