import 'package:flutter/material.dart';

class SingleChildScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollView"),
      ),
      //显示进度条
      body: Scrollbar(
        //SingleChildScrollView类似于Android中的ScrollView，只能接收一个子组件。
        //通常SingleChildScrollView只应在期望的内容不会超过屏幕太多时使用，
        //这是因为SingleChildScrollView不支持基于Sliver的延迟实例化模型，
        //所以如果预计视口可能包含超出屏幕尺寸太多的内容时，那么使用SingleChildScrollView将会非常昂贵（性能差）。
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: str.split("").map((e) {
                return Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(e),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
