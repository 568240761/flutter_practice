import 'package:flutter/material.dart';

class SwitchAnimation extends StatefulWidget {
  @override
  State createState() {
    return SwitchAnimationState();
  }
}

class SwitchAnimationState extends State<SwitchAnimation> {
  int _count = 0;
  int _count1 = 0;
  int _count2 = 0;
  int _count3 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("通用“动画切换”组件"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //AnimatedSwitcher 可以同时对其新、旧子元素添加显示、隐藏动画。
            //当AnimatedSwitcher的child发生变化时（类型或Key不同），旧child会执行隐藏动画，新child会执行执行显示动画。
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              //transitionBuilder参数决定执行何种动画效果
              transitionBuilder: (Widget child, Animation<double> animation) {
                //执行缩放动画
                return ScaleTransition(child: child, scale: animation);
              },
              child: Text(
                '$_count',
                //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            RaisedButton(
              child: const Text(
                '+1',
              ),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
            ),

            //Flutter SDK中还提供了一个AnimatedCrossFade组件，它也可以切换两个子元素，
            //切换过程执行渐隐渐显的动画，和AnimatedSwitcher不同的是AnimatedCrossFade是针对两个子元素，
            //而AnimatedSwitcher是在一个子元素的新旧值之间切换。

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              //transitionBuilder参数决定执行何种动画效果
              transitionBuilder: (Widget child, Animation<double> animation) {
                //执行平移动画
                //新child确实从屏幕右侧平移进入了，旧child会从屏幕右侧（而不是左侧）退出。
                //AnimatedSwitcher的child切换时会分别对新child执行正向动画（forward），而对旧child执行反向动画（reverse）。
                var tween =
                    Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
                return SlideTransition(
                  child: child,
                  position: tween.animate(animation),
                );
              },
              child: Text(
                '$_count1',
                //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_count1),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            RaisedButton(
              child: const Text(
                '+1',
              ),
              onPressed: () {
                setState(() {
                  _count1 += 1;
                });
              },
            ),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              //transitionBuilder参数决定执行何种动画效果
              transitionBuilder: (Widget child, Animation<double> animation) {
                //执行自定义的平移动画
                //新child确实从屏幕右侧平移进入了，旧child会从屏幕左侧退出。
                var tween =
                    Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
                return MySlideTransition(
                  child: child,
                  position: tween.animate(animation),
                );
              },
              child: Text(
                '$_count2',
                //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_count2),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            RaisedButton(
              child: const Text(
                '+1',
              ),
              onPressed: () {
                setState(() {
                  _count2 += 1;
                });
              },
            ),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              //transitionBuilder参数决定执行何种动画效果
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransitionX(
                  child: child,
                  position: animation,
                );
              },
              child: Text(
                '$_count3',
                //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_count3),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            RaisedButton(
              child: const Text(
                '+1',
              ),
              onPressed: () {
                setState(() {
                  _count3 += 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MySlideTransition extends AnimatedWidget {
  MySlideTransition({
    Key key,
    @required Animation<Offset> position,
    this.transformHitTests = true,
    this.child,
  })  : assert(position != null),
        super(key: key, listenable: position);

  Animation<Offset> get position => listenable;
  final bool transformHitTests;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    //动画反向执行时，调整x偏移，实现“从左边滑出隐藏”
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}

//实现左出右入、右入左出、上入下出、下入上出动画效果
@immutable
class SlideTransitionX extends AnimatedWidget {
  SlideTransitionX({
    Key key,
    @required Animation<double> position,
    this.transformHitTests = true,
    this.direction = AxisDirection.down,
    this.child,
  })  : assert(position != null),
        super(key: key, listenable: position) {
    // 偏移在内部处理
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
        break;
    }
  }

  Animation<double> get position => listenable;

  final bool transformHitTests;

  final Widget child;

  //退场（出）方向
  final AxisDirection direction;

  Tween<Offset> _tween;

  @override
  Widget build(BuildContext context) {
    Offset offset = _tween.evaluate(position);
    if (position.status == AnimationStatus.reverse) {
      switch (direction) {
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
