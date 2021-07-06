

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

extension StringSize on String {

 // 计算文字所需宽度
  double paintWidthWithTextStyle(TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: this, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width;
  }

}

extension StringFormat on String {



  // postion 保留几位小数
  String formatNum(int postion){
    int  commaIndex = this.lastIndexOf(".");
    if(commaIndex != -1){
      // 123123.123       10 - 7 - 1 = 2
      if( ( this.length - commaIndex - 1 ) < postion){
        // 保留x位小数后的字符串
        String  doubleString = double.parse(this).toStringAsFixed(postion);
       return doubleString.substring(0, commaIndex + postion + 1);
      }else{

        return this.substring(0,commaIndex + postion + 1);

      }

    }

    return double.parse(this).toStringAsFixed(postion);
  }


  String  amountComma() {
    if(this == ""){
      return "0.00";
    }

    String commaString  = this.formatNum(2);
    // .号前面的
    String samountStr  = commaString.substring(0,commaString.length - 3);
    print("samountStr $samountStr");
    // .号后面的
    String esmountStr =  commaString.substring(commaString.length - 3);
    print("esmountStr $esmountStr");

    samountStr  = TextUtil.formatComma3(samountStr);



    return (samountStr + esmountStr);
  }



}



