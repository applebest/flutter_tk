
import 'package:fluttertuike/page/product/model/product_list_model.dart';

class HomeModel {
  List<BannerList>? bannerList;
   List<NoticeList>? noticeList;
   List<ProductList>? productList;
   List<CeramicsList>? ceramicsList;

  HomeModel({this.bannerList, this.noticeList, this.productList, this.ceramicsList});

   HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['bannerList'] != null) {
      bannerList = <BannerList>[];
      json['bannerList'].forEach((v) {
        bannerList!.add(new BannerList.fromJson(v));
      });
    }
    if (json['noticeList'] != null) {
      noticeList = <NoticeList>[];
      json['noticeList'].forEach((v) {
        noticeList!.add(new NoticeList.fromJson(v));
      });
    }
    if (json['productList'] != null) {
      productList = <ProductList>[];
      json['productList'].forEach((v) {
        productList!.add(new ProductList.fromJson(v));
      });
    }
    if (json['ceramicsList'] != null) {
      ceramicsList = <CeramicsList>[];
      json['ceramicsList'].forEach((v) {
        ceramicsList!.add(new CeramicsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bannerList != null) {
      data['bannerList'] = this.bannerList!.map((v) => v.toJson()).toList();
    }
    if (this.noticeList != null) {
      data['noticeList'] = this.noticeList!.map((v) => v.toJson()).toList();
    }
    if (this.productList != null) {
      data['productList'] = this.productList!.map((v) => v.toJson()).toList();
    }
    if (this.ceramicsList != null) {
      data['ceramicsList'] = this.ceramicsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerList {
  List<String>? route;
  String? imageUrl;

  BannerList({this.route, this.imageUrl});

  BannerList.fromJson(Map<String, dynamic> json) {
    route = json['route'].cast<String>();
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['route'] = this.route;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}

class NoticeList {
  String? noticeTitle;
  List<String>? route;

  NoticeList({this.noticeTitle, this.route});

  NoticeList.fromJson(Map<String, dynamic> json) {
    noticeTitle = json['noticeTitle'];
    route = json['route'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['noticeTitle'] = this.noticeTitle;
    data['route'] = this.route;
    return data;
  }
}

class ProductList {
  int? productType = 0;
  String? title;
  List<ProductModel>? list;
  ButtonModel? button;
  int? isMore = 0;

  ProductList(
      {this.productType, this.title, this.list, this.button, this.isMore});

  ProductList.fromJson(Map<String, dynamic> json) {
    productType = json['productType'];
    title = json['title'];
    if (json['list'] != null) {
      list =  <ProductModel>[];
      json['list'].forEach((v) {
        list!.add(new ProductModel.fromJson(v));
      });
    }
    button =
    json['button'] != null ? new ButtonModel.fromJson(json['button']) : null;
    isMore = json['isMore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productType'] = this.productType;
    data['title'] = this.title;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    if (this.button != null) {
      data['button'] = this.button!.toJson();
    }
    data['isMore'] = this.isMore;
    return data;
  }
}

//class ListModel {
//  String? productManual;
//  String? detailAmount;
//  String? iconUrl;
//  String? productName;
//  List<String>? tag;
//  String? productFeatures;
//  String? productListPicture;
//  List<String>? route;
//
//  ListModel(
//      {this.productManual,
//        this.detailAmount,
//        this.iconUrl,
//        this.productName,
//        this.tag,
//        this.productFeatures,
//        this.productListPicture,
//        this.route});
//
//  ListModel.fromJson(Map<String, dynamic> json) {
//    productManual = json['productManual'];
//    detailAmount = json['detailAmount'];
//    iconUrl = json['iconUrl'];
//    productName = json['productName'];
//    tag = json['tag'].cast<String>();
//    productFeatures = json['productFeatures'];
//    productListPicture = json['productListPicture'];
//    route = json['route'].cast<String>();
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['productManual'] = this.productManual;
//    data['detailAmount'] = this.detailAmount;
//    data['iconUrl'] = this.iconUrl;
//    data['productName'] = this.productName;
//    data['tag'] = this.tag;
//    data['productFeatures'] = this.productFeatures;
//    data['productListPicture'] = this.productListPicture;
//    data['route'] = this.route;
//    return data;
//  }
//}

class ButtonModel {
  List<String>? route;
  String? text;

  ButtonModel({this.route, this.text});

  ButtonModel.fromJson(Map<String, dynamic> json) {
    route = json['route'].cast<String>();
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['route'] = this.route;
    data['text'] = this.text;
    return data;
  }
}

class CeramicsList {
  String? title;
  String? imageUrl;
  List<String>? route;
  String? text;

  CeramicsList({this.title, this.imageUrl, this.route, this.text});

  CeramicsList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imageUrl = json['imageUrl'];
    route = json['route'].cast<String>();
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['route'] = this.route;
    data['text'] = this.text;
    return data;
  }
}