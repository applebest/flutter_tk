
import 'package:flutter/material.dart';




////方案1 使用provider 跨页面改变tabBar选中的下标
//class RootProvider extends ChangeNotifier {
//
//  int index = 0;
//
//  void changeIndex(int newIndex){
//    index = newIndex;
//    print("change");
//    notifyListeners();
//  }
//
//}


class RootProvider extends RestorableInt{
  RootProvider():super(0);
}