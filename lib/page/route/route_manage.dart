import 'package:flutter/material.dart';
import 'package:flutter_practice/page/route/new_route_data.dart';

class RouteManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由管理"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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

                //不会丢失日志行
                debugPrint("debugPrint-返回的结果：$result");
                //输出太多，有时会丢弃一些日志行
                print("print-返回的结果：$result");
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("点击跳转到新路由，并传入数据"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "name_route", arguments: "命名路由");
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("命名路由-方式一"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "name_route_by_generate",
                    arguments: "通过[onGenerateRoute]方法创建的");
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("命名路由-方式二"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "404");
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("不存在的路由"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "route_observable");
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("通过[RouteObserver]观察页面状态"),
            ),
          ],
        ),
      ),
    );
  }
}
