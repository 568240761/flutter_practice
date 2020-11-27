import 'package:flutter/material.dart';

class LoadImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("加载图片-方式一"),
      ),
      body: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/assets.jpeg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
