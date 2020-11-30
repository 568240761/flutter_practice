import 'package:flutter/material.dart';

class AutoThrowException extends StatelessWidget{

  AutoThrowException({Key key}):super(key: key){
    throw FormatException("自动抛出异常");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自动抛出异常"),
      ),
    );
  }
}