import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {

  void click(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: click,
              child: Text("带有阴影和灰色背景；按下后，阴影会变大"),
            ),
            FlatButton(
              onPressed: click,
              child: Text("扁平按钮，默认背景透明并不带阴影；按下后，会有背景色"),
            ),
            OutlineButton(
              onPressed: click,
              child: Text("有一个边框，不带阴影且背景透明；按下后，边框颜色会变亮、同时出现背景和阴影(较弱)"),
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: click,
            ),
            RaisedButton.icon(
              icon: Icon(Icons.send),
              label: Text("发送"),
              onPressed: click,
            ),
            OutlineButton.icon(
              icon: Icon(Icons.add),
              label: Text("添加"),
              onPressed: click,
            ),
            FlatButton.icon(
              icon: Icon(Icons.info),
              label: Text("详情"),
              onPressed: click,
            ),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("发送"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              onPressed: click,
            ),
            RaisedButton(
              elevation: 2.0,
              highlightElevation: 8.0,
              disabledElevation: 0.0,
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("发送"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              onPressed: click,
            ),
          ],
        ),
      ),
    );
  }
}
