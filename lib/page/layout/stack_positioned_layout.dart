import 'package:flutter/material.dart';

class StackPositionedLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack与Positioned组合"),
      ),
      //通过ConstrainedBox来确保Stack占满屏幕
      //Stack不涉及宽高的设置
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        //用Stack和Positioned这两个组件来配合实现绝对定位。
        //Stack允许子组件堆叠，而Positioned用于根据Stack的四个角来确定子组件的位置。
        child: Stack(
          //指定未定位或部分定位widget的对齐方式
          alignment: AlignmentDirectional.center,
          fit: StackFit.expand, //未定位widget占满Stack整个空间
          children: [
            //水平上是定位了的。
            //垂直上没有定位，采用alignment属性，会在垂直方向上居中。
            Positioned(
              left: 30.0,
              child: Text("Hello flutter"),
            ),
            Text("I am yang"),
            //垂直上是定位了的。
            //水平上没有定位，采用alignment属性，会在水平方向上居中。
            Positioned(
              bottom: 10.0,
              child: Text("I am juan"),
            ),
          ],
        ),
      ),
    );
  }
}
