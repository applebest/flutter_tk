import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttertuike/routers/routers.dart';

class Nav {
  // push 跳转操作
  static void push(BuildContext context, String path,
      {bool replace = false, bool clearStack = false, Object? arguments}) {
    unfocus();
    Routers.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transition: TransitionType.native,
        routeSettings: RouteSettings(arguments: arguments));
  }

  // push结果回调
  static void pushResult(
      BuildContext context, String path, Function(Object) function,
      {bool replace = false, bool clearStack = false, Object? arguments}) {
    unfocus();
    Routers.router
        .navigateTo(
      context,
      path,
      replace: replace,
      clearStack: clearStack,
      transition: TransitionType.native,
      routeSettings: RouteSettings(
        arguments: arguments,
      ),
    )
        .then((Object? result) {
      if (result == null) {
        return;
      }
      function(result);
    }).catchError((error) {
      print(error);
    });
  }

  // 返回
  static void goBack(BuildContext context) {
    unfocus();
    Routers.router.pop(context);
  }

  // 带参数返回
  static void goBackWithParams(BuildContext context, Object result) {
    unfocus();
    Routers.router.pop<Object>(context, result);
  }

  // 跳转webview
  static void goWebViewPage(BuildContext context, String url,
      {String title = "恒生活众包"}) {
    unfocus();
    push(context,
        "${Routers.webViewPage}?title=${Uri.encodeComponent(title)}&url=${Uri.encodeComponent(url)}");
  }

  // 取消焦点
  static void unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
