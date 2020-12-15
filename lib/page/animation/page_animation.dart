import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义路由切换动画"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  //CupertinoPageRoute是Cupertino组件库提供的iOS风格的路由切换组件，它实现的就是左右滑动切换。
                  CupertinoPageRoute(builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text("自定义路由切换动画-左右滑动切换"),
                      ),
                    );
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("自定义路由切换动画-左右滑动切换"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  //使用PageRouteBuilder来自定义路由切换动画
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 1000),
                    pageBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                    ) {
                      return new FadeTransition(
                        //使用渐隐渐入过渡,
                        opacity: animation,
                        child: Scaffold(
                          appBar: AppBar(
                            title: Text("自定义路由切换动画-方式一"),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("自定义路由切换动画-方式一"),
            ),

            //上面的两种方法都可以实现自定义切换动画，但实际使用时应优先考虑使用PageRouteBuilder，
            //这样无需定义一个新的路由类，使用起来会比较方便。
            //但是有些时候PageRouteBuilder是不能满足需求的，例如在应用过渡动画时我们需要读取当前路由的一些属性，
            //这时就只能通过继承PageRoute的方式了。
            //举个例子，假如我们只想在打开新路由时应用动画，而在返回时不使用动画，那么我们在构建过渡动画时就必须判断当前路由isActive属性是否为true。
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  //通过继承PageRoute的方式实现自定义路由切换动画
                  FadeRoute(builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text("自定义路由切换动画-方式二"),
                      ),
                    );
                  }),
                );
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("自定义路由切换动画-方式二"),
            ),
          ],
        ),
      ),
    );
  }
}

//无论是MaterialPageRoute、CupertinoPageRoute，还是PageRouteBuilder，它们都继承自PageRoute类，
//而PageRouteBuilder其实只是PageRoute的一个包装，我们可以直接继承PageRoute类来实现自定义路由。
class FadeRoute extends PageRoute {
  FadeRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 1000),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    //当前路由被激活，是打开新路由
    if (isActive) {
      return FadeTransition(
        opacity: animation,
        child: builder(context),
      );
    } else {
      //是返回，则不应用过渡动画
      return Padding(padding: EdgeInsets.zero);
    }
  }
}
