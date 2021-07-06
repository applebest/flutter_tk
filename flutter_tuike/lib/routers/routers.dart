
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertuike/common/webview_page.dart';
import 'package:fluttertuike/page/home/router/home_router.dart';
import 'package:fluttertuike/page/mine/router/mine_router.dart';
import 'package:fluttertuike/routers/interface_router.dart';
import 'package:fluttertuike/routers/not_fount_page.dart';


class Routers  {

  static final FluroRouter router = FluroRouter();

  static final List<InterFaceRouter> _routerList = [];

  static String webViewPage = '/webView';

  static void initRoutes(){

    router.notFoundHandler = Handler(handlerFunc: (
        BuildContext? context, Map<String, List<String>> parameters){
      debugPrint('未找到目标页');
      return NotFoundPage();
    });

    router.define(webViewPage, handler: Handler(handlerFunc: (_, params){
        final String title = params["title"]?.first ?? "";
        final String url = params["url"]?.first ?? "";
        return WebViewPage(url,title: title);
    }));

    _routerList.clear();
    _routerList.add(HomeRouter());
    _routerList.add(MineRouter());

    _routerList.forEach((element) {
      element.initRouter(router);
    });



    
  }




}