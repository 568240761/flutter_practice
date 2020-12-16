import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

//Http协议是无状态的，只能由客户端主动发起，服务端再被动响应，服务端无法向客户端主动推送内容，
//并且一旦服务器响应结束，链接就会断开，所以无法进行实时通信。
//WebSocket协议正是为解决客户端与服务端实时通信而产生的技术，现在已经被主流浏览器支持，
//所以对于Web开发者来说应该比较熟悉了，Flutter也提供了专门的包来支持WebSocket协议。
//
//Http协议中虽然可以通过keep-alive机制使服务器在响应结束后链接会保持一段时间，但最终还是会断开，
//keep-alive机制主要是用于避免在同一台服务器请求多个资源时频繁创建链接，
//它本质上是支持链接复用的技术，而并非用于实时通信，读者需要知道这两者的区别。
//
//WebSocket协议本质上是一个基于tcp的协议，它是先通过HTTP协议发起一条特殊的http请求进行握手后，
//如果服务端支持WebSocket协议，则会进行协议升级。
//WebSocket会使用http协议握手后创建的tcp链接，和http协议不同的是，WebSocket的tcp链接是个长链接，
//所以服务端与客户端就可以通过此TCP连接进行实时通信。
//
//WebSocket中所有发送的数据使用帧的形式发送，而帧是有固定格式，每一个帧的数据类型都可以通过Opcode字段指定，
//它可以指定当前帧是文本类型还是二进制类型（还有其它类型），所以客户端在收到帧时就已经知道了其数据类型，
//所以flutter完全可以在收到数据后解析出正确的类型，所以就无需开发者去关心，
//当服务器传输的数据是指定为二进制时，StreamBuilder的snapshot.data的类型就是List<int>，是文本时，则为String。
class WebSocketRequest extends StatefulWidget {
  @override
  _WebSocketRequestState createState() => new _WebSocketRequestState();
}

class _WebSocketRequestState extends State<WebSocketRequest> {
  TextEditingController _controller = new TextEditingController();
  IOWebSocketChannel channel;
  String _text = "";


  @override
  void initState() {
    //创建websocket连接
    channel = new IOWebSocketChannel.connect('ws://echo.websocket.org');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("WebSocket"),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Form(
              child: new TextFormField(
                controller: _controller,
                decoration: new InputDecoration(labelText: '发送一个消息'),
              ),
            ),
            new StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                //网络不通会走到这
                if (snapshot.hasError) {
                  _text = "网络不通...";
                } else if (snapshot.hasData) {
                  _text = "echo: "+snapshot.data;
                }
                return new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: new Text(_text),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: '发送消息',
        child: new Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}