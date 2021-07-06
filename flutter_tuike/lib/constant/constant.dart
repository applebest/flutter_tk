
import 'package:flutter/material.dart';
import 'package:fluttertuike/net/api_manager.dart';

class Constant {

   static  Size screenSize = Size.zero;

   static  String customerURL = APIManager.instance.type == EnvironmentType.test ?
   "http://testevent.hengyirong.com/tk/client/index":"https://tuike.yirongtk.com/client/index";



}