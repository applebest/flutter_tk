
import 'package:flutter/material.dart';
import 'package:fluttertuike/net/request_service.dart';
import 'package:fluttertuike/net/urls.dart';
import 'package:fluttertuike/page/product/model/product_title_model.dart';

class ProductProvider extends ChangeNotifier {


   ProductTitleListModel? model;

  /// Tab的下标
  int _index = 0;
  int get index => _index;


  void setIndex(int index) {
    _index = index;
    notifyListeners();
  }

  fetchData({VoidCallback? requestEnd}){

    RequestService.request(URLS.getProductType).then((value) {

     model = ProductTitleListModel.fromJson(value);

     if(requestEnd != null){
      requestEnd();
     }
      notifyListeners();
    }).catchError((error){
        print("产品请求错误 $error");
    });


  }


}