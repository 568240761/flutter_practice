import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice/page/exception/throw_exception.dart';

import 'page/assets/assets_manage.dart';
import 'page/assets/load_image.dart';
import 'page/assets/load_image_1.dart';
import 'page/home_page.dart';
import 'page/route/name_route.dart';
import 'page/route/name_route_by_generate.dart';
import 'page/route/found_404.dart';
import 'page/route/route_observable.dart';
import 'page/assets/load_data.dart';

//收集日志
void collectLog(String line) {
  print("collectLog-$line");
}

//上报错误和日志逻辑
void reportErrorAndLog(FlutterErrorDetails details) {
  print("reportErrorAndLog-${details.exception}");
}

//// 构建错误信息
FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
  return FlutterErrorDetails(exception: obj, stack: stack);
}

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    reportErrorAndLog(details);
  };

  runZonedGuarded(
    () => runApp(MyApp()),
    (Object obj, StackTrace stack) {
      var details = makeDetails(obj, stack);
      reportErrorAndLog(details);
    },
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        collectLog(line);
      },
    ),
  );
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      //命名路由表
      routes: {
        "/": (context) => MyHomePage(title: '首页'),
        "name_route": (context) => NameRoute(),
        "route_observable": (context) => RouteObservable(),
        "assets_manage": (context) => AssetsManage(),
        "load_data": (context) => LoadData(),
        "load_image": (context) => LoadImage(),
        "load_image_1": (context) => LoadImage1(),
        "exception": (context) => ThrowException(),
      },
      //在路由表中没有注册，会回调该方法
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) {
            String name = settings.name;

            var widget;
            switch (name) {
              case "name_route_by_generate":
                widget = NameRouteByGenerate();
                break;
              default:
                widget = Found404();
                break;
            }

            return widget;
          },
          settings: settings,
        );
      },
      //监听路由跳转
      navigatorObservers: [NavigatorObserverImpl(), routeObserver],
      //在路由表中没有注册，并且 [onGenerateRoute] 属性为空时，会回调该方法
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return Found404();
        });
      },
    );
  }
}

class NavigatorObserverImpl extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("NavigatorObserverImpl-didPush");
  }

  @override
  void didStopUserGesture() {
    print("NavigatorObserverImpl-didPush");
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("NavigatorObserverImpl-didStopUserGesture");
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    print("NavigatorObserverImpl-didReplace");
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("NavigatorObserverImpl-didRemove");
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("NavigatorObserverImpl-didPop");
  }
}
