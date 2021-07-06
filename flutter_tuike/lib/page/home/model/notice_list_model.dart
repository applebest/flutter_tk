/// list : [{"readStatus":0,"noticeId":75,"noticeImg":"http://testrgw.hengchang6.com/tuikeshipin/announcement/2020111714071013896113.jpg","createTimeStr":"","noticeImgs":[],"noticeContent":"热热热法儿是儿女","noticeTitle":"S3图片测试","startDisplayDateStr":"2020年-09月-29日"}]
/// pageTotal : 1
/// totalCount : 1
/// pageNum : 1

class NoticeListModel {
  List<noticeModel>? list;
  int? pageTotal;
  int? totalCount;
  int? pageNum;



  NoticeListModel({
      List<noticeModel>? list,
      int? pageTotal, 
      int? totalCount, 
      int? pageNum}){
    list = list;
    pageTotal = pageTotal;
    totalCount = totalCount;
    pageNum = pageNum;
}

  NoticeListModel.fromJson(dynamic json) {
    if (json["list"] != null) {
      list = [];
      json["list"].forEach((v) {
        list?.add(noticeModel.fromJson(v));
      });
    }
    pageTotal = json["pageTotal"];
    totalCount = json["totalCount"];
    pageNum = json["pageNum"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (list != null) {
      map["list"] = list?.map((v) => v.toJson()).toList();
    }
    map["pageTotal"] = pageTotal;
    map["totalCount"] = totalCount;
    map["pageNum"] = pageNum;
    return map;
  }

}

/// readStatus : 0
/// noticeId : 75
/// noticeImg : "http://testrgw.hengchang6.com/tuikeshipin/announcement/2020111714071013896113.jpg"
/// createTimeStr : ""
/// noticeImgs : []
/// noticeContent : "热热热法儿是儿女"
/// noticeTitle : "S3图片测试"
/// startDisplayDateStr : "2020年-09月-29日"

class noticeModel {
  int? _readStatus;
  int? _noticeId;
  String? _noticeImg;
  String? _createTimeStr;
  String? _noticeContent;
  String? _noticeTitle;
  String? _startDisplayDateStr;

  int? get readStatus => _readStatus;
  int? get noticeId => _noticeId;
  String? get noticeImg => _noticeImg;
  String? get createTimeStr => _createTimeStr;
  String? get noticeContent => _noticeContent;
  String? get noticeTitle => _noticeTitle;
  String? get startDisplayDateStr => _startDisplayDateStr;

  noticeModel({
      int? readStatus, 
      int? noticeId, 
      String? noticeImg, 
      String? createTimeStr, 
      List<dynamic>? noticeImgs, 
      String? noticeContent, 
      String? noticeTitle, 
      String? startDisplayDateStr}){
    _readStatus = readStatus;
    _noticeId = noticeId;
    _noticeImg = noticeImg;
    _createTimeStr = createTimeStr;
    _noticeContent = noticeContent;
    _noticeTitle = noticeTitle;
    _startDisplayDateStr = startDisplayDateStr;
}

  noticeModel.fromJson(dynamic json) {
    _readStatus = json["readStatus"];
    _noticeId = json["noticeId"];
    _noticeImg = json["noticeImg"];
    _createTimeStr = json["createTimeStr"];

    _noticeContent = json["noticeContent"];
    _noticeTitle = json["noticeTitle"];
    _startDisplayDateStr = json["startDisplayDateStr"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["readStatus"] = _readStatus;
    map["noticeId"] = _noticeId;
    map["noticeImg"] = _noticeImg;
    map["createTimeStr"] = _createTimeStr;
    map["noticeContent"] = _noticeContent;
    map["noticeTitle"] = _noticeTitle;
    map["startDisplayDateStr"] = _startDisplayDateStr;
    return map;
  }

}