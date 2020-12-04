import 'package:flutter/material.dart';

class GridScroll1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("横轴为固定数量子元素的GridView"),
      ),
      //也可以使用GridView.count构造函数，它内部使用了SliverGridDelegateWithFixedCrossAxisCount，通过它可以快速的创建横轴固定数量子元素的GridView。
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20.0, //主轴方向的间距
            crossAxisSpacing: 40.0, //横轴方向子元素的间距
            crossAxisCount: 3, //横轴三个子widget
            childAspectRatio: 1.0 //宽高比为1时，子widget
            ),
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast)
        ],
      ),
    );
  }
}

class GridScroll2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置GridView横轴子元素的固定最大长度"),
      ),
      //也可以使用GridView.extent构造函数，它内部使用了SliverGridDelegateWithMaxCrossAxisExtent，通过它可以快速的创建横轴固定数量子元素的GridView。
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //元素在横轴上的最大长度，之所以是“最大”长度，是因为横轴方向每个子元素的长度仍然是等分的
          maxCrossAxisExtent: 100.0,
          childAspectRatio: 2.0, //宽高比为2
        ),
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast)
        ],
      ),
    );
  }
}