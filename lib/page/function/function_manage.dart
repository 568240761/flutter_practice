import 'package:flutter/material.dart';

import 'inherited_widget_function.dart';
import 'provider_function.dart';
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
                    return CartFunction();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("颜色和主题"),
            ),
          ],
        ),
      ),
    );
  }
}
