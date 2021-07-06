
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:fluttertuike/page/home/model/home_model.dart';
import 'package:fluttertuike/page/home/router/home_router.dart';
import 'package:fluttertuike/routers/nav.dart';
import 'package:fluttertuike/routers/routers.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';


class NoticeWidget extends StatelessWidget {

  final List<NoticeList> noticeList;

  NoticeWidget(this.noticeList);

  @override
  Widget build(BuildContext context) {

    if(noticeList.length == 0){
      return SizedBox.shrink();
    }

    return Container(
      height: 35.5,
      padding: EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 7.5,),
          LoadAssetImage("home_notice"),
          SizedBox(width: 7.5,),
          Expanded(
              child: Swiper(
                scrollDirection: Axis.vertical,
                itemCount: noticeList.length > 3 ? 3 : noticeList.length,
                itemBuilder: (context,index){
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      noticeList[index].noticeTitle ?? "" ,
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(46, 46, 77, 1)
                      ),
                    ),
                  );
                },
                onTap: (int index){
                  Nav.push(context, HomeRouter.noticeList);
                },
              ),
          )
        ],
      ),
    );
  }
}
