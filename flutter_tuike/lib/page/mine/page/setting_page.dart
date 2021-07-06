
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertuike/page/mine/router/mine_router.dart';
import 'package:fluttertuike/routers/nav.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';


class SettingPage extends StatelessWidget {



  final String? title;
  final String? message;

  SettingPage(this.title,this.message);


  Widget row(String text, {required GestureTapCallback tap, bool isAddLine = true}){


    return InkWell(
      onTap: tap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15) ,
        height: 54.5,
        child:  Column(
          children: [
            Expanded(child:  Row(
              children: [
                Expanded(child: Text(text,style: TextStyle(fontSize: 14,color: Color.fromRGBO(51, 51, 51, 1)),),),
                LoadAssetImage("mine_arrow"),
              ],
            )),
            Divider(height: 0.5,),
          ],
        ),
      ),
    );

  }


  _showAlert(BuildContext context){

    showCupertinoDialog(

        context: context, builder: (context){
      return CupertinoAlertDialog(
        title: Text( title ?? "注销账户",style: TextStyle(fontSize: 18,color: Colors.black),),
        content:Text(
          message ?? "注销账户后将永久无法使用该帐户登录易融推客，请谨慎操作。",
          style: TextStyle(
            fontSize: 15,
            color: Color.fromRGBO(136, 136, 136, 1),
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: Text("取消",style: TextStyle(fontSize: 18,color: Colors.black),),
              onPressed: ()=>  Navigator.pop(context),
          ),

          CupertinoDialogAction(
            child: Text("确认",style: TextStyle(fontSize: 18,color: Color.fromRGBO(42, 130, 253, 1)),),
            onPressed: ()=>  Navigator.pop(context),
          ),

        ],

      );
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("隐私及设置") ,
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              // AlwaysScrollableScrollPhysics 始终响应滚动
              //  BouncingScrollPhysics ：允许滚动超出边界，但之后内容会反弹回来。
              //  ClampingScrollPhysics ： 防止滚动超出边界，夹住 。
              //  NeverScrollableScrollPhysics ：不响应用户的滚动。
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(height: 15,color: Color.fromRGBO(252, 252, 252, 1),),
                  row("隐私及设置",tap: ()=> Nav.push(context, MineRouter.privacySettingPage) ),
                  row("注销",
                      isAddLine: false,
                      tap: ()=> _showAlert(context),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 120,
                  child: OutlinedButton(
                    onPressed: () => print("退出"),
                    child: Text("退出",style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1)),),
                    style: ButtonStyle(
                      shape:MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
