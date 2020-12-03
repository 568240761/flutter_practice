import 'package:flutter/material.dart';

class PaddingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Padding"),
      ),
      body: Center(
        child: Padding(
          //所有方向均使用相同数值的填充
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                color: Colors.red,
                child: Text("Hello flutter"),
              ),
              Container(
                color: Colors.orange,
                child: Text("Hello flutter"),
              ),
              Container(
                color: Colors.greenAccent,
                child: Padding(
                  //设置具体某个方向的填充(可以同时指定多个方向)
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text("Hello flutter"),
                ),
              ),
              Padding(
                //设置对称方向的填充，vertical指top和bottom，horizontal指left和right。
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  color: Colors.brown,
                  child: Text("Hello flutter"),
                ),
              ),
              Container(
                color: Colors.blueGrey,
                child: Padding(
                  //指定四个方向的填充
                  padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                  child: Text("Hello flutter"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
