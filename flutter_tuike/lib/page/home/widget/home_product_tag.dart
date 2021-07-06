
import 'package:flutter/material.dart';
import 'package:fluttertuike/Extension/text.dart';

class HomeProductTagView extends StatelessWidget {


  final List<String>? tag;
  
  HomeProductTagView(this.tag);

  Widget _tagWidget(String title){


    return  Container(
      width: (title)
          .paintWidthWithTextStyle(TextStyle(
        fontSize: 10,
        color: Color.fromRGBO(245, 166, 35, 1),
      )) +
          10,
      height: 20,
      margin: EdgeInsets.only(right: 15),
      decoration: new BoxDecoration(
          border: new Border.all(
              color: Color.fromRGBO(248, 194, 105, 0.65),
              width: 0.5),
          color: Color.fromRGBO(254, 248, 235, 1),
          borderRadius: new BorderRadius.circular((1.0))),
      alignment: Alignment.center,
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 10,
          color: Color.fromRGBO(245, 166, 35, 1),
        ),
      ),
    );

  }

  
  @override
  Widget build(BuildContext context) {


    if(tag!.length > 1){

      return Container(
        height: 20,
        child: Row(
          children:[
            Expanded(child: _tagWidget(tag![0])),
            SizedBox(width: 10,),
            Expanded(child: _tagWidget(tag![1])),
          ],
        ),
      );

    }else{
      return _tagWidget(tag!.first);
    }

  }
}
