import 'package:flutter/material.dart';

class StateLifecycle extends StatefulWidget {
  StateLifecycle({Key key}) : super(key: key);

  @override
  State createState() {
    return StateLifecycleState();
  }
}

class StateLifecycleState extends State<StateLifecycle> {
  var _counter = 0;

  //只会调用一次该回调
  @override
  void initState() {
    super.initState();
    debugPrint("initState");
  }

  //当State对象的依赖发生变化时会被调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("State生命周期"),
      ),
      body: Center(
        child: Text(
          "$_counter",
          style: TextStyle(fontSize: 29),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  //此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
  @override
  void reassemble() {
    super.reassemble();
    debugPrint("reassemble");
  }

  //在widget重新构建时，Flutter framework会调用Widget.canUpdate来检测Widget树中同一位置的新旧节点，然后决定是否需要更新。
  //如果Widget.canUpdate返回true则会调用此回调。
  //Widget.canUpdate会在新旧widget的key和runtimeType同时相等时会返回true，也就是说在在新旧widget的key和runtimeType同时相等时didUpdateWidget()就会被调用。
  @override
  void didUpdateWidget(StateLifecycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("didUpdateWidget");
  }

  //当State对象从树中被移除时，会调用此回调。
  //在一些场景下，Flutter framework会将State对象重新插到树中，如包含此State对象的子树在树的一个位置移动到另一个位置时（可以通过GlobalKey来实现）。
  //如果移除后没有重新插入到树中则紧接着会调用dispose()方法。
  @override
  void deactivate() {
    super.deactivate();
    debugPrint("deactivate");
  }

  //当State对象从树中被永久移除时调用；通常在此回调中释放资源。
  @override
  void dispose() {
    super.dispose();
    debugPrint("dispose");
  }
}
