import 'package:flutter/material.dart';

class FlowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flow"),
      ),
      //很少会使用Flow，因为其过于复杂，需要自己实现子widget的位置转换。
      //Flow主要用于一些需要自定义布局策略或性能要求较高(如动画中)的场景。
      //
      //优点：
      // 性能好；Flow是一个对子组件尺寸以及位置调整非常高效的控件，Flow用转换矩阵在对子组件进行位置调整的时候进行了优化。在Flow定位过后，如果子组件的尺寸或者位置发生了变化，在FlowDelegate中的paintChildren()方法中调用context.paintChild 进行重绘，而context.paintChild在重绘时使用了转换矩阵，并没有实际调整组件位置。
      // 灵活；由于我们需要自己实现FlowDelegate的paintChildren()方法，所以我们需要自己计算每一个组件的位置，因此，可以自定义布局策略。
      //
      // 缺点：
      // 使用复杂。
      // 不能自适应子组件大小，必须通过指定父容器大小或实现FlowDelegate的getSize返回固定大小。
      body: Flow(
        delegate: FlowPracticeDelegate(margin: EdgeInsets.all(10.0)),
        children: <Widget>[
          new Container(
            width: 80.0,
            height: 80.0,
            color: Colors.red,
          ),
          new Container(
            width: 80.0,
            height: 80.0,
            color: Colors.green,
          ),
          new Container(
            width: 80.0,
            height: 80.0,
            color: Colors.blue,
          ),
          new Container(
            width: 80.0,
            height: 80.0,
            color: Colors.yellow,
          ),
          new Container(
            width: 80.0,
            height: 80.0,
            color: Colors.brown,
          ),
          new Container(
            width: 80.0,
            height: 80.0,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}

class FlowPracticeDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  FlowPracticeDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
