import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertuike/net/request_service.dart';
import 'package:fluttertuike/net/urls.dart';
import 'package:fluttertuike/page/home/model/home_model.dart';
import 'package:fluttertuike/page/home/widget/home_advertising_widget.dart';
import 'package:fluttertuike/page/home/widget/privacy_widget.dart';
import 'package:fluttertuike/page/home/widget/update_version_widget.dart';
import 'package:fluttertuike/routers/nav.dart';
import 'package:provider/provider.dart';



enum AlertType {
  update,  // 更新
  privacyProtocol,  // 隐私协议
  advertNotice , //广告
}


class HomeProvider extends ChangeNotifier{


  HomeModel model = HomeModel();
  BuildContext? context;

  fetchData({VoidCallback? willRequest,VoidCallback? requestEnd,VoidCallback? requestFail}) async {


    print("开始请求------");
    if(willRequest != null){
      willRequest();
    }
     await RequestService.request(URLS.getHomeWholeInfo).then((value){

       print("请求完成------");
       model = HomeModel.fromJson(value);
       if(requestEnd != null){
         requestEnd();
       }
       notifyListeners();
     }).catchError((error){

       if(requestFail != null){
         requestFail();
       }
       print("请求错误------");
       print(error.toString());
     });
    
  }

  requestAlertData(BuildContext context) async {
//    return;
    this.context = context;


    await Future.wait([
      _getVersionUpdateData(),
      _getPrivacyProtocolData(),
      _getAdvertNoticeInfo(),])
        .then((value) {


          debugPrint("多网络请求");
          print(value);

          debugPrint("------1");
          print(value[0]);
          debugPrint("------2");
          print(value[1]);
          debugPrint("------3");
          print(value[2]);
          // 执行更新操作
          _handleAlertData(value, AlertType.update);

    }).catchError((error){
       print("多任务请求错误 $error");
    });


  }

  // 版本更新
  Future _getVersionUpdateData()  {

    return   RequestService.request(URLS.checkAppVer);
  }

  
  // 隐私协议
  Future _getPrivacyProtocolData()  {

    return  RequestService.request(URLS.getSalesmanPrivacyDetail);
    
  }

  
  // 广告
   Future _getAdvertNoticeInfo()  {

     return  RequestService.request(URLS.getAdvertNoticeInfo);
  }

  _handleAlertData(List<dynamic> data , AlertType type){


    Map<String,dynamic> param = data[type.index];

    if(type == AlertType.update){

      showDialog(context: context!, builder: (BuildContext ctx){
        return UpdateVersionWidget(param);
      }).then((value){
          _handleAlertData(data, AlertType.privacyProtocol);
      });
    }

    else if (type == AlertType.privacyProtocol) {
      showDialog(context: context!, builder: (BuildContext ctx) => PrivacyWidget(param)).then((value){
        _handleAlertData(data, AlertType.advertNotice);
      });
    }

    else if (type == AlertType.advertNotice) {
      showDialog(context: context!, builder: (BuildContext ctx) => HomeAdvertisingWidget(param)).then((value){
          print("show end");
      });
    }



  }





}
