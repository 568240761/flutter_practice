import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.black,
              //Transform可以在其子组件绘制时对其应用一些矩阵变换来实现一些特效。
              child: Transform(
                alignment: Alignment.topRight,
                transform: Matrix4.skewY(0.9),
                child: Container(
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("hello flutter"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                //Transform.translate接收一个offset参数，可以在绘制时沿x、y轴对子组件平移指定的距离。
                child: Transform.translate(
                  offset: Offset(-20.0, -5.0),
                  child: Text("Hello flutter"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                //Transform.rotate可以对子组件进行旋转变换。
                child: Transform.rotate(
                  //旋转90度
                  angle: math.pi / 2,
                  child: Text("Hello flutter"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                //Transform.scale可以对子组件进行缩小或放大
                child: Transform.scale(
                  scale: 1.5, //放大到1.5倍
                  child: Text("Hello flutter"),
                ),
              ),
            ),

            //Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，
            //所以无论对子组件应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的。
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                    ),
                    //Transform.scale可以对子组件进行缩小或放大
                    child: Transform.scale(
                      scale: 1.5, //放大到1.5倍
                      child: Text("Hello flutter"),
                    ),
                  ),
                  Text(
                    "你好",
                    style: TextStyle(color: Colors.green, fontSize: 18.0),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                    ),

                    //RotatedBox和Transform.rotate功能相似，它们都可以对子组件进行旋转变换。
                    //但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小。
                    child: RotatedBox(
                      quarterTurns:1 ,
                      child: Text("Hello flutter"),
                    ),
                  ),
                  Text(
                    "你好",
                    style: TextStyle(color: Colors.green, fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
