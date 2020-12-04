import 'package:flutter/material.dart';

class ListScroll1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView_1"),
      ),
      body: ListView(
        //强制children的“长度”为itemExtent的值。
        //这里的“长度”是指滚动方向上子组件的长度，也就是说如果滚动方向是垂直方向，则itemExtent代表子组件的高度；
        //如果滚动方向为水平方向，则itemExtent就代表子组件的宽度。
        //在ListView中，指定itemExtent比让子组件自己决定自身长度会更高效，
        //这是因为指定itemExtent后，滚动系统可以提前知道列表的长度，
        //而无需每次构建子组件时都去再计算一下，尤其是在滚动位置频繁变化时（滚动系统需要频繁去计算列表高度）。
        itemExtent: 30.0,
        //是否根据子组件的总长度来设置ListView的长度，默认值为false 。
        //默认情况下，ListView的会在滚动方向尽可能多的占用空间。
        //当ListView在一个无边界(滚动方向上)的容器中时，shrinkWrap必须为true。
        shrinkWrap: true,
        padding: EdgeInsets.all(20.0),
        //这种方式适合只有少量的子组件的情况，因为这种方式需要将所有children都提前创建好（这需要做大量工作）。
        children: [
          const Text('I\'m dedicating every day to you'),
          const Text('Domestic life was never quite my style'),
          const Text('When you smile, you knock me out, I fall apart'),
          const Text('And I thought I was so smart'),
        ],
        //表示是否将列表项（子组件）包裹在AutomaticKeepAlive 组件中；
        //典型地，在一个懒加载列表中，如果将列表项包裹在AutomaticKeepAlive中，在该列表项滑出视口时它也不会被GC（垃圾回收），
        //它会使用KeepAliveNotification来保存其状态。如果列表项自己维护其KeepAlive状态，那么此参数必须置为false。
        addAutomaticKeepAlives: true,
        //表示是否将列表项（子组件）包裹在RepaintBoundary组件中。
        //当可滚动组件滚动时，将列表项包裹在RepaintBoundary中可以避免列表项重绘，
        //但是当列表项重绘的开销非常小（如一个颜色块，或者一个较短的文本）时，不添加RepaintBoundary反而会更高效。
        //和addAutomaticKeepAlive一样，如果列表项自己维护其KeepAlive状态，那么此参数必须置为false。
        addRepaintBoundaries: true,
      ),
    );
  }
}

class ListScroll2 extends StatefulWidget {
  @override
  State createState() {
    return ListScroll2State();
  }
}

class ListScroll2State extends State<ListScroll2> {
  //更多关于滚动监听可以查看《Flutter实战》中“滚动监听及控制”章节（https://book.flutterchina.club/chapter6/scroll_controller.html）
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  @override
  void initState() {
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView_2和滚动监听"),
      ),
      //支持基于Sliver的懒加载
      body: ListView.builder(
        itemExtent: 40,
        //列表项的数量，如果为null，则为无限列表。
        itemCount: null,
        controller: _controller,
        itemBuilder: (context, index) {
          return ListTile(title: Text("$index"));
        },
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                //返回到顶部时执行动画
                _controller.animateTo(
                  .0,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                );
              },
            ),
    );
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }
}

class ListScroll3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用
    Widget divider1 = Divider(
      height: 10.0,
      color: Colors.blue,
    );
    Widget divider2 = Divider(
      height: 10.0,
      color: Colors.green,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("ListView_3"),
      ),
      //ListView.separated可以在生成的列表项之间添加一个分割组件
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(title: Text("$index"));
          },
          //分割器构造器
          separatorBuilder: (context, index) {
            return index % 2 == 0 ? divider1 : divider2;
          },
          itemCount: 100),
    );
  }
}

class ListScroll4 extends StatefulWidget {
  @override
  State createState() {
    return ListScroll4State();
  }
}

class ListScroll4State extends State<ListScroll4> {
  static const loadingTag = "##loading##"; //表尾标记
  var _data = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "M",
    "L",
    "S",
    "T",
    "R",
    "S",
    "S",
    "E",
    "F",
    "Q",
    "P",
    loadingTag,
  ];

  void _insertData() {
    Future.delayed(Duration(seconds: 10)).then((value) {
      setState(() {
        _data.insertAll(_data.length - 1, [
          "A",
          "B",
          "C",
          "D",
          "E",
          "F",
          "G",
          "H",
          "I",
          "J",
          "K",
          "M",
          "L",
          "S",
          "T",
          "R",
          "S",
          "S",
          "E",
          "F",
          "Q",
          "P",
        ]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("无限加载数据"),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          if (_data[index] == loadingTag) {
            if (_data.length < 100) {
              _insertData();
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: Text("没有更多了"),
                ),
              );
            }
          } else {
            return ListTile(
              title: Text("${_data[index]}"),
            );
          }
        },
      ),
    );
  }
}

class ListScroll5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("添加固定列表头_1"),
      ),
      body: Column(
        children: [
          ListTile(title: Text("数字顺序表")),
          SizedBox(
            //高度写死的方式不好，不会占满剩余的空间，建议使用Expanded。
            height: 300,
            //不能直接把ListView.builder作为Column的直接子View，因为它的高度边界无法确定；否则会报错。
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListScroll6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("添加固定列表头_2"),
      ),
      body: Column(
        children: [
          ListTile(title: Text("数字顺序表")),
          Expanded(
            //不能直接把ListView.builder作为Column的直接子View，因为它的高度边界无法确定；否则会报错。
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
