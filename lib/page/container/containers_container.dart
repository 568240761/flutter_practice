import 'package:flutter/material.dart';

class ContainersContainer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      //Container是一个组合类容器，它本身不对应具体的RenderObject。
      //它是DecoratedBox、ConstrainedBox、Transform、Padding、Align等组件组合的一个多功能容器。
      body: Container(
        //Container内margin和padding都是通过Padding 组件来实现的
        margin: EdgeInsets.only(top: 50.0, left: 120.0), //容器外填充
        constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0), //卡片大小
        decoration: BoxDecoration(//背景装饰
            gradient: RadialGradient( //背景径向渐变
                colors: [Colors.red, Colors.orange],
                center: Alignment.topLeft,
                radius: .98
            ),
            boxShadow: [ //卡片阴影
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0
              )
            ]
        ),
        transform: Matrix4.rotationZ(.2), //卡片倾斜变换
        alignment: Alignment.center, //卡片内文字居中
        child: Text( //卡片文字
          "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),
      ),
    );
  }
}