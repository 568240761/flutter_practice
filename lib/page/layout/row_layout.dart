import 'package:flutter/material.dart';

class RowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Row会在主轴方向占用尽可能大的空间，而纵轴的长度则取决于他们最大子元素的长度。
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          Row(
            //Row的宽度由子控件中宽度最大的决定
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            //表示水平方向子组件的布局顺序，默认为系统当前Locale环境的文本方向。
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            //表示子组件纵轴的对齐方向
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text(" hello world ", style: TextStyle(fontSize: 30.0),),
              Text(" I am Jack "),
            ],
          ),
          Container(
            color: Colors.greenAccent,
            child: Row(
              children: [
                Container(
                  color: Colors.red,
                  //内层Row宽度为实际宽度
                  child: Row(
                    children: [
                      Text(" hello world "),
                      Text(" I am Jack "),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
