import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片及ICON"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("images/assets.jpeg"),
              width: 100.0,
            ),
            Image.asset(
              "images/assets_1.gif",
              width: 100.0,
            ),
            Image(
              image: NetworkImage(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606753145866&di=e1eb406c1840efd80ffca45bdbeb2b93&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F0e2442a7d933c895a9acddafd31373f083020017.jpg"),
              width: 200.0,
              height: 180.0,
              fit: BoxFit.cover,
            ),
            Image.network(
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606753058489&di=9fc7cabf8f61d19845b6d5bc653c93e2&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F30%2F29%2F01300000201438121627296084016.jpg",
              width: 100.0,
            ),
            Icon(
              Icons.accessible,
              color: Colors.green,
            ),
            Icon(
              Icons.error,
              size: 30,
              color: Colors.red,
            ),
            Icon(
              Icons.fingerprint,
              size: 60,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
