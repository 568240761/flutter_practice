import 'package:flutter/material.dart';

class NameRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments),
      ),
    );
  }
}
