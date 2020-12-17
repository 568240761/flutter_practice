import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();

  TextWidget({Key key}) : super(key: key) {
    _tapGestureRecognizer.onTapDown = (TapDownDetails details) {
      //TODO(打印日志有时会丢失)
      debugPrint("点击了链接(https://flutterchina.club)");
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文本"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello Flutter!",
              //文本宽度太小，不能体现左对齐
              textAlign: TextAlign.start,
            ),
            Text(
              "Hello Flutter! Hello Android!" * 4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Hello Flutter!",
              textScaleFactor: 2,
            ),
            Text(
              "Hello Flutter!" * 10,
              textAlign: TextAlign.center,
            ),
            Text(
              "Hello Flutter!",
              style: TextStyle(
                color: Colors.amber,
                fontFamily: "NerkoOne",
                background: Paint()..color = Colors.red,
                fontSize: 30,
                height: 1.5,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),
            Text.rich(
              TextSpan(
                text: "Home:",
                children: [
                  TextSpan(
                    text: "https://flutterchina.club",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                    recognizer: _tapGestureRecognizer,
                  ),
                ],
              ),
            ),
            DefaultTextStyle(
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Hello Flutter!"),
                  Text("I am Yang"),
                  Text(
                    "I am Yang",
                    style: TextStyle(
                      inherit: false, //不继承默认样式
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
