import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureEvent extends StatefulWidget {
  @override
  State createState() {
    return GestureEventState();
  }
}

class GestureEventState extends State<GestureEvent> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势识别(点击、双击、长按)"),
      ),
      //GestureDetector是一个用于手势识别的功能性组件，我们通过它可以来识别各种手势。
      //GestureDetector实际上是指针事件的语义化封装。
      body: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.cyan,
          ),
          child: Text(_msg),
        ),
        onDoubleTap: () {
          setState(() {
            _msg = "双击";
          });
        },
        //当同时监听onTap和onDoubleTap事件时，当用户触发tap事件时，会有200毫秒左右的延时，
        //这是因为当用户点击完之后很可能会再次点击以触发双击事件，所以GestureDetector会等一段时间来确定是否为双击事件。
        //如果用户只监听了onTap（没有监听onDoubleTap）事件时，则没有延时。
        onTap: () {
          setState(() {
            _msg = "点击";
          });
        },
        onLongPress: () {
          setState(() {
            _msg = "长按";
          });
        },
      ),
    );
  }
}

class GestureEvent1 extends StatefulWidget {
  @override
  State createState() {
    return GestureEventState1();
  }
}

class GestureEventState1 extends State<GestureEvent1> {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("手势识别(拖动)"),
        ),
        body: Stack(
          children: [
            Positioned(
              top: _top,
              left: _left,
              //一次完整的手势过程是指用户手指按下到抬起的整个过程，期间，用户按下手指后可能会移动，也可能不会移动。
              //GestureDetector对于拖动和滑动事件是没有区分的，他们本质上是一样的。
              //GestureDetector会将要监听的组件的原点（左上角）作为本次手势的原点，当用户在监听的组件上按下手指时，手势识别就会开始。
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text("A"),
                ),
                //手指按下时会触发此回调
                onPanDown: (DragDownDetails details) {
                  //打印手指按下的位置(相对于屏幕)
                  print("用户手指按下：${details.globalPosition}");
                  //DragDownDetails.globalPosition：当用户按下时，此属性为用户按下的位置相对于屏幕（而非父组件）原点(左上角)的偏移。
                },
                //手指滑动时会触发此回调
                onPanUpdate: (DragUpdateDetails details) {
                  //用户手指滑动时，更新偏移，重新构建
                  setState(() {
                    _left += details.delta.dx;
                    _top += details.delta.dy;
                  });
                  //DragUpdateDetails.delta：当用户在屏幕上滑动时，会触发多次Update事件，delta指一次Update事件的滑动的偏移量。
                },
                //手指滑动结束会触发此回调
                onPanEnd: (DragEndDetails details) {
                  //打印滑动结束时在x、y轴上的速度
                  print(details.velocity);
                  //DragEndDetails.velocity：该属性代表用户抬起手指时的滑动速度(包含x、y两个轴的），
                  //在这并没有处理手指抬起时的速度，常见的效果是根据用户抬起手指时的速度做一个减速动画。
                },
              ),
            ),
          ],
        ));
  }
}

class GestureEvent2 extends StatefulWidget {
  @override
  State createState() {
    return GestureEventState2();
  }
}

class GestureEventState2 extends State<GestureEvent2> {
  double _top = 0.0; //距顶部的偏移
  double _left = 10.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("手势识别(单一方向拖动)"),
        ),
        body: Stack(
          children: [
            Positioned(
              top: _top,
              left: _left,
              //GestureDetector也可以只识别特定方向的手势事件
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text("A"),
                ),
                //垂直方向拖动事件
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _top += details.delta.dy;
                  });
                },
              ),
            ),
          ],
        ));
  }
}

class GestureEvent3 extends StatefulWidget {
  @override
  State createState() {
    return GestureEventState3();
  }
}

class GestureEventState3 extends State<GestureEvent3> {
  double _width = 100.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势识别(缩放)"),
      ),
      body: Center(
        //GestureDetector也可以监听缩放事件
        child: GestureDetector(
          child: Image.asset(
            "images/assets.jpeg",
            width: _width,
          ),
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              //缩放倍数在0.8到10倍之间
              _width = 100 * details.scale.clamp(0.5, 10.0);
            });
          },
        ),
      ),
    );
  }
}

