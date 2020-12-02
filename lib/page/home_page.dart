import 'package:flutter/material.dart';
import 'route/route_manage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RouteManage();
                }));
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("路由管理"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "assets_manage");
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("资源管理"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "exception");
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("异常捕获"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "state");
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("State生命周期"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "base_widget_manage");
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("基础组件"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "layout_manage");
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("布局组件"),
            ),
          ],
        ),
      ),
    );
  }
}
