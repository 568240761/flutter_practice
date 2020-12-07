import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  const ShareDataWidget({@required this.data, child: Widget})
      : super(child: child);

  final int data;

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    //在将自己注册到依赖管理中的情况下，如果返回true，则子树中依赖(build函数中有调用)本widget的子widget的`state.didChangeDependencies`会被调用。
    return oldWidget.data != data;
  }

  static ShareDataWidget of(BuildContext context, {bool listen = false}) {
    if (listen) {
      //将子widget注册到依赖管理中，当自己改变时，通知子widget更新，也就是子widget的`state.didChangeDependencies`会被调用。
      return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
    } else {
      //方便子Widget查找自己，并不将子widget注册到依赖管理中，也就说当自己改变时，不会通知子widget更新
      return context
          .getElementForInheritedWidgetOfExactType<ShareDataWidget>()
          .widget;
    }
  }
}

class TestWidget extends StatefulWidget {
  @override
  State createState() {
    return TestWidgetState();
  }
}

class TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Text("${ShareDataWidget.of(context).data}");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("Dependencies change");
  }

  @override
  void didUpdateWidget(TestWidget oldWidget) {
    if (widget != oldWidget) {
      debugPrint("widget改变了");
    } else {
      debugPrint("widget没有变化");
    }
    super.didUpdateWidget(oldWidget);
  }
}

class InheritedWidgetFunction extends StatefulWidget {
  @override
  State createState() {
    return InheritedWidgetFunctionState();
  }
}

class InheritedWidgetFunctionState extends State<InheritedWidgetFunction> {
  int _data = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("数据共享"),
      ),
      body: Center(
        child: ShareDataWidget(
          data: _data,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TestWidget(),
              FlatButton(
                onPressed: () {
                  setState(() {
                    _data++;
                  });
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("增加"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
