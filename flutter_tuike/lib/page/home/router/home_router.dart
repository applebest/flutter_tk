
import 'package:fluro/fluro.dart';
import 'package:fluro/src/fluro_router.dart';
import 'package:fluttertuike/page/home/notice_list_page.dart';
import 'package:fluttertuike/routers/interface_router.dart';
import 'package:fluttertuike/routers/not_fount_page.dart';


class HomeRouter implements InterFaceRouter {

  // 通知列表
  static String noticeList = "/home/noticeListPage";

  @override
  void initRouter(FluroRouter router) {

  router.define(noticeList, handler:Handler(handlerFunc:(_ , __) => NoticeListPage()));

    
  }

}