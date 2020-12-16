import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioRequest extends StatefulWidget {
  @override
  State createState() {
    return DioRequestState();
  }
}

class DioRequestState extends State<DioRequest> {
  //第三方网络库dio(https://pub.dev/packages/dio)
  Dio _dio = new Dio();

  //Http分块下载(https://book.flutterchina.club/chapter11/download_with_chunks.html)

  @override
  void initState() {
    super.initState();
    //dio内部仍然使用HttpClient发起的请求，所以代理、请求认证、证书校验等和HttpClient是相同的，可以在onHttpClientCreate回调中设置。
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      //设置代理
      // client.findProxy = (uri) {
      //   return "PROXY 192.168.1.2:8888";
      // };

      //校验证书
      client.badCertificateCallback = (
        X509Certificate cert,
        String host,
        int port,
      ) {
        print("host=$host port=$port");
        return true;
      };
    };
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dio"),
        ),
        body: Center(
          child: FutureBuilder(
              future:
                  _dio.get("https://api.github.com/orgs/flutterchina/repos"),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                //请求完成
                if (snapshot.connectionState == ConnectionState.done) {
                  Response response = snapshot.data;
                  //发生错误
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  //请求成功，通过项目信息构建用于显示项目名称的ListView
                  return ListView(
                    children: response.data
                        .map<Widget>(
                          (e) => ListTile(
                            title: Text(e["full_name"]),
                          ),
                        )
                        .toList(),
                  );
                }
                //请求未完成时弹出loading
                return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
