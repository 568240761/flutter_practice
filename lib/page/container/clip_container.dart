import 'package:flutter/material.dart';

class ClipContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset("images/timg.jpg", width: 60.0);

    return Scaffold(
      appBar: AppBar(
        title: Text("剪裁"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            avatar,
            //子组件为正方形时剪裁为内贴圆形，为矩形时，剪裁为内贴椭圆
            ClipOval(
              child: avatar,
            ),
            //将子组件剪裁为圆角矩形
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: avatar,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                  child: avatar,
                ),
                Text(
                  "你好世界",
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //剪裁子组件到实际占用的矩形大小（溢出部分剪裁）
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5, //宽度设为原来宽度一半
                    child: avatar,
                  ),
                ),
                Text("你好世界", style: TextStyle(color: Colors.green))
              ],
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: ClipRect(
                  //使用自定义的clipper剪裁是在layout完成后的绘制阶段进行的，所以不会影响组件的大小。
                  clipper: MyClipper(),
                  child: avatar),
            )
          ],
        ),
      ),
    );
  }
}

//使用CustomClipper剪裁子组件的特定区域
class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
