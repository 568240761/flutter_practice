import 'package:flutter/material.dart';

class DecoratedBoxContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("装饰容器"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //DecoratedBox可以在其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变等
            DecoratedBox(
              decoration: BoxDecoration(
                //背景渐变
                gradient:
                    LinearGradient(colors: [Colors.red, Colors.orange[700]]),
                //3像素圆角
                borderRadius: BorderRadius.circular(3.0),
                boxShadow: [
                  //阴影
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  //背景渐变
                  gradient:
                      LinearGradient(colors: [Colors.red, Colors.orange[700]]),
                  //3像素圆角
                  borderRadius: BorderRadius.circular(3.0),
                  boxShadow: [
                    //阴影
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(-2.0, -2.0),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  //背景渐变
                  gradient:
                      LinearGradient(colors: [Colors.red, Colors.orange[700]]),
                  //3像素圆角
                  borderRadius: BorderRadius.circular(3.0),
                  boxShadow: [
                    //阴影
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10.0,
                      spreadRadius: 2.0
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 40),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  //背景渐变
                  gradient:
                  LinearGradient(colors: [Colors.red, Colors.orange[700]]),
                  //3像素圆角
                  borderRadius: BorderRadius.circular(3.0),
                  boxShadow: [
                    //阴影
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(-2.0, -2.0),
                      blurRadius: 4.0,
                      spreadRadius: 1.0
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
