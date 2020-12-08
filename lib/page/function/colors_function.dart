import 'package:flutter/material.dart';

class ColorsFunction extends StatefulWidget {
  @override
  State createState() {
    return ColorsFunctionState();
  }
}

class ColorsFunctionState extends State<ColorsFunction> {
  @override
  Widget build(BuildContext context) {
    //颜色是一个字符串变量
    var c = "dc380d";

    return Scaffold(
      appBar: AppBar(
        title: Text("颜色和主题"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                //颜色固定可以直接使用Color创建
                color: Color(0xffdc380d),
              ),
              child: SizedBox(
                width: 100,
                height: 50,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  //通过位运算符将Alpha设置为FF
                  color: Color(int.parse(c, radix: 16) | 0xFF000000),
                ),
                child: SizedBox(
                  width: 100,
                  height: 50,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  //通过方法将Alpha设置为FF
                  color: Color(int.parse(c, radix: 16)).withAlpha(255),
                ),
                child: SizedBox(
                  width: 100,
                  height: 50,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: NavBar(
                color: Colors.blue,
                title: "颜色亮",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: NavBar(
                color: Colors.white,
                title: "颜色浅",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  NavBar({
    Key key,
    this.color,
    this.title,
  });

  final String title;

  //背景颜色
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          //阴影
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 3,
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          //根据背景色亮度来确定Title颜色
          //computeLuminance()方法，返回一个[0-1]的一个值，数字越大颜色就越浅。
          color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}
