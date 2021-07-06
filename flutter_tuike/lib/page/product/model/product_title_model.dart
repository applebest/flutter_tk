/// list : [{"productType":5,"productTypeName":"智能货柜"},{"productType":6,"productTypeName":"场地招募"},{"productType":1,"productTypeName":"借贷产品"},{"productType":4,"productTypeName":"生活服务"}]

class ProductTitleListModel {
  List<ProductTitleModel>? _list;

  List<ProductTitleModel>? get list => _list;

  ProductTitleListModel({
      List<ProductTitleModel>? list}){
    _list = list;
}

  ProductTitleListModel.fromJson(dynamic json) {
    if (json["list"] != null) {
      _list = [];
      json["list"].forEach((v) {
        _list?.add(ProductTitleModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_list != null) {
      map["list"] = _list?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// productType : 5
/// productTypeName : "智能货柜"

class ProductTitleModel {
  int? _productType;
  String? _productTypeName;

  int? get productType => _productType;
  String? get productTypeName => _productTypeName;

  ProductTitleModel({
      int? productType, 
      String? productTypeName}){
    _productType = productType;
    _productTypeName = productTypeName;
}

  ProductTitleModel.fromJson(dynamic json) {
    _productType = json["productType"];
    _productTypeName = json["productTypeName"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["productType"] = _productType;
    map["productTypeName"] = _productTypeName;
    return map;
  }

}