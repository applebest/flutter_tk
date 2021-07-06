import 'package:flutter/material.dart';
import 'package:fluttertuike/net/request_service.dart';
import 'package:fluttertuike/net/urls.dart';
import 'package:fluttertuike/page/product/model/product_list_model.dart';

class ProductListProvider extends ChangeNotifier {
  List<ProductModel> _list = [];

  List<ProductModel> get list => _list;

  int _page = 1;

  int get page => _page;

  int get maxPage => _maxPage;
  int _maxPage = 1;

//    {@"pageNum":pageNum,@"pageSize":pageSize,@"productType":self.typeModel.productType}

  fetchData(bool isRefresh, String productType) {
    _page = isRefresh ? 1 : _page++;
    RequestService.request(URLS.getProductPage, queryParameters: {
      "pageNum": _page,
      "pageSize": 10,
      "productType": productType
    }).then((value) {
      ProductListModel model = ProductListModel.fromJson(value);
      _maxPage = model.pageTotal!;
      if (model.list != null) {
        addList(isRefresh, model.list!);
      }
    });
  }

  // 添加数据
  addList(bool isRefresh, List<ProductModel> list) {
    if (isRefresh) {
      _list = list;
    } else {
      _list.addAll(list);
    }

    notifyListeners();
  }
}
