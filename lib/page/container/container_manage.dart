import 'package:flutter/material.dart';
import 'package:flutter_practice/page/container/scaffod_container.dart';
import 'clip_container.dart';
import 'containers_container.dart';
import 'transform_container.dart';
import 'decorated_box_container.dart';
import 'padding_container.dart';
import 'size_limit_container.dart';

class ContainerManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("容器组件"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return PaddingContainer();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Padding"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SizeLimit1Container();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("尺寸限制类(上)"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SizeLimit2Container();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("尺寸限制类(下)"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return DecoratedBoxContainer();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("装饰容器"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return TransformContainer();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("变换"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ContainersContainer();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Container"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ClipContainer();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("剪裁"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ScaffodContianer();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Scaffod"),
            ),
          ],
        ),
      ),
    );
  }
}
