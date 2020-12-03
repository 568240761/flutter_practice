import 'package:flutter/material.dart';

class SizeLimit1Container extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("尺寸限制类(上)"),
      ),
      body: Center(
        child: Column(
          children: [
            //ConstrainedBox用于对子组件添加额外的约束。
            ConstrainedBox(
              //BoxConstraints用于设置限制条件。
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: 50.0,
              ),
              child: Container(
                color: Colors.red,
                height: 10.0,
              ),
            ),

            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: 50.0,
              ),
              child: Container(
                color: Colors.greenAccent,
                height: 100.0,
              ),
            ),
            //SizedBox用于给子元素指定固定的宽高,实际上SizedBox只是ConstrainedBox的一个定制。
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blueGrey),
              ),
            ),
            //实际上ConstrainedBox和SizedBox都是通过RenderConstrainedBox来渲染的，
            //我们可以看到ConstrainedBox和SizedBox的createRenderObject()方法都返回的是一个RenderConstrainedBox对象。
            ConstrainedBox(
              //等价于BoxConstraints(minHeight: 80.0,maxHeight: 80.0,minWidth: 80.0,maxWidth: 80.0)
              constraints: BoxConstraints.tightFor(width: 80.0, height: 80.0),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.orange),
              ),
            ),
            //多重限制，对于minWidth和minHeight来说，是取父子中相应数值较大的，只有这样才能保证父限制与子限制不冲突。
            ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
                //父
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                  //子
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.brown),
                  ),
                )),

            //多重限制，对于maxWidth和maxHeight来说，以父容器的为准。
            ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 60.0, height: 60.0),
                //父
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: 90.0, height: 20.0), //子
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.green),
                  ),
                )),
            ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 90.0, height: 20.0),
                //父
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: 60.0, height: 60.0), //子
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class SizeLimit2Container extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("尺寸限制类(下)"),
        actions: <Widget>[
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          ),
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),
              //父
              //UnconstrainedBox不会对子组件产生任何限制，它允许其子组件按照其本身大小绘制。
              //去除父容器的限制
              //但是，UnconstrainedBox对父组件限制的“去除”并非是真正的去除。
              //红色区域大小是90×20，但上方仍然有80的空白空间。
              //也就是说父限制的minHeight(100.0)仍然是生效的，只不过它不影响最终子元素的大小，但仍然还是占有相应的空间，
              //可以认为此时的父ConstrainedBox是作用于子UnconstrainedBox上。
              //
              //现在没有什么方法可以彻底去除父ConstrainedBox的限制。
              //所以在定义一个通用的组件时，如果要对子组件指定限制，
              //那么一定要注意，因为一旦指定限制条件，子组件如果要进行相关自定义大小时将可能非常困难，
              //因为子组件在不更改父组件的代码的情况下无法彻底去除其限制条件。
              child: UnconstrainedBox(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                  ),
                ),
              ),
            ),
            //AspectRatio可以指定子组件的长宽比
            AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: Container(
                color: Colors.grey,
              ),
            ),
            //LimitedBox 用于指定最大宽高
            LimitedBox(
              maxHeight: 50,
              maxWidth: 200,
              child: Container(
                color: Colors.orange,
              ),
            ),

            SizedBox(
              width: 100.0,
              height: 50.0,
              //FractionallySizedBox 可以根据父容器宽高的百分比来设置子组件宽高
              child: FractionallySizedBox(
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              width: 100.0,
              height: 50.0,
              child: FractionallySizedBox(
                widthFactor: 0.5,
                heightFactor: 0.5,
                child: Container(
                  color: Colors.blue[100],
                ),
              ),
            ),
            SizedBox(
              width: 100.0,
              height: 50.0,
              child: FractionallySizedBox(
                widthFactor: 2,
                heightFactor: 1.8,
                child: Container(
                  color: Colors.blue[900],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
