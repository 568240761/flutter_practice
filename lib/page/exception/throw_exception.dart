import 'package:flutter/material.dart';

class ThrowException extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("抛出异常"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            throw FormatException("测试异常");
          },
          textColor: Colors.white,
          color: Colors.blue,
          child: Text("点击产生异常"),
        ),
      ),
    );
  }
}