class GestureEvent4 extends StatefulWidget {
  @override
  State createState() {
    return GestureEventState4();
  }
}

class GestureEventState4 extends State<GestureEvent4> {
  //GestureDetector内部是使用一个或多个GestureRecognizer来识别各种手势的，
  //而GestureRecognizer的作用就是通过Listener来将原始指针事件转换为语义手势，GestureDetector直接可以接收一个子widget。
  //GestureRecognizer是一个抽象类，一种手势的识别器对应一个GestureRecognizer的子类，Flutter实现了丰富的手势识别器，我们可以直接使用。

  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GestureRecognizer"),
      ),
      body: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "你好世界"),
              TextSpan(
                text: "点我变色",
                style: TextStyle(
                  fontSize: 30.0,
                  color: _toggle ? Colors.blue : Colors.red,
                ),
                recognizer: _tapGestureRecognizer
                  ..onTap = () {
                    setState(() {
                      _toggle = !_toggle;
                    });
                  },
              ),
              TextSpan(text: "你好世界"),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }
}

class GestureEvent5 extends StatefulWidget {
  @override
  State createState() {
    return GestureEventState5();
  }
}

class GestureEventState5 extends State<GestureEvent5> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势竞争"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            //在Flutter中的手势识别引入了一个Arena的概念，Arena直译为“竞技场”的意思，
            //每一个手势识别器（GestureRecognizer）都是一个“竞争者”（GestureArenaMember），
            //当发生滑动事件时，他们都要在“竞技场”去竞争本次事件的处理权，而最终只有一个“竞争者”会胜出(win)。
            //例如，假设有一个ListView，它的第一个子组件也是ListView，如果现在滑动这个子ListView，父ListView会动吗？
            //答案是否定的，这时只有子ListView会动，因为这时子ListView会胜出而获得滑动事件的处理权。
            child: GestureDetector(
              child: CircleAvatar(child: Text("A")),

              //竞争发生在手指按下后首次移动（move）时，
              //具体的“获胜”条件是：首次移动时的位移在水平和垂直方向上的分量大的一个获胜。

              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                });
              },
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _left += details.delta.dx;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

class GestureEvent6 extends StatefulWidget {
  @override
  State createState() {
    return GestureEventState6();
  }
}

class GestureEventState6 extends State<GestureEvent6> {
  double _left = 0.0;
  double _left1 = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势冲突"),
      ),
      body: Stack(
        children: <Widget>[
          //在拖到的时候，并没有打印 “up”。这是因为拖动时，拖动手势会胜出；
          //当手指抬起时，onHorizontalDragEnd 和 onTapUp发生了冲突。
          //但是因为是在拖动的语义中，所以onHorizontalDragEnd胜出，所以就会打印 “onHorizontalDragEnd”。
          Positioned(
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              //要拖动和点击的widget
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _left += details.delta.dx;
                });
              },
              onHorizontalDragEnd: (details) {
                print("A onHorizontalDragEnd");
              },
              onTapDown: (details) {
                print("A down");
              },
              onTapUp: (details) {
                print("A up");
              },
            ),
          ),

          //如果我们的代码逻辑中，对于手指按下和抬起是强依赖的。
          //比如在一个轮播图组件中，我们希望手指按下时，暂停轮播，而抬起时恢复轮播，
          //但是由于轮播图组件中本身可能已经处理了拖动手势（支持手动滑动切换），甚至可能也支持了缩放手势，
          //这时我们如果再用onTapDown、onTapUp来监听的话是不行的。这时我们应该怎么做？可以通过Listener监听原始指针事件就行。

          //手势冲突只是手势级别的，而手势是对原始指针的语义化的识别，所以在遇到复杂的冲突场景时，都可以通过Listener直接识别原始指针事件来解决冲突。
          Positioned(
            top: 80.0,
            left: _left1,
            child: Listener(
              onPointerDown: (details) {
                print("B down");
              },
              onPointerUp: (details) {
                //会触发
                print("B up");
              },
              child: GestureDetector(
                child: CircleAvatar(child: Text("B")),
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _left1 += details.delta.dx;
                  });
                },
                onHorizontalDragEnd: (details) {
                  print("B onHorizontalDragEnd");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
