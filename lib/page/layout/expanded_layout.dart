import 'package:flutter/material.dart';

class ExpandedLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded"),
      ),
      body: Container(
        color: Colors.green,
        child: Column(
          children: [
            Text("hello flutter"),
            //按比例“扩伸” Row、Column和Flex子组件所占用的空间。
            Expanded(
              //flex参数为弹性系数，如果为0或null，则child是没有弹性的，即不会被扩伸占用的空间。
              //如果大于0，所有的Expanded按照其flex的比例来分割主轴的全部空闲空间。
              flex: 1,
              child: Container(
                color: Colors.red,
                child: Column(
                  children: [
                    Text("I am yang"),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    Text("I am juan"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
