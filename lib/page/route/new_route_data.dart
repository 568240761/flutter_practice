import 'package:flutter/material.dart';

class NewRouteData extends StatelessWidget {

  final String text;

  NewRouteData({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("接收上一个路由传入的数据"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.pop(context, "只要99元");
          },
          textColor: Colors.blue,
          child: Text("接收到数据[$text],点击返回数据给上一个路由"),
        ),
      ),
    );
  }
}
