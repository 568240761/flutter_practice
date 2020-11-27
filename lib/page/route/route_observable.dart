import 'package:flutter/material.dart';
import 'package:flutter_practice/main.dart';

class RouteObservable extends StatefulWidget {
  @override
  State createState() => RouteObservableState();
}

class RouteObservableState extends State<RouteObservable> with RouteAware{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("页面状态被观察"),
      ),
    );
  }

  @override
  void didPop() {
    print("RouteObservableState-didPop");
  }

  @override
  void didPopNext() {
    print("RouteObservableState-didPopNext");
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
    print("RouteObservableState-dispose");
  }

  @override
  void didPushNext() {
    print("RouteObservableState-didPushNext");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
    print("RouteObservableState-didChangeDependencies");
  }

  @override
  void didPush() {
    print("RouteObservableState-didPush");
  }
}
