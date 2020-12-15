import 'package:flutter/material.dart';

class TransitionAnimation extends StatefulWidget {
  @override
  State createState() {
    return TransitionAnimationState();
  }
}

class TransitionAnimationState extends State<TransitionAnimation> {
  Color _decorationColor1 = Colors.blue;
  Color _decorationColor2 = Colors.blue;
  var duration = Duration(seconds: 1);

  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black, fontSize: 30.0);
  Color _decorationColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("内部自管理AnimationController的组件"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDecoratedBox1(
              duration: duration,
              decoration: BoxDecoration(color: _decorationColor1),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    _decorationColor1 = Colors.red;
                  });
                },
                child: Text(
                  "AnimatedDecoratedBox",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: AnimatedDecoratedBox2(
                duration: Duration(
                    milliseconds: _decorationColor == Colors.red ? 400 : 2000),
                decoration: BoxDecoration(color: _decorationColor2),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      //使用动画过渡组件时如果需要执行反向动画的场景，应尽量使用状态互换的方法，
                      //而不应该通过获取ImplicitlyAnimatedWidgetState中controller的方式。

                      _decorationColor2 = _decorationColor2 == Colors.blue
                          ? Colors.red
                          : Colors.blue;
                    });
                  },
                  child: Text(
                    "AnimatedDecoratedBox",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _padding = 20;
                });
              },
              //在padding发生变化时会执行过渡动画到新状态
              child: AnimatedPadding(
                duration: duration,
                padding: EdgeInsets.all(_padding),
                child: Text("AnimatedPadding"),
              ),
            ),
            SizedBox(
              height: 50,
              child: Stack(
                children: <Widget>[
                  //配合Stack一起使用，当定位状态发生变化时会执行过渡动画到新的状态。
                  AnimatedPositioned(
                    duration: duration,
                    left: _left,
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _left = 100;
                        });
                      },
                      child: Text("AnimatedPositioned"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 100,
              color: Colors.grey,
              //当alignment发生变化时会执行过渡动画到新的状态。
              child: AnimatedAlign(
                duration: duration,
                alignment: _align,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      _align = Alignment.center;
                    });
                  },
                  child: Text("AnimatedAlign"),
                ),
              ),
            ),
            //当Container属性发生变化时会执行过渡动画到新的状态。
            AnimatedContainer(
              duration: duration,
              height: _height,
              color: _color,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    _height = 150;
                    _color = Colors.blue;
                  });
                },
                child: Text(
                  "AnimatedContainer",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            //当字体样式发生变化时，子组件中继承了该样式的文本组件会动态过渡到新样式。
            AnimatedDefaultTextStyle(
              child: GestureDetector(
                child: Text("hello world"),
                onTap: () {
                  setState(() {
                    _style = TextStyle(
                      color: Colors.blue,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.blue,
                      fontSize: 40,
                    );
                  });
                },
              ),
              style: _style,
              duration: duration,
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedDecoratedBox1 extends StatefulWidget {
  AnimatedDecoratedBox1({
    Key key,
    @required this.decoration,
    this.child,
    this.curve = Curves.linear,
    @required this.duration,
    this.reverseDuration,
  });

  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration reverseDuration;

  @override
  _AnimatedDecoratedBox1State createState() => _AnimatedDecoratedBox1State();
}

//该组件在内部自管理AnimationController
class _AnimatedDecoratedBox1State extends State<AnimatedDecoratedBox1>
    with SingleTickerProviderStateMixin {
  @protected
  AnimationController get controller => _controller;
  AnimationController _controller;

  Animation<double> get animation => _animation;
  Animation<double> _animation;

  DecorationTween _tween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this,
    );
    _tween = DecorationTween(begin: widget.decoration);
    _updateCurve();
  }

  void _updateCurve() {
    if (widget.curve != null)
      _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    else
      _animation = _controller;
  }

  @override
  void didUpdateWidget(AnimatedDecoratedBox1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.curve != oldWidget.curve) _updateCurve();
    _controller.duration = widget.duration;
    _controller.reverseDuration = widget.reverseDuration;
    if (widget.decoration != (_tween.end ?? _tween.begin)) {
      _tween
        ..begin = _tween.evaluate(_animation)
        ..end = widget.decoration;
      _controller
        ..value = 0.0
        ..forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return DecoratedBox(
          decoration: _tween.animate(_animation).value,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

//为了方便开发者来实现内部自管理AnimationController组件的封装，Flutter提供了一个ImplicitlyAnimatedWidget抽象类，
//它继承自StatefulWidget，同时提供了一个对应的ImplicitlyAnimatedWidgetState类，
//AnimationController的管理就在ImplicitlyAnimatedWidgetState类中。
//开发者如果要封装动画，只需要分别继承ImplicitlyAnimatedWidget和ImplicitlyAnimatedWidgetState类即可。
class AnimatedDecoratedBox2 extends ImplicitlyAnimatedWidget {
  AnimatedDecoratedBox2({
    Key key,
    @required this.decoration,
    this.child,
    Curve curve = Curves.linear, //动画曲线
    @required Duration duration, // 正向动画执行时长
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
        );
  final BoxDecoration decoration;
  final Widget child;

  @override
  _AnimatedDecoratedBoxState2 createState() {
    return _AnimatedDecoratedBoxState2();
  }
}

//State类继承自AnimatedWidgetBaseState（该类继承自ImplicitlyAnimatedWidgetState类）。
class _AnimatedDecoratedBoxState2
    extends AnimatedWidgetBaseState<AnimatedDecoratedBox2> {
  DecorationTween _decoration; //定义一个Tween

  //在动画执行过程中，每一帧都会调用build方法（调用逻辑在ImplicitlyAnimatedWidgetState中），
  //所以在build方法中我们需要构建每一帧的DecoratedBox状态，因此得算出每一帧的decoration 状态，
  //这个我们可以通过_decoration.evaluate(animation) 来算出。
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decoration.evaluate(animation),
      child: widget.child,
    );
  }

  //forEachTween用于来更新Tween的初始值的。
  @override
  void forEachTween(visitor) {
    // 在需要更新Tween时，基类会调用此方法
    _decoration = visitor(
      _decoration, //当前的tween，第一次调用为null
      widget.decoration, // 终止状态
      (value) => DecorationTween(begin: value), //Tween构造器
    );
  }
}
