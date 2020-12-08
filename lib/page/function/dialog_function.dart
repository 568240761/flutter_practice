import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogFunction extends StatefulWidget {
  @override
  State createState() {
    return DialogFunctionState();
  }
}

class DialogFunctionState extends State<DialogFunction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("对话框"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () async {
                  var delete = await showAlertDialog();
                  if (delete == null) {
                    debugPrint("未返回数据");
                  } else {
                    debugPrint("返回了$delete");
                  }
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("对话框-AlertDialog"),
              ),
              RaisedButton(
                onPressed: () {
                  showSimpleDialog();
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("对话框-SimpleDialog"),
              ),
              RaisedButton(
                onPressed: () {
                  showListDialog();
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("对话框-Dialog"),
              ),
              RaisedButton(
                onPressed: () {
                  showUnconstrainedBoxDialog();
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("自定义对话框"),
              ),
              RaisedButton(
                onPressed: () async {
                  var result = await showCustomDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("提示"),
                        content: Text("您确定要删除当前文件吗?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("取消"),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          FlatButton(
                            child: Text("删除"),
                            onPressed: () {
                              // 执行删除操作
                              Navigator.of(context).pop(true);
                            },
                          ),
                        ],
                      );
                    },
                  );

                  if (result == null) {
                    debugPrint("取消删除当前文件");
                  } else {
                    debugPrint("确定删除当前文件");
                  }
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("打开或关闭对话框动画"),
              ),
              RaisedButton(
                onPressed: () async {
                  //运行代码时我们会发现复选框根本选不中！为什么会这样呢？其实原因很简单，setState方法只会针对当前context的子树重新build，
                  //但是对话框并不是在build方法中构建的，而是通过showDialog单独构建的，所以调用setState是无法影响通过showDialog构建的UI的。
                  //另外，也可以从另外一个角度来理解这个现象，对话框也是通过路由的方式来实现的，那么就等同于企图在父路由中调用setState来让子路由更新，这显然是不行的！
                  //简尔言之，根本原因就是context不对。
                  bool delete = await showDialogState1();
                  if (delete == null) {
                    debugPrint("取消删除");
                  } else {
                    debugPrint("同时删除子目录: $delete");
                  }
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("对话框状态-方式一"),
              ),
              RaisedButton(
                onPressed: () async {
                  //通过单独抽离出StatefulWidget方式来让复选框可以选中
                  bool delete = await showDialogState2();
                  if (delete == null) {
                    debugPrint("取消删除");
                  } else {
                    debugPrint("同时删除子目录: $delete");
                  }
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("对话框状态-方式二"),
              ),
              RaisedButton(
                onPressed: () async {
                  //上面的方法虽然能解决对话框状态更新的问题，但是有一个明显的缺点；
                  //对话框上所有可能会改变状态的组件都得单独封装在一个在内部管理状态的StatefulWidget中，这样不仅麻烦，而且复用性不大。
                  //可以通过使用StatefulBuilder方法来避免上面方法的缺点。
                  bool delete = await showDialogState3();
                  if (delete == null) {
                    debugPrint("取消删除");
                  } else {
                    debugPrint("同时删除子目录: $delete");
                  }
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("对话框状态-方式三"),
              ),
              RaisedButton(
                onPressed: () async {
                  //更精妙的写法
                  bool delete = await showDialogState4();
                  if (delete == null) {
                    debugPrint("取消删除");
                  } else {
                    debugPrint("同时删除子目录: $delete");
                  }
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("对话框状态-方式四"),
              ),
              RaisedButton(
                onPressed: () async {
                  int type = await showBottomDialog();
                  debugPrint("选择了：$type");
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("底部菜单列表对话框"),
              ),
              RaisedButton(
                onPressed: () {
                  //TODO(有问题)
                  _showBottomSheet();
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("从底部弹出全屏对话框"),
              ),
              RaisedButton(
                onPressed: () {
                  showLoadingDialog1();
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("Loading对话框-1"),
              ),
              RaisedButton(
                onPressed: () {
                  showLoadingDialog2();
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("Loading对话框-2"),
              ),
              RaisedButton(
                onPressed: () {
                  _showDatePicker1();
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("日历选择对话框-1"),
              ),
              RaisedButton(
                onPressed: () {
                  _showDatePicker2();
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("日历选择对话框-iOS风格"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> showAlertDialog() {
    //showDialog()是Material组件库提供的一个用于弹出Material风格对话框的方法
    return showDialog<bool>(
      context: context,
      //点击对话框barrier(遮罩)时是否关闭它；如果点击可以关闭对话框，则返回结果为null
      barrierDismissible: true,
      builder: (context) {
        //如果AlertDialog的内容过长，内容将会溢出，这在很多时候可能不是我们期望的，所以如果对话框内容过长时，可以用SingleChildScrollView将内容包裹起来。
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              //关闭对话框和路由返回的方式是一致的，并且都可以返回一个结果数据。
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  void showSimpleDialog() async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          //SimpleDialog会展示一个列表，用于列表选择的场景。
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      debugPrint("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  //AlertDialog和SimpleDialog都使用了Dialog类，由于AlertDialog和SimpleDialog中使用了IntrinsicWidth来尝试通过子组件的实际尺寸来调整自身尺寸，
  //这就导致他们的子组件不能是延迟加载模型的组件（如ListView、GridView 、 CustomScrollView等），也就是说在AlertDialog和SimpleDialog中使用ListView会报错。
  void showListDialog() async {
    int index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            )),
          ],
        );
        //使用AlertDialog会报错
        //return AlertDialog(content: child);
        return Dialog(child: child);
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }

  void showUnconstrainedBoxDialog() async {
    int index = await showDialog<int>(
      context: context,
      //在builder中可以构建上面三个对话框组件中的一种，也可以自定义。
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            )),
          ],
        );
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 280),
            child: Material(
              child: child,
              type: MaterialType.card,
            ),
          ),
        );
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  Future<T> showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    //showDialog方法正是showGeneralDialog的一个封装，定制了Material风格对话框的遮罩颜色和动画，Material风格对话框打开/关闭动画是一个Fade（渐隐渐显）动画。
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87,
      // 自定义遮罩颜色
      transitionDuration: const Duration(milliseconds: 150),
      //通过transitionBuilder来设置动画
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  bool dialogState1 = false;

  Future<bool> showDialogState1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  Checkbox(
                    value: dialogState1,
                    onChanged: (bool value) {
                      //复选框选中状态发生变化时重新构建UI
                      setState(() {
                        //更新复选框状态
                        dialogState1 = !dialogState1;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //执行删除操作
                Navigator.of(context).pop(dialogState1);
              },
            ),
          ],
        );
      },
    );
  }

  bool dialogState2 = false;

  Future<bool> showDialogState2() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  DialogCheckbox(
                    value: dialogState2,
                    onChanged: (bool value) {
                      //复选框选中状态发生变化时重新构建UI
                      setState(() {
                        //更新复选框状态
                        dialogState2 = !dialogState2;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //执行删除操作
                Navigator.of(context).pop(dialogState2);
              },
            ),
          ],
        );
      },
    );
  }

  bool dialogState3 = false;

  Future<bool> showDialogState3() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Checkbox(
                      value: dialogState3,
                      onChanged: (bool value) {
                        //复选框选中状态发生变化时重新构建UI
                        setState(() {
                          //更新复选框状态
                          dialogState3 = !dialogState3;
                        });
                      },
                    );
                  }),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //执行删除操作
                Navigator.of(context).pop(dialogState3);
              },
            ),
          ],
        );
      },
    );
  }

  bool dialogState4 = false;

  Future<bool> showDialogState4() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  Builder(builder: (context) {
                    return Checkbox(
                      value: dialogState4,
                      onChanged: (bool value) {
                        //在setState中调用了Element的markNeedsBuild()方法。
                        //Flutter是一个响应式框架，要更新UI只需改变状态后通知框架页面需要重构即可，而Element的markNeedsBuild()方法正是来实现这个功能的！
                        //markNeedsBuild()方法会将当前的Element对象标记为“dirty”（脏的），在每一个Frame，Flutter都会重新构建被标记为“dirty”Element对象。
                        //可以通过Context来得到Element对象
                        (context as Element).markNeedsBuild();
                        dialogState4 = !dialogState4;
                      },
                    );
                  }),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //执行删除操作
                Navigator.of(context).pop(dialogState4);
              },
            ),
          ],
        );
      },
    );
  }

  Future<int> showBottomDialog() {
    //showModalBottomSheet的实现原理和showGeneralDialog实现原理相同，都是通过路由的方式来实现的。
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }

  PersistentBottomSheetController<int> _showBottomSheet() {
    //showBottomSheet方法，该方法会从设备底部向上弹出一个全屏的菜单列表。
    //PersistentBottomSheetController中包含了一些控制对话框的方法比如close方法可以关闭该对话框。
    //showBottomSheet和上面介绍的弹出对话框的方法原理不同：
    //showBottomSheet是调用widget树顶部的Scaffold组件的ScaffoldState的showBottomSheet同名方法实现，也就是说要调用showBottomSheet方法就必须得保证父级组件中有Scaffold。
    return showBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () {
                debugPrint("选择了：$index");
                Navigator.of(context).pop();
              },
            );
          },
        );
      },
    );
  }

  showLoadingDialog1() {
    showDialog(
      context: context,
      //点击遮罩不关闭对话框
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Text("正在加载，请稍后..."),
              )
            ],
          ),
        );
      },
    );
  }

  showLoadingDialog2() {
    showDialog(
      context: context,
      //点击遮罩不关闭对话框
      barrierDismissible: false,
      builder: (context) {
        //自定义对话框宽度，这时只使用SizedBox或ConstrainedBox是不行的，原因是showDialog中已经给对话框设置了宽度限制。
        //可以使用UnconstrainedBox先抵消showDialog对宽度的限制，然后再使用SizedBox指定宽度。
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 280,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Text("正在加载，请稍后..."),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<DateTime> _showDatePicker1() {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add(
        //未来30天可选
        Duration(days: 30),
      ),
    );
  }

  //TODO(背景是透明的)
  Future<DateTime> _showDatePicker2() {
    var date = DateTime.now();
    return showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            minimumDate: date,
            maximumDate: date.add(
              Duration(days: 30),
            ),
            maximumYear: date.year + 1,
            onDateTimeChanged: (DateTime value) {
              print(value);
            },
          ),
        );
      },
    );
  }
}

// 单独封装一个内部管理选中状态的复选框组件
class DialogCheckbox extends StatefulWidget {
  DialogCheckbox({
    Key key,
    this.value,
    @required this.onChanged,
  });

  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  _DialogCheckboxState createState() => _DialogCheckboxState();
}

class _DialogCheckboxState extends State<DialogCheckbox> {
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        //将选中状态通过事件的形式抛出
        widget.onChanged(v);
        setState(() {
          //更新自身选中状态
          value = v;
        });
      },
    );
  }
}
