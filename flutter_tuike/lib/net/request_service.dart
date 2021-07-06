
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertuike/net/api_manager.dart';

class RequestService {

  factory RequestService() => _instance;
  static RequestService get instance => RequestService();
  static final RequestService _instance = RequestService._();

  static late Dio _dio;

  Dio get dio => _dio;

    RequestService._(){

      final BaseOptions baseOptions = BaseOptions(
        connectTimeout: 15000,
        receiveTimeout: 15000,
        sendTimeout: 10000,
        responseType: ResponseType.plain,
        method: "POST",
//                contentType:"application/json",

        contentType:"text/plain",
        headers: {
          "deviceId" : "",
          "os" : "ios",
          "appMarket" : "AppleRealStore",
//          "Content-Type" : "text/plain",
          "appName" : "ls",
          "platform" : "app",
          "appVer" : "2.0.0",
          "deviceVer" : "Simulator x64[14.3]",
          "User-Agent" : "yi rong tui ke/2.0.0 (iPhone; iOS 14.3; Scale/3.00)",
           "Accept-Language" : "zh-Hans-US;q=1, en;q=0.9",
          },
      );
      _dio = Dio(baseOptions);
    }

  static Future  request(String apiName,{
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {

    Map<String,dynamic> postParm = {
      "sysName":"ls",
      "apiName": apiName,
      "apiVer": "v1",
      "data":queryParameters??"{}"
    };

    RequestService.instance.dio.options.headers["reqTime"] = DateTime.now().millisecondsSinceEpoch;

    print(RequestService.instance.dio.options.headers);

     String jsonStr =   json.encode(postParm);

     // 如果设置加密 请求前数据 AES加密
     if(APIManager.instance.isEncrypt){
        jsonStr = AESEncrypter.encrypter(jsonStr);
     }

    final Response response = await  RequestService.instance.dio.post((APIManager.instance.baseUrl),data:jsonStr);

    try{

      // 如果设置加密 请求后数据 AES解密
      if(APIManager.instance.isEncrypt){
        response.data = AESEncrypter.decrypter(response.data);
      }

      print("\n 请求接口 ===> ${postParm} \n 数据来了====> ${response.data} \n \n");

      Map<String, dynamic> tempResponse = json.decode(response.data) as Map<String, dynamic>;
      return tempResponse["data"];

    }catch(e){
      print("网络请求错误 ${e.toString()} \n 参数:$postParm");
    }



  }






}