import 'package:flutter/material.dart';

class ImageScaleAnimation extends StatefulWidget {
  @override
  State createState() {
    return ImageScaleAnimationState();
  }
}

class ImageScaleAnimationState extends State<ImageScaleAnimation>
    with SingleTickerProviderStateMixin {
  //AnimationController用于控制动画，AnimationController继承于Animation。
  //默认情况下，AnimationController对象值的范围是[0.0，1.0]。
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 300.0,
    )..addListener(() {
        setState(() {});
      });

    //启动动画(正向执行)
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片逐渐放大-方式一"),
      ),
      body: Center(
        child: Image.asset(
          "images/assets.jpeg",
          width: _controller.value,
          height: _controller.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ImageScaleAnimation1 extends StatefulWidget {
  @override
  State createState() {
    return ImageScaleAnimationState1();
  }
}

class ImageScaleAnimationState1 extends State<ImageScaleAnimation1>
    with SingleTickerProviderStateMixin {
  //Animation是一个抽象类，它本身和UI渲染没有任何关系，而它主要的功能是保存动画的插值和状态
  Animation<double> _animation;

  //AnimationController用于控制动画，AnimationController继承于Animation。
  //默认情况下，AnimationController对象值的范围是[0.0，1.0]。
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    //默认情况下，AnimationController对象值的范围是[0.0，1.0]。
    //如果我们需要构建UI的动画值在不同的范围或不同的数据类型，则可以使用Tween来添加映射以生成不同的范围或数据类型的值。
    //Tween继承自Animatable<T>，而不是继承自Animation<T>，Animatable中主要定义动画值的映射规则。
    //Tween对象不存储任何状态，相反，它提供了evaluate(Animation<double> animation)方法，它可以获取动画当前映射值。
    //Animation对象的当前值可以通过value()方法取到。
    //调用其animate()方法，返回的是一个Animation。
    _animation = Tween(begin: 0.0, end: 300.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    //启动动画(正向执行)
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片逐渐放大-方式二"),
      ),
      body: Center(
        child: Image.asset(
          "images/assets.jpeg",
          width: _animation.value,
          height: _animation.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

//AnimatedWidget类封装了调用setState()的细节，并允许我们将widget分离出来。
class AnimatedImage extends AnimatedWidget {
  const AnimatedImage({
    Key key,
    @required this.animation,
  }) : super(key: key, listenable: animation);

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "images/assets.jpeg",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

class ImageScaleAnimation2 extends StatefulWidget {
  @override
  State createState() {
    return ImageScaleAnimationState2();
  }
}

class ImageScaleAnimationState2 extends State<ImageScaleAnimation2>
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

    _animation = Tween(begin: 0.0, end: 300.0).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片逐渐放大-AnimatedWidget"),
      ),
      body: AnimatedImage(
        animation: _animation,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ImageScaleAnimation3 extends StatefulWidget {
  @override
  State createState() {
    return ImageScaleAnimationState3();
  }
}

class ImageScaleAnimationState3 extends State<ImageScaleAnimation3>
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

    _animation = Tween(begin: 0.0, end: 300.0).animate(_controller);

    //启动动画(正向执行)
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片逐渐放大--AnimatedBuilder"),
      ),
      //AnimatedWidget从动画中分离出widget，而动画的渲染过程仍然在AnimatedWidget中，
      //假设如果我们再添加一个widget透明度变化的动画，那么我们需要再实现一个AnimatedWidget，这样是很麻烦。
      //这种情况可以使用AnimatedBuilder。
      //AnimatedBuilder将渲染逻辑分离出来。
      //Flutter中正是通过这种方式封装了很多动画，如：FadeTransition、ScaleTransition、SizeTransition等，很多时候都可以复用这些预置的过渡类。
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
