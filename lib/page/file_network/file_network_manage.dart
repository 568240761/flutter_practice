import 'package:flutter/material.dart';
import 'dio_request.dart';
import 'http_request.dart';
import 'file_operation.dart';
import 'socket_request.dart';
import 'websocket_request.dart';

class FileNetworkManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文件操作与网络请求"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return FileOperation();
                  }),
                );
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("文件操作"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return HttpRequest();
                  }),
                );
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("HttpClient"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return DioRequest();
                  }),
                );
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Dio"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return WebSocketRequest();
                  }),
                );
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("WebSocket"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SocketRequest();
                  }),
                );
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Socket"),
            ),
          ],
        ),
      ),
    );
  }
}
