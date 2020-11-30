import 'package:flutter/material.dart';

class ExceptionManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("异常管理"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "auto_throw_exception");
              },
              child: Text("自动抛出异常"),
              textColor: Colors.white,
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "click_throw_exception");
              },
              child: Text("点击抛出异常"),
              textColor: Colors.white,
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "future_throw_exception");
              },
              child: Text("异步代码中抛出异常"),
              textColor: Colors.white,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
