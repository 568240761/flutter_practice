import 'package:flutter/material.dart';
import 'route/route_manage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
            Text(
              '按下按钮的次数：',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
