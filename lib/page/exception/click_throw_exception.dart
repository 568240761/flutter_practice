import 'package:flutter/material.dart';

class ClickThrowException extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("点击抛出异常"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            throw FormatException("点击抛出异常");
          },
          textColor: Colors.white,
          color: Colors.blue,
          child: Text("点击产生异常"),
        ),
      ),
    );
  }
}
