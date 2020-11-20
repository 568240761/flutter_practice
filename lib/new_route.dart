import 'package:flutter/material.dart';
import 'package:flutter_practice/new_route_data.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新路由"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("这是一个新页面"),
            FlatButton(
              onPressed: () async {
                var result = await Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) {
                      return NewRouteData(text: "这本书要多少钱？");
                    },
                  ),
                );

                print("返回的结果：$result");
              },
              child: Text("点击跳转到新路由，并传入数据"),
            ),
          ],
        ),
      ),
    );
  }
}
