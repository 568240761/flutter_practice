import 'dart:collection';

import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  const InheritedProvider({@required this.data, Widget child})
      : super(child: child);

  final T data;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }
}

class ChangeNotifier implements Listenable {
  List listeners = <VoidCallback>[];

  @override
  void addListener(VoidCallback listener) {
    listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    listeners.remove(listener);
  }

  //通知所有监听器，触发回调
  void notifyListeners() {
    listeners.forEach((element) {
      element();
    });
  }
}

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({Key key, this.data, this.child}) : super(key: key);

  final T data;
  final Widget child;

  @override
  _ChangeNotifierProviderState<T> createState() {
    return _ChangeNotifierProviderState<T>();
  }

  //方便子树中的widget获取共享数据
  static T of<T>(BuildContext context, {bool listen = true}) {
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context
            .getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()
            ?.widget as InheritedProvider<T>;
    return provider.data;
  }
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider> {
  void update() {
    setState(() {});
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }
}

class Consumer<T> extends StatelessWidget {
  Consumer({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    debugPrint("build Consumer");
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context), //自动获取Model
    );
  }
}

class Item {
  Item(this.price, this.count);

  double price;
  int count;
}

class CartModer extends ChangeNotifier {
  final List<Item> _items = [];

  //禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  //购物车中商品的总价
  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);

  void addItem(Item item) {
    _items.add(item);
    //通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
    notifyListeners();
  }
}

class CartFunction extends StatefulWidget {
  @override
  _CartFunctionState createState() {
    return _CartFunctionState();
  }
}

class _CartFunctionState extends State<CartFunction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("跨组件状态共享（Provider）"),
      ),
      body: Center(
        child: ChangeNotifierProvider<CartModer>(
          data: CartModer(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //不能直接使用Text，需要使用Builder包裹，否则会报错。
              //Text("总价格：${ChangeNotifierProvider.of<CartModer>(context).totalPrice}",),
              //TODO(为什么会报错？)
              Builder(builder: (context) {
                debugPrint("build Text");
                return Text(
                  "总价格：${ChangeNotifierProvider.of<CartModer>(context).totalPrice}",
                );
              }),
              //使用 Consumer 语义更明确，便于浏览；以及简化写法
              Consumer<CartModer>(
                builder: (context, cart) => Text("总价格：${cart.totalPrice}"),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Consumer<CartModer>(
                  builder: (context, cart) => Text("总价格：${cart.totalPrice}"),
                ),
              ),

              Builder(builder: (context) {
                debugPrint("build Padding");
                return RaisedButton(
                  onPressed: () {
                    //不注册依赖
                    ChangeNotifierProvider.of<CartModer>(context, listen: false)
                        .addItem(Item(20.0, 1));
                  },
                  child: Text("添加商品"),
                  color: Colors.blue,
                  textColor: Colors.white,
                );

                //如果在外层添加Padding包裹，即使不注册依赖，每次依赖改变也会重新build。
                //TODO(为什么这样？)
                // return Padding(
                //   padding: EdgeInsets.only(top: 20.0),
                //   child: RaisedButton(
                //     onPressed: () {
                //       ChangeNotifierProvider.of<CartModer>(context,listen: false)
                //           .addItem(Item(20.0, 1));
                //     },
                //     child: Text("添加商品"),
                //     color: Colors.blue,
                //     textColor: Colors.white,
                //   ),
                // );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
