import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertuike/page/mine/router/mine_router.dart';
import 'package:fluttertuike/routers/nav.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';

class AddBankCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("银行卡"),
      ),
      body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: 142.5,),
                LoadAssetImage("bank_card"),
                SizedBox(
                  height: 7.5,
                ),

                Text(
                  "您还没有添加银行卡\n 点击下面按钮去添加吧",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(51, 51, 51, 1),
                  ),
                ),

                SizedBox(
                  height: 27,
                ),
                InkWell(
                  radius: 0,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Nav.push(context, MineRouter.tiedCardPage);
                  } ,
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(42, 130, 253, 1),
                    ),
                    child: Text(
                      "绑定银行卡",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),

              ],
            ),
        ),
    );
  }
}
