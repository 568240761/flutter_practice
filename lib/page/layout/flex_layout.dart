import 'package:flutter/material.dart';

class FlexLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flex"),
      ),
      //Row和Column都继承自Flex，参数基本相同，所以能使用Flex的地方基本上都可以使用Row或Column。
      body: Flex(
        mainAxisAlignment: MainAxisAlignment.center,
        direction: Axis.vertical,
        children: [
          Text("hello flutter"),
          Text("I am yang"),
        ],
      ),
    );
  }
}