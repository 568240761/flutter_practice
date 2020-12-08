import 'package:flutter/material.dart';
import 'package:flutter_practice/page/function/dialog_function.dart';
import 'package:flutter_practice/page/function/stream_builder_function.dart';

import 'colors_function.dart';
import 'future_builder_function.dart';
import 'inherited_widget_function.dart';
import 'provider_function.dart';
import 'theme_function.dart';
import 'will_pop_scope_function.dart';

class FunctionManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("功能组件"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return WillPopScopeFunction();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("导航返回拦截"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return InheritedWidgetFunction();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("数据共享"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return CartFunction();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("跨组件状态共享（Provider）"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ColorsFunction();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("颜色"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ThemeFunction();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("主题"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return FutureBuilderFunction();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("异步UI更新-FutureBuilder"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return StreamBuilderFunction();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("异步UI更新-StreamBuilder"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return DialogFunction();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("对话框"),
            ),
          ],
        ),
      ),
    );
  }
}
