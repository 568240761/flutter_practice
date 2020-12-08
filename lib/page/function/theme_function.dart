import 'package:flutter/material.dart';

class ThemeFunction extends StatefulWidget {
  @override
  State createState() {
    return ThemeFunctionState();
  }
}

//本示例是对单个路由换肤，如果想要对整个应用换肤，则可以去修改MaterialApp的theme属性
class ThemeFunctionState extends State<ThemeFunction> {
  //当前路由主题色
  Color _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    //Theme组件可以为Material APP定义主题数据（ThemeData）。
    //在子组件中，我们可以通过Theme.of方法来获取当前的ThemeData。
    return Theme(
      data: ThemeData(
        //在没有指定primaryColor，并且当前主题不是深色主题，那么primaryColor就会默认为primarySwatch指定的颜色，
        //还有一些相似的属性如accentColor 、indicatorColor等也会受primarySwatch影响。
        primarySwatch: _themeColor,
        //用于Icon颜色
        iconTheme: IconThemeData(color: _themeColor),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text("主题")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //第一行Icon使用主题中的iconTheme
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Icon(Icons.favorite),
              Icon(Icons.airport_shuttle),
              Text("  颜色跟随主题")
            ]),
            //为第二行Icon自定义颜色（固定为黑色)
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(color: Colors.black),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text("  颜色固定黑色")
                  ]),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => //切换主题
                setState(() => _themeColor =
                    _themeColor == Colors.teal ? Colors.blue : Colors.teal),
            child: Icon(Icons.palette)),
      ),
    );
  }
}
