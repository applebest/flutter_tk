import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertuike/constant/constant.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';
import 'package:oktoast/oktoast.dart';

class WithdrawalAlert extends StatefulWidget {
  @override
  _WithdrawalAlertState createState() => _WithdrawalAlertState();
}

class _WithdrawalAlertState extends State<WithdrawalAlert> {
  bool _isShowError = false;

  TextEditingController _controller = TextEditingController();
  FocusNode _node = FocusNode();

  Timer? _timer;

  int _count = 10;

  String _buttonText = "获取验证码";

  _cancelTimer() {
    if (_timer != null) {
      if (_timer!.isActive) {
        _timer!.cancel();
        _timer = null;
      }
    }
  }

  _countDown() {


   FocusScope.of(context).requestFocus(_node);
    /*
     模拟获取网络接口数据后 倒计时
    */
    Future.delayed(Duration(milliseconds: 500), () {
      _cancelTimer();

      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (_count == 0) {
          timer.cancel();
          _count = 10;
          _buttonText = "重新获取";
        } else {
          _buttonText = "重新获取${_count.toString()}s";
          _count--;
        }
        setState(() {});
      });
    });
  }

  _confirm() {
    _node.unfocus();

    if(_controller.text.length != 6){
      showToast("验证码不足6位",context: context);
      return;
    }

    // 模拟网络提交  _controller.text 就是输入的验证码
    Future.delayed(Duration(milliseconds: 500), () {
      int randomValue =   Random().nextInt(2);
      print(randomValue);
      if(randomValue == 1){
        _isShowError = true;
        setState(() {});
        return;
      }

      showToast("提现确认", onDismiss: () => Navigator.pop(context));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _node.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _node.unfocus(),
      child: Container(
        width: Constant.screenSize.width,
        height: Constant.screenSize.height,
        color: Colors.transparent,
        child: Material(
          type: MaterialType.transparency,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 41.5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 21,
                    ),
                    Container(
                      height: 20,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Text(
                              "提现",
                              textAlign: TextAlign.center,
                            ),
                            left: 0,
                            right: 0,
                            top: 0,
                            height: 20,
                          ),
                          Positioned(
                            child: InkWell(
                              onTap: () {
                                _node.unfocus();
                                Navigator.pop(context);
                              },
                              child: LoadAssetImage("withdrawal_close"),
                            ),
                            right: 25.5,
                            top: 0,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 28),
                        padding: EdgeInsets.symmetric(horizontal: 9.5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 0.5,
                                              color: Color.fromRGBO(
                                                  237, 237, 237, 1)))),
                                  padding: EdgeInsets.only(left: 22, right: 22),
                                  height: 60,
                                  child: Text("12333333"),
                                )),
                              ],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 0.5,
                                          color: _isShowError
                                              ? Colors.red
                                              : Color.fromRGBO(
                                                  237, 237, 237, 1)))),
                              padding: EdgeInsets.only(left: 22, right: 22),
                              height: 60,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: TextField(
                                    maxLength: 6,
                                    keyboardType: TextInputType.number,
                                    focusNode: _node,
                                    controller: _controller,
                                    decoration: InputDecoration(
                                        counterText: "", // 去掉最大输入字数提示
                                        hintText: "请输入验证码",
                                        border: InputBorder.none),
                                  )),
                                  Container(
                                    height: 14.5,
                                    width: 0.5,
                                    color: Color.fromRGBO(219, 219, 219, 1),
                                  ),
                                  SizedBox(
                                    width: 14.5,
                                  ),
                                  CupertinoButton(
                                      child: Text(_buttonText),
                                      onPressed: _countDown)
                                ],
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20.5),
                      child: Visibility(
                          visible: _isShowError,
                          child: Text(
                            "验证码错误",
                            style: TextStyle(color: Colors.red),
                          )),
                    ),
                    SizedBox(
                      height: 16.5,
                    ),


                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.5),
                      child: CupertinoButton(
                        onPressed: _confirm,
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(42, 130, 253, 1),
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            "确认",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),

//
//                    InkWell(
//                      onTap: _confirm,
//                      child:        Container(
//                        width: double.infinity,
//                        height: 50,
//                        alignment: Alignment.center,
//                        margin: EdgeInsets.symmetric(horizontal: 20.5),
//                        decoration: BoxDecoration(
//                            color: Color.fromRGBO(42, 130, 253, 1),
//                            borderRadius: BorderRadius.circular(25)),
//                        child: Text(
//                          "确认",
//                          style: TextStyle(color: Colors.white, fontSize: 15),
//                        ),
//                      ),
//                    ),

//                    Container(
//                      width: double.infinity,
//                      height: 50,
//                      alignment: Alignment.center,
//                      margin: EdgeInsets.symmetric(horizontal: 20.5),
//                      decoration: BoxDecoration(
//                          color: Color.fromRGBO(42, 130, 253, 1),
//                          borderRadius: BorderRadius.circular(25)),
//                      child: CupertinoButton(
//                        onPressed: _confirm,
//                        child: Text(
//                          "确认",
//                          style: TextStyle(color: Colors.white, fontSize: 15),
//                        ),
//                      ),
//                    ),
                    SizedBox(
                      height: 30.5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
