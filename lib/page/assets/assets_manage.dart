import 'package:flutter/material.dart';

class AssetsManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("资源管理"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "load_data");
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("加载数据"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "load_image");
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("加载图片-方式一"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "load_image_1");
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("加载图片-方式二"),
            ),
          ],
        ),
      ),
    );
  }
}
