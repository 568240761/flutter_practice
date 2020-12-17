import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  @override
  State createState() {
    return FormWidgetState();
  }
}

class FormWidgetState extends State<FormWidget> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("表单"),
      ),
      body: Form(
        key: _globalKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: _userController,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                icon: Icon(Icons.person),
              ),
              validator: (value) {
                debugPrint("输入的用户名是$value");
                return value.trim().length > 0 ? null : "用户名不能为空";
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
              validator: (value) {
                debugPrint("输入的密码是$value");
                return value.trim().length > 5 ? null : "密码不能少于6位";
              },
            ),
            RaisedButton(
              onPressed: () {
                //在这里不能通过此方式获取FormState
                //这是因为当前context与FormWidget想映射的
                //在Widget树中，从FormWidget往上并没有Form
                //获取到的state为null
                var state = Form.of(context);
                if (state != null && state.validate()) {
                  debugPrint("state验证通过了");
                  printResult(context);
                } else if ((_globalKey.currentState as FormState).validate()) {
                  debugPrint("验证通过了");
                  printResult(context);
                }
              },
              child: Text("登录-方式1"),
              textColor: Colors.white,
              color: Colors.blue,
            ),
            Builder(builder: (context) {
              return RaisedButton(
                onPressed: () {
                  //在这里可以通过此方式获取FormState
                  var state = Form.of(context);
                  if (state != null && state.validate()) {
                    debugPrint("state验证通过了");
                    printResult(context);
                  } else if ((_globalKey.currentState as FormState)
                      .validate()) {
                    debugPrint("验证通过了");
                    printResult(context);
                  }
                },
                child: Text("登录-方式2"),
                textColor: Colors.white,
                color: Colors.blue,
              );
            }),
          ],
        ),
        onWillPop: () async {
          var flag = false;
          if (_userController.text.length > 0 &&
              _passwordController.text.length > 0) {
            flag = true;
          }
          debugPrint("当点击返回时，判断是否能返回[flag = $flag]");
          return flag;
        },
        onChanged: () {
          debugPrint("有数据变化");
        },
      ),
    );
  }

  void printResult(BuildContext context) {
    debugPrint("最终输入的用户名是${_userController.text}");
    debugPrint("最终输入的密码是${_passwordController.text}");

    Navigator.pop(context);
  }
}
