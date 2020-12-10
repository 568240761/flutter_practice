import 'package:flutter/material.dart';

class HandleEvent1 extends StatefulWidget {
  @override
  State createState() {
    return HandleEventState();
  }
}

//当指针按下时，Flutter会对应用程序执行命中测试，以确定指针与屏幕接触的位置存在哪些组件（widget），
//指针按下事件（以及该指针的后续事件）然后被分发到由命中测试发现的最内部的组件，然后从那里开始，事件会在组件树中向上冒泡，
//这些事件会从最内部的组件被分发到组件树根的路径上的所有组件，这和Web开发中浏览器的事件冒泡机制相似，
//但是Flutter中没有机制取消或停止“冒泡”过程，而浏览器的冒泡是可以停止的。注意，只有通过命中测试的组件才能触发事件。
class HandleEventState extends State<HandleEvent1> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("事件处理_1"),
      ),
      //使用Listener来监听原始触摸事件
      body: Listener(
        child: Container(
          alignment: Alignment.center,
          color: Colors.cyan,
          width: 300,
          height: 200,
          child: Text(_event?.toString() ?? ""),
        ),
        onPointerDown: (PointerDownEvent event) {
          setState(() => _event = event);
          //TODO(打印日志有时会丢失)
          debugPrint("down");
        },
        onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
        onPointerMove: (PointerMoveEvent event) =>
            setState(() => _event = event),
        //这个属性指出在命中测试期间如何表现。
        //deferToChild：子组件会一个接一个的进行命中测试，如果子组件中有测试通过的，则当前组件通过，
        //这就意味着，如果指针事件作用于子组件上时，其父级组件也肯定可以收到该事件。
        behavior: HitTestBehavior.deferToChild,
      ),
    );
  }
}

class HandleEvent2 extends StatefulWidget {
  @override
  State createState() {
    return HandleEvent2State();
  }
}

class HandleEvent2State extends State<HandleEvent2> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("事件处理_2"),
      ),
      body: Listener(
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(Size(300.0, 400.0)),
          child: Center(child: Text("Box A,${_event?.toString() ?? ""}")),
        ),
        //opaque：在命中测试时，将当前组件当成不透明处理(即使本身是透明的)，最终的效果相当于当前Widget的整个区域都是点击区域。
        behavior: HitTestBehavior.opaque,
        onPointerDown: (event) {
          setState(() {
            _event = event;
          });
          //TODO(打印日志有时会丢失)
          print("down A");
        },
      ),
    );
  }
}

class HandleEvent3 extends StatefulWidget {
  @override
  State createState() {
    return HandleEvent3State();
  }
}

class HandleEvent3State extends State<HandleEvent3> {
  PointerEvent _event;
  PointerEvent _event1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("事件处理_3"),
      ),
      body: Stack(
        children: <Widget>[
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300.0, 400.0)),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(_event?.toString() ?? ""),
              ),
            ),
            onPointerDown: (event) {
              setState(() {
                _event = event;
              });
              print("down0");
            },
          ),
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(200.0, 400.0)),
              child: Center(
                  child: Text(
                      "左上角200*100范围内非文本区域点击:${_event1?.toString() ?? ""}")),
            ),
            onPointerDown: (event) {
              setState(() {
                _event1 = event;
              });
              print("down1");
            },
            //translucent：当点击组件透明区域时，可以对自身边界内及底部可视区域都进行命中测试，
            //这意味着点击顶部组件透明区域时，顶部组件和底部组件都可以接收到事件。
            behavior: HitTestBehavior.translucent,
          )
        ],
      ),
    );
  }
}

class HandleEvent4 extends StatefulWidget {
  @override
  State createState() {
    return HandleEvent4State();
  }
}

class HandleEvent4State extends State<HandleEvent4> {
  PointerEvent _event;
  PointerEvent _event1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("忽略事件"),
      ),
      body: Listener(
        //可以使用IgnorePointer和AbsorbPointer，这两个组件都能阻止子树接收指针事件，
        //不同之处在于AbsorbPointer本身会参与命中测试，而IgnorePointer本身不会参与，
        //这就意味着AbsorbPointer本身是可以接收指针事件的(但其子树不行)，而IgnorePointer不可以。
        child: AbsorbPointer(
          child: Listener(
            child: Container(
              color: Colors.red,
              width: 200.0,
              height: 100.0,
              child: Column(
                children: [
                  Text("1：${_event?.toString() ?? ""}"),
                  Text("2：${_event1?.toString() ?? ""}")
                ],
              ),
            ),
            onPointerDown: (event) {
              setState(() {
                _event = event;
              });
              print("in");
            },
          ),
        ),
        onPointerDown: (event) {
          setState(() {
            _event1 = event;
          });
          //TODO(打印日志有时会丢失)
          print("up");
        },
      ),
    );
  }
}
