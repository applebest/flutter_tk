import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertuike/constant/constant.dart';
import 'package:fluttertuike/extension/text.dart';
import 'package:fluttertuike/page/mine/provider/withdrawal_provider.dart';
import 'package:fluttertuike/page/mine/router/mine_router.dart';
import 'package:fluttertuike/page/mine/widget/withdrawal_alert.dart';
import 'package:fluttertuike/routers/nav.dart';
import 'package:fluttertuike/utils/common_utils.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';


class WithdrawalPage extends StatefulWidget {
  @override
  _WithdrawalPageState createState() => _WithdrawalPageState();
}

class _WithdrawalPageState extends State<WithdrawalPage> {
  WithDrawalProvider provider = WithDrawalProvider();

  TextEditingController _inputController = TextEditingController();
  FocusNode _inputNode = FocusNode();

  double _withdrawableAmount = 454.0;


  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void dispose() {
    super.dispose();
    FocusManager.instance.primaryFocus?.unfocus();
    _inputController.dispose();
    _inputNode.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void initState() {
    super.initState();
    _inputController.addListener(() {
      if (provider.text != _inputController.text) {
        provider.changeText(_inputController.text);
      }
    });
  }

  // 头部
  Widget _titleWidget() {
    return Container(
      color: Colors.white,
      height: 58.5,
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 7.5),
        child: Row(
          children: [
            Text(
              "到账银行卡",
              style: TextStyle(
                fontSize: 13,
                color: Color.fromRGBO(51, 51, 51, 1),
              ),
            ),
            //两者间距10
            SizedBox(
              width: 10,
            ),
            // expanded作用为 占据剩余空间 注: expanded仅仅可在row column内使用
            Expanded(
              child: Text(
                "招商银行（尾号1234）",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromRGBO(153, 153, 153, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 输入框
  Widget _inputTextField() {
//  return  Selector<WithDrawalProvider,String>(
//
//        selector: (_, provider) => provider.text,
//        builder: (_, text, __){
//          print("条件构建");
//         return TextField(
//            textInputAction: TextInputAction.done,
//            keyboardType: TextInputType.numberWithOptions(decimal: true),
//            controller: _inputController,
//            focusNode: _inputNode,
//            decoration: InputDecoration(
//              border: InputBorder.none,
//              suffixIcon:_inputController.text.length > 0 ? IconButton(
//                  onPressed: () => _inputController.clear(),
//                  icon: Icon(Icons.cancel, color: Colors.grey)
//              ):null,
//            ),
//            style: TextStyle(
//              fontSize: 30,
//              fontWeight: FontWeight.bold,
//              color: Color.fromRGBO(51, 51, 51, 1),
//            ),
//          );
//        },
//    );

    Widget textField = TextField(
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      controller: _inputController,
      focusNode: _inputNode,
      onChanged: (str){
        debugPrint(str);
//        str = str.split(",").join("");
//
//        _inputController.text =  TextUtil.formatComma3(str);;
//        _inputController.selection = TextSelection.fromPosition(
//            TextPosition(
//            affinity: TextAffinity.downstream,
//            offset: _inputController.text.length
//            )
//        );

      },

      decoration: InputDecoration(
        border: InputBorder.none,
        // 有值   并且      焦点是激活状态 （ios理解为 是否是第一响应者）
        suffixIcon: _inputController.text.length > 0 && _inputNode.hasFocus
            ? IconButton(
                onPressed: () => _inputController.clear(),
                icon: Icon(Icons.cancel, color: Colors.grey))
            : null,
      ),
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(51, 51, 51, 1),
      ),
    );

    return textField;
  }

  Widget _inputWidget() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "提现金额（元）",
              style: TextStyle(
                color: Color.fromRGBO(51, 51, 51, 1),
                fontSize: 13,
              ),
            ),
            Center(
              child: Row(
                children: [
                  Text("¥",style: TextStyle(fontSize: 23),),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: _inputTextField()),
                ],
              ),
            ),
            Divider(
              height: 1,
            ),
            Container(
              height: 48,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      child: RichText(
                    text: TextSpan(
                        text: "可提现金额",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromRGBO(102, 102, 102, 1)),
                        children: [
                          TextSpan(
                              text: "$_withdrawableAmount元",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromRGBO(51, 51, 51, 1)))
                        ]),
                  )),
                  InkWell(
                    onTap: () {
                      _inputNode.unfocus();
                      provider.changeText(_inputController.text =
                          _withdrawableAmount.toString());
                    },
                    child: Text(
                      "全部提现",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 13, color: Color.fromRGBO(42, 130, 253, 1)),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 44,),

            InkWell(
              onTap: (){
                // 当前激活状态的焦点
//                FocusManager.instance.primaryFocus?.unfocus();
              // 当前焦点实例 输入框的焦点
                _inputNode.unfocus();
                if(double.parse(_inputController.text) > _withdrawableAmount){
                  showToast("提现金额大于可提现金额", duration: Duration(seconds: 1,milliseconds: 500),dismissOtherToast: true);
                }
                showDialog(
                    context: context, builder: (context){
                      return  WithdrawalAlert();
                  },
                  useSafeArea:false,
                  barrierDismissible: false,
                );

              },
              child:    Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _inputController.text.length <= 0
                      ? Color.fromRGBO(192, 192, 192, 1)
                      : Color.fromRGBO(42, 130, 253, 1),
                  borderRadius: BorderRadius.circular(25),
                ),

                  child: Text(
                    "提现",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
              ),
            ),


            Container(
              margin: EdgeInsets.only(top: 69),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "提现规则",
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(153, 153, 164, 1)),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                        "1、单笔提现金额最低为300元（每人每自然月有一次低于300元的提现机会）。\n"
                        "2、每自然月累计最高提现金额3万元，超过3万元以外的金额可于次月提现。\n"
                        "3、发起提现后10分钟内到账，最晚当日到账，如遇长时间未到账情况可于客服联系。\n",
                    style: TextStyle(fontSize: 12,color: Color.fromRGBO(153, 153, 164, 1)),
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _body() {
    Widget content = Column(
      children: [
        _titleWidget(),
        _inputWidget(),
      ],
    );
    if (Platform.isIOS) {
      content = KeyboardActions(
        config: Utils.getKeyboardActionsConfig(context, [_inputNode]),
        child: content,
        //        tapOutsideToDismiss:true ,

        /*
        tip:

        设置tapOutsideToDismiss这个属性会在上层创建一个透明的container影响 输入框的删除按钮点击.
        影响的效果为: 点击删除按钮首先消除这个透明container 再次点击删除按钮 才会响应删除按钮的action,可打开属性查看效果
        为解决该问题 在最后添加GestureDetector 自己实现键盘消失

        思考🤔: 当三方插件影响自己的交互逻辑时，首先看插件内部做了什么，再结合需求看是否有解决方法，灵活多变

        */
      );
    } else {
      content = SingleChildScrollView(
        child: content,
      );
    }

    // 解决设置tapOutsideToDismiss带来的问题
    content = GestureDetector(
      child: content,
      onTap: () => _inputNode.unfocus(),
    );

    return content;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("提现"),
        actions: [
          Center(
            child: InkWell(
              child: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Text("提现记录"),
              ),
              onTap: () => Nav.push(context, MineRouter.withDrawalRecordPage),
            ),
          ),
        ],
      ),
      body: Builder(builder: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (context) => provider,
          child: Consumer<WithDrawalProvider>(builder: (context, model, _) {
            return Container(
              color: Color.fromRGBO(252, 252, 252, 1),
              child: _body(),
            );
          }),
        );
      }),
    );
  }
}
