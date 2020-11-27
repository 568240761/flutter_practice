import 'package:flutter/material.dart';

class LoadImage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("加载图片-方式二"),
      ),
      body: Center(
        child: Image.asset(
          "images/assets_1.gif",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
