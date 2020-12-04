import 'package:flutter/material.dart';
import 'package:flutter_practice/page/scroll/custom_scroll.dart';

import 'grid_scroll.dart';
import 'single_child_scroll.dart';
import 'list_scroll.dart';

class ScrollManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动组件"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SingleChildScroll();
                    },
                  ),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("SingleChildScrollView"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ListScroll1();
                    },
                  ),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("ListView_1"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ListScroll2();
                    },
                  ),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("ListView_2和滚动监听"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ListScroll3();
                    },
                  ),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("ListView_3"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ListScroll4();
                    },
                  ),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("无限加载数据"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ListScroll5();
                    },
                  ),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("添加固定列表头_1"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ListScroll6();
                    },
                  ),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("添加固定列表头_2"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GridScroll1();
                    },
                  ),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("横轴为固定数量子元素的GridView"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GridScroll2();
                    },
                  ),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("设置GridView横轴子元素的固定最大长度"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GridScroll2();
                    },
                  ),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("设置GridView横轴子元素的固定最大长度"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CustomScroll();
                    },
                  ),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("使用Sliver来自定义滚动模型（效果）的组件"),
            ),
          ],
        ),
      ),
    );
  }
}
