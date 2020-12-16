import 'package:flutter/material.dart';
import 'package:flutter_practice/page/custom_component/custom_painting_component.dart';
import 'combination_component.dart';

class CustomManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义组件"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return CombinationComponent();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("组合现有组件"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return CustomPaintingComponent();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("自绘组件"),
            ),
          ],
        ),
      ),
    );
  }
}
