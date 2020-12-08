import 'package:flutter/material.dart';

class StreamBuilderFunction extends StatefulWidget {
  @override
  State createState() {
    return StreamBuilderFunctionState();
  }
}

class StreamBuilderFunctionState extends State<StreamBuilderFunction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("异步UI更新-StreamBuilder"),
      ),
      body: Center(
        //和FutureBuilder的构造函数只有一点不同：前者需要一个future，而后者需要一个stream。
        child: StreamBuilder<int>(
          stream: counter(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('没有stream');
              case ConnectionState.waiting:
                return Text('等待数据...');
              case ConnectionState.active:
                return Text('active: ${snapshot.data}');
              case ConnectionState.done:
                return Text('stream已关闭');
            }
            return null; // unreachable
          },
        ),
      ),
    );
  }

  Stream<int> counter() {
    //创建一个以[period]间隔重复发射事件的流。
    return Stream.periodic(
      Duration(seconds: 1),
      (i) {
        return i;
      },
    );
  }
}
