import 'package:flutter/material.dart';

class FutureThrowException extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("异步代码中抛出异常"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            var result = caluecate();
            result.then((value) => debugPrint("计算的结果：$value"));
          },
          child: Text("点击执行异步计算"),
          textColor: Colors.white,
          color: Colors.blue,
        ),
      ),
    );
  }

  Future<double> caluecate() async {
    throw FormatException("异步代码中抛出异常");
    return 80 / 0;
  }
}
