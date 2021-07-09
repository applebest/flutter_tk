
import 'package:fluro/fluro.dart';
import 'package:fluro/src/fluro_router.dart';
import 'package:fluttertuike/page/mine/page/posters_page.dart';
import 'package:fluttertuike/page/mine/page/privacy_setting_page.dart';
import 'package:fluttertuike/page/mine/page/setting_page.dart';
import 'package:fluttertuike/page/mine/page/withdrawal_page.dart';
import 'package:fluttertuike/page/mine/page/withdrawal_record_page.dart';
import 'package:fluttertuike/routers/interface_router.dart';

// 个人中心路由设置
class MineRouter implements InterFaceRouter{


  static String  withdrawalPage = "Withdrawal";

  static String settingPage = "setting";

  static String privacySettingPage = "privacySettingPage";

  static String withDrawalRecordPage = "WithDrawalRecordPage";

  static String postersPage  = "PostersPage";

  @override
  void initRouter(FluroRouter router) {
    router.define(withdrawalPage, handler:Handler(handlerFunc:(_ , __) => WithdrawalPage()));

    router.define(settingPage, handler:Handler(handlerFunc:(_ ,  Map<String, List<String>> params){

      // 传参解析
      final String title = params["title"]?.first ?? "";
      final String message = params["message"]?.first ?? "";

     return SettingPage(title,message);

    }));

    router.define(privacySettingPage, handler: Handler(handlerFunc:(_ , __) => PrivacySettingPage()));
    router.define(withDrawalRecordPage, handler: Handler(handlerFunc:(_ , __) => WithDrawalRecordPage()));
    router.define(postersPage, handler: Handler(handlerFunc:(_ , __) => PostersPage()));


  }



}