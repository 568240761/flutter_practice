import 'package:flutter/material.dart';

class WillPopScopeFunction extends StatefulWidget {
  @override
  State createState() {
    return WillPopScopeFunctionState();
  }
}

class WillPopScopeFunctionState extends State<WillPopScopeFunction> {
  DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航返回拦截"),
      ),
      //通过WillPopScope来实现返回按钮拦截
      body: WillPopScope(
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 1)) {
            _lastPressedAt = DateTime.now();
            return false;
          }

          return true;
        },
        child: Center(
          child: Text("1秒内连续按两次返回键退出"),
        ),
      ),
    );
  }
}
