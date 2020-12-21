import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'page/file_network/file_network_manage.dart';
import 'page/custom_component/custom_manage.dart';
import 'page/animation/animation_manage.dart';
import 'page/event/event_notification_manage.dart';
import 'page/function/function_manage.dart';
import 'page/container/container_manage.dart';
import 'page/layout/layout_manage.dart';
import 'page/base_widget/form_widget.dart';
import 'page/base_widget/textfield_widget.dart';
import 'page/base_widget/checkbox_switch_widget.dart';
import 'page/base_widget/button_widget.dart';
import 'page/base_widget/image_widget.dart';
import 'page/base_widget/progress_indicator_widget.dart';
import 'page/base_widget/text_widget.dart';
import 'page/base_widget/base_widget_manage.dart';
import 'page/exception/future_throw_exception.dart';
import 'page/scroll/scroll_manage.dart';
import 'page/state_lifecycle.dart';
import 'page/exception/exception_manage.dart';
import 'page/exception/auto_throw_exception.dart';
import 'page/exception/click_throw_exception.dart';
import 'page/assets/assets_manage.dart';
import 'page/assets/load_image.dart';
import 'page/assets/load_image_1.dart';
import 'page/home_page.dart';
import 'page/route/name_route.dart';
import 'page/route/name_route_by_generate.dart';
import 'page/route/found_404.dart';
import 'page/route/route_observable.dart';
import 'page/assets/load_data.dart';

//收集日志，写入文件
void collectLog(String line) {}

//上报错误和日志逻辑
void reportErrorAndLog(FlutterErrorDetails details) {
  print("reportErrorAndLog-${details.exception}");
}

// 构建错误信息
FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
  debugPrint("makeDetails");
  return FlutterErrorDetails(exception: obj, stack: stack);
}

void main() {
  runZonedGuarded(
    () => runApp(MyApp()),
    //捕获异步代码中的异常
    (Object obj, StackTrace stack) {
      var details = makeDetails(obj, stack);
      reportErrorAndLog(details);
    },
    //拦截所有日志打印
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        parent.print(zone, "Intercepted: $line");
        collectLog(line);
      },
    ),
  );

  //捕获同步代码中的异常
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    reportErrorAndLog(details);
  };
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
        "exception": (context) => ExceptionManage(),
        "click_throw_exception": (context) => ClickThrowException(),
        "auto_throw_exception": (context) => AutoThrowException(),
        "future_throw_exception": (context) => FutureThrowException(),
        "state": (context) => StateLifecycle(),
        "base_widget_manage": (context) => BaseWidgetManage(),
        "base_widget_text": (context) => TextWidget(),
        "base_widget_button": (context) => ButtonWidget(),
        "/base_widget/image_widget": (context) => ImageWidget(),
        "/base_widget/progress_indicator_widget": (context) =>
            ProgressIndicatorWidget(),
        "/base_widget/check_switch_widget": (context) => CheckBoxSwitchWidget(),
        "/base-widget/textfield_widget": (context) => TextFieldWidget(),
        "/base-widget/form_widget": (context) => FormWidget(),
        "layout_manage": (context) => LayoutManage(),
        "container_manage": (context) => ContainerManage(),
        "scroll_manage": (context) => ScrollManage(),
        "function_manage": (context) => FunctionManage(),
        "event_notification_manage": (context) => EventNotificationManage(),
        "animation_manage": (context) => AnimationManage(),
        "custom_manage": (context) => CustomManage(),
        "file_network": (context) => FileNetworkManage(),
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
