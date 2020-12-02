import 'package:flutter/material.dart';

class AlignLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Align"),
      ),
      body: Column(
        children: [
          //Align可以根据子组件的宽高来确定自身的的宽高
          Container(
            color: Colors.grey,
            child: Align(
              widthFactor: 2,
              heightFactor: 2,
              alignment: Alignment.topRight,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),

          Container(
            color: Colors.orangeAccent,
            child: Align(
              widthFactor: 2,
              heightFactor: 2,
              //Alignment会以矩形的中心点作为坐标原点。
              //通过其坐标转换公式将其坐标转为子元素的具体偏移坐标：
              //(Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)
              alignment: Alignment(2, 0.0),
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),

          Container(
            height: 120.0,
            width: 120.0,
            color: Colors.brown,
            child: Align(
              //FractionalOffset的坐标原点为矩形的左侧顶点。
              //通过其坐标转换公式将其坐标转为子元素的具体偏移坐标：
              //(FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)
              alignment: FractionalOffset(0.2, 0.6),
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),

          //Center继承自Align，widthFactor或heightFactor为null时组件的宽高将会占用尽可能多的空间。
          Container(
            color: Colors.red,
            child:Center(
              heightFactor: 3.0,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
