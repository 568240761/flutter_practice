import 'package:flutter/material.dart';

class StatusAnimation extends StatefulWidget {
  @override
  State createState() {
    return StatusAnimationState();
  }
}

class StatusAnimationState extends State<StatusAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 300.0).animate(_controller)
      ..addStatusListener((status) {//添加动画状态改变监听器
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    //启动动画(正向执行)
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("监听动画状态"),
      ),
      body: AnimatedBuilder(
        animation: _animation,
        child: Image.asset("images/assets.jpeg"),
        builder: (context, child) {
          return Center(
            child: Container(
              height: _animation.value,
              width: _animation.value,
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
