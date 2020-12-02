import 'package:flutter/material.dart';
import 'align_layout.dart';
import 'stack_positioned_layout.dart';
import 'flow_layout.dart';
import 'wrap_layout.dart';
import 'column_layout.dart';
import 'expanded_layout.dart';
import 'flex_layout.dart';
import 'row_layout.dart';

class LayoutManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局组件"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ColumnLayout();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Column"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return RowLayout();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Row"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return FlexLayout();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Flex"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ExpandedLayout();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Expanded"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return WrapLayout();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Wrap"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return FlowLayout();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Flow"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return StackPositionedLayout();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Stack与Positioned组合"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return AlignLayout();
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Align"),
            ),
          ],
        ),
      ),
    );
  }
}
