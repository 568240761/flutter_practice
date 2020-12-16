import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class SocketRequest extends StatefulWidget {
  @override
  State createState() {
    return SocketRequestState();
  }
}

class SocketRequestState extends State<SocketRequest> {
  String _response = "";

  _request() async {
    //建立连接
    var socket = await Socket.connect("baidu.com", 80);
    //根据http协议，发送请求头
    socket.writeln("GET / HTTP/1.1");
    socket.writeln("Host:baidu.com");
    socket.writeln("Connection:close");
    socket.writeln();
    await socket.flush(); //发送
    //读取返回内容
    _response = await socket.cast<List<int>>().transform(utf8.decoder).join();
    setState(() {});
    await socket.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Socket"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              RaisedButton(
                onPressed: _request,
                child: Text("点击获取百度"),
              ),
              Text(_response),
            ],
          ),
        ),
      ),
    );
  }
}
