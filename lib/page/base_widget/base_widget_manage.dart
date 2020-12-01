import 'package:flutter/material.dart';

class BaseWidgetManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基础控件"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "base_widget_text");
              },
              child: Text("文本"),
              textColor: Colors.white,
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "base_widget_button");
              },
              child: Text("按钮"),
              textColor: Colors.white,
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "/base_widget/image_widget");
              },
              child: Text("图片及ICON"),
              textColor: Colors.white,
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "/base_widget/check_switch_widget");
              },
              child: Text("单选开关和复选框"),
              textColor: Colors.white,
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "/base-widget/textfield_widget");
              },
              child: Text("输入框"),
              textColor: Colors.white,
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "/base-widget/form_widget");
              },
              child: Text("表单"),
              textColor: Colors.white,
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, "/base_widget/progress_indicator_widget");
              },
              child: Text("进度指示器"),
              textColor: Colors.white,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
