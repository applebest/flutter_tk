
import 'package:flutter/material.dart';
import 'package:fluttertuike/page/home/model/notice_list_model.dart';

class NoticeItem  extends StatelessWidget {


  final noticeModel model;

  NoticeItem(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Text(
                    model.noticeTitle ?? "",
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                  ),
              ),
              SizedBox(width: 20,),
              Text(
                model.startDisplayDateStr ?? "",
                style: TextStyle(
                  fontSize: 11,
                  color: Color.fromRGBO(153, 153, 153, 1),
                ),
              )
            ],
          ),
          SizedBox(height: 8,),
          Container(
            padding: EdgeInsets.only(bottom: 18.5),
            child: Text(
              model.noticeContent ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(153, 153, 153, 1),
              ),
            ),
          ),
          Container(
            height: 10,
            color: Color.fromRGBO(252, 252, 252, 1),
          )
        ],
      ),

    );
  }
}
