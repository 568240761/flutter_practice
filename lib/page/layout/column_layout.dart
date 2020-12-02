import 'package:flutter/material.dart';

class ColumnLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column"),
      ),
      body: Container(
        color: Colors.green,
        child: Column(
          //Column会在主轴方向占用尽可能大的空间，而纵轴的长度则取决于他们最大子元素的长度。
          //"hi"会局中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("hi"),
            Text("world"),
            Container(
              color: Colors.red,
              //内层Colum高度为实际高度
              child: Column(
                children: <Widget>[
                  Text("hello world "),
                  Text("I am Jack "),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
