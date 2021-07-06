
import 'package:flutter/material.dart';

class WithDrawalProvider extends ChangeNotifier{

  String _text  = "";
  String get text => _text;


  void changeText(String text){
    _text = text;
    notifyListeners();
  }

}