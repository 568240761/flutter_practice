import 'package:flutter/material.dart';

class ScrollNotificationSimple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("监听滚动"),
      ),
      //通知（Notification）是Flutter中一个重要的机制，在widget树中，每一个节点都可以分发通知，
      //通知会沿着当前节点向上传递，所有父节点都可以通过NotificationListener来监听通知。
      //Flutter中将这种由子向父的传递通知的机制称为通知冒泡（Notification Bubbling）。
      //通知冒泡和用户触摸事件冒泡是相似的，但有一点不同：通知冒泡可以中止，但用户触摸事件不行。

      //Flutter的UI框架实现中，除了在可滚动组件在滚动过程中会发出ScrollNotification之外，
      //还有一些其它的通知，如SizeChangedLayoutNotification、KeepAliveNotification 、LayoutChangedNotification等，
      //Flutter正是通过这种通知机制来使父元素可以在一些特定时机来做一些事情。

      //通过NotificationListener来监听可以滚动组件的滚动通知
      //ScrollStartNotification、ScrollUpdateNotification等都是继承自ScrollNotification类，
      //不同类型的通知子类会包含不同的信息，比如ScrollUpdateNotification有一个scrollDelta属性，它记录了移动的位移。
      body: NotificationListener(
        onNotification: (notification) {
          switch (notification.runtimeType) {
            case ScrollStartNotification:
              print("开始滚动");
              break;
            case ScrollUpdateNotification:
              print("正在滚动");
              break;
            case ScrollEndNotification:
              print("滚动停止");
              break;
            case OverscrollNotification:
              print("滚动到边界");
              break;
          }
          //当返回值为true时，阻止冒泡，其父级Widget将再也收不到该通知；当返回值为false 时继续向上冒泡通知。
          return false;
        },
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("$index"),
              );
            }),
      ),
    );
  }
}

//定义一个通知类，要继承自Notification类
class MyNotification extends Notification {
  MyNotification(this.msg);

  final String msg;
}

class NotificationRoute extends StatefulWidget {
  @override
  NotificationRouteState createState() {
    return new NotificationRouteState();
  }
}

class NotificationRouteState extends State<NotificationRoute> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    //监听通知
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义通知"),
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + "  ";
          });
          return true;
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Builder(
                builder: (context) {
                  return RaisedButton(
                    //dispatch(context)方法，用于分发通知的。
                    //context实际上就是操作Element的一个接口，它与Element树上的节点是对应的，
                    //通知会从context对应的Element节点向上冒泡。
                    onPressed: () => MyNotification("Hi").dispatch(context),
                    child: Text("点击了可以发送通知消息，Text可以收到消息"),
                  );
                },
              ),
              RaisedButton(
                // dispatch()方法是不能正常工作的，因为这个context是根Context，
                // 而NotificationListener是监听的子树，
                // 所以我们通过Builder来构建RaisedButton，来获得按钮位置的context。
                onPressed: () => MyNotification("Hello").dispatch(context),
                child: Text("点击了可以发送通知消息，Text收不到消息"),
              ),
              Text(_msg)
            ],
          ),
        ),
      ),
    );
  }
}
