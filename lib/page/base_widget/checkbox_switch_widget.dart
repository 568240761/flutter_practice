import 'package:flutter/material.dart';

class CheckBoxSwitchWidget extends StatefulWidget {
  @override
  State createState() {
    return CheckBoxSwitchWidgetState();
  }
}

class CheckBoxSwitchWidgetState extends State<CheckBoxSwitchWidget> {
  bool _checkbox1 = false;
  bool _checkbox2 = true;

  bool _switch1 = false;
  bool _switch2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单选开关和复选框"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: _checkbox1,
              onChanged: (value) {
                setState(() {
                  _checkbox1 = value;
                });
              },
            ),
            Checkbox(
              value: _checkbox2,
              onChanged: (value) {
                setState(() {
                  _checkbox2 = value;
                });
              },
            ),
            Switch(
              value: _switch1,
              onChanged: (value) {
                setState(() {
                  _switch1 = value;
                });
              },
            ),
            Switch(
              value: _switch2,
              onChanged: (value) {
                setState(() {
                  _switch2 = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
