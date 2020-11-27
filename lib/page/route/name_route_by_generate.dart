import 'package:flutter/material.dart';

class NameRouteByGenerate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("命名路由"),
      ),
      body: Center(
        child: Text(arguments),
      ),
    );
  }
}
