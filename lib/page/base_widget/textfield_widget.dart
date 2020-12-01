import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  @override
  State createState() {
    return TextFieldWidgetState();
  }
}

class TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController _selectionController = TextEditingController();

  TextEditingController _controller = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();

  FocusScopeNode _focusScopeNode;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      debugPrint("用户名是${_controller.text}");
    });
    _selectionController.text = "Hello Flutter";
    _selectionController.selection =
        TextSelection(baseOffset: 3, extentOffset: 12);

    _focusNode1.addListener(() {
      debugPrint("用户名输入框的焦点变化：${_focusNode1.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("输入框"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _selectionController,
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "用户名",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
                helperText: "用户名通常是手机号",
                helperStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                hintText: "请输入用户名",
                hintStyle: TextStyle(
                  color: Colors.black26,
                  fontSize: 18,
                ),
              ),
              autofocus: true,
              focusNode: _focusNode1,
              maxLines: null,
              keyboardType: TextInputType.text,
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: "密码",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
                helperText: "密码至少大于10位",
                helperStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                hintText: "请输入密码",
                hintStyle: TextStyle(
                  color: Colors.black26,
                  fontSize: 18,
                ),
              ),
              maxLength: 20,
              maxLengthEnforced: false,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              focusNode: _focusNode2,
              onChanged: (value) {
                debugPrint("密码是$value");
              },
            ),
            Builder(builder: (context) {
              return Row(
                children: [
                  RaisedButton(
                    onPressed: () {
                      if (_focusScopeNode == null) {
                        _focusScopeNode = FocusScope.of(context);
                      }

                      _focusScopeNode.requestFocus(_focusNode2);
                    },
                    child: Text("从第二个输入框移动焦点到第三个输入框"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _focusNode2.unfocus();
                      _focusNode1.unfocus();
                    },
                    child: Text("隐藏键盘"),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
