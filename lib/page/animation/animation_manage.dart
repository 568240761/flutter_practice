import 'package:flutter/material.dart';
import 'hero_animation.dart';
import 'more_animation.dart';
import 'page_animation.dart';
import 'status_animation.dart';
import 'image_scale_animation.dart';
import 'switch_animation.dart';
import 'transition_animation.dart';

class AnimationManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: Center(
        child: Column(
          children: [
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ImageScaleAnimation();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("图片逐渐放大-方式一"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ImageScaleAnimation1();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("图片逐渐放大-方式二"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ImageScaleAnimation2();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("图片逐渐放大-AnimatedWidget"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ImageScaleAnimation3();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("图片逐渐放大-AnimatedBuilder"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return StatusAnimation();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("监听动画状态"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return PageAnimation();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("自定义路由切换动画"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return HeroAnimation();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Hero动画"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return MoreAnimation();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("交织动画"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SwitchAnimation();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("通用“动画切换”组件"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return TransitionAnimation();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("内部自管理AnimationController的组件"),
            ),
          ],
        ),
      ),
    );
  }
}
