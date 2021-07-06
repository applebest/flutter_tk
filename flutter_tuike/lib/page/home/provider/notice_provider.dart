
import 'package:flutter/material.dart';
import 'package:fluttertuike/net/request_service.dart';
import 'package:fluttertuike/net/urls.dart';
import 'package:fluttertuike/page/home/model/notice_list_model.dart';

class NoticeProvider extends ChangeNotifier {

    int _page = 1 ;

    NoticeListModel? model;

    fetchData(bool isRefresh){

      _page = isRefresh ? 1 : ( _page += 1 );

      RequestService.request(
          URLS.getAnnounceNoticePage,
          queryParameters: {
            "pageNum":_page,
            "pageSize":"20"
          }).then((value){
        NoticeListModel tempModel = NoticeListModel.fromJson(value);
       if(isRefresh){
         model = tempModel;
       }else{
         if(tempModel.list!.length > 0){
           model!.list!.addAll(tempModel.list!);
           model!.pageTotal = tempModel.pageTotal;
           model!.totalCount = tempModel.totalCount;
           model!.pageNum = tempModel.pageNum;
         }
       }
       notifyListeners();
      });



    }




}