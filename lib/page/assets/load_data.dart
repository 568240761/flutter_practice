import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class LoadData extends StatefulWidget {
  @override
  State createState() {
    return LoadDataState();
  }
}

class LoadDataState extends State<LoadData> {
  String data = "数据还未加载";
  String data1 = "数据还未加载";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("加载文本"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {
                setState(() {
                  data = "数据加载中...";
                });

                var result = loadData();
                result.then((value) {
                  setState(() {
                    data = value;
                  });
                });
              },
              color: Colors.blue,
              child: Text("加载数据-方式一"),
            ),
            Text("$data"),
            FlatButton(
              onPressed: () async {
                setState(() {
                  data1 = "数据加载中...";
                });

                String result =
                    await rootBundle.loadString('data/data', cache: false);

                setState(() {
                  data1 = result;
                });
              },
              color: Colors.blue,
              child: Text("加载数据-方式二"),
            ),
            Text("$data1"),
          ],
        ),
      ),
    );
  }

  Future<String> loadData() {
    return rootBundle.loadString('data/data', cache: false);
  }
}
