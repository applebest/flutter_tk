



import 'dart:convert';

import 'package:encrypt/encrypt.dart' as Encrypt;
import 'package:flutter/material.dart';

enum EnvironmentType {
  online,
  test,
  prepare

}



class APIManager{


  final  String LS_iv = "lsm-api-iv-param";

  EnvironmentType _type = EnvironmentType.test;
  EnvironmentType get type => _type;

  bool _isEncrypt = false; // 是否加密
  bool get isEncrypt => _isEncrypt;


  String  _baseUrl = "";
  String get baseUrl => _baseUrl;

  String _encryptKey = "";
  String get encryptKey => _encryptKey;

  String _decryptKey = "";
  String get decryptKey => _decryptKey;



  factory APIManager() => _singleton;
  static final APIManager  _singleton = APIManager._();
  static APIManager get instance => APIManager();

  APIManager._(){

    // 测试环境路径
    if(_type == EnvironmentType.test){
      _baseUrl = "http://10.150.30.114:8090/ls-api";
      _encryptKey = "X*ValYLqZkbtc56f";
      _decryptKey = "X*ValYLqZkbtc56f";
    }
    // 发布环境路径
    else if(_type == EnvironmentType.online){
      _baseUrl =  "https://salesman.yirongtk.com/ls-api";
      _encryptKey = "AH!#6U1TCVTXFtYt";
      _decryptKey = "AH!#6U1TCVTXFtYt";
    }

  }

}

class AESEncrypter {


  static String encrypter(String json){


    final key  = Encrypt.Key.fromUtf8(APIManager.instance.encryptKey);
    final iv = Encrypt.IV.fromUtf8(APIManager.instance.LS_iv);

    final encrypter =  Encrypt.Encrypter(
        Encrypt.AES(
          key,
          mode: Encrypt.AESMode.cbc,
        )
    );
    
    final encrypt = encrypter.encrypt(json,iv: iv);

    return encrypt.base64;
  }


  static String decrypter(String json){

    try{
      final key  = Encrypt.Key.fromUtf8(APIManager.instance.decryptKey);
      final iv = Encrypt.IV.fromUtf8(APIManager.instance.LS_iv);

      final decrypter =  Encrypt.Encrypter(
          Encrypt.AES(
            key,
            mode: Encrypt.AESMode.cbc,
          )
      );

      String str = decrypter.decrypt64(json,iv: iv);

       debugPrint("解密后 == $str");
      return str;

    }catch(error){
      debugPrint("解密错误 ${error.toString()}");
      return json;
    }



  }





}

