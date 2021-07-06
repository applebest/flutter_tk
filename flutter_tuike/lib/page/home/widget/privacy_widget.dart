
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertuike/routers/nav.dart';


// 隐私协议弹框
class PrivacyWidget extends StatefulWidget {

  final Map<String,dynamic> data;

  PrivacyWidget(this.data);

  @override
  _PrivacyWidgetState createState() => _PrivacyWidgetState(data);
}

class _PrivacyWidgetState extends State<PrivacyWidget> {

  final Map<String,dynamic> data;

  _PrivacyWidgetState(this.data);

  bool _checkboxSelected = false;

  @override
  Widget build(BuildContext context) {
    return  Material(
      type: MaterialType.transparency,
      child: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 42),
              child:Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
//                  constraints: BoxConstraints(
//                    minHeight: 300,
//                    maxHeight: 510
//                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 21,),
                      Text("温馨提示",style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                      ),
                      SizedBox(height: 17,),
                      Padding(padding:EdgeInsets.symmetric(horizontal: 32),child:    Text("尊敬的用户：\n恒生活众包新增《恒生活众包隐私政策》，签署隐私政策后立即生效。本次签署进一步明确了我们将如何收集、使用、共享和存储您的个人信息，包括具体的信息类型和使用方式，以更全面、清晰的方式告知您如何管理自己的个人信息及行使您的权利；增加了多项保护个人信息的制度和举措，如安全事件通知、未成年人保护等。请你务必认真阅读全文。",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(136, 136, 136, 1),
                        ),
                      ),),


                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 32),child:Checkbox(value: _checkboxSelected, onChanged:(value){
                            setState(() {
                              _checkboxSelected = value ?? false;
                            });
                          }),),


                          Text.rich(TextSpan(
                              children: [
                                TextSpan(
                                  text: "我已阅读并同意",
                                  style: TextStyle(fontSize: 12,color: Color.fromRGBO(102, 102, 102, 1)),
                                ),
                                TextSpan(
                                  text: "《恒生活众包隐私政策》",
                                  style: TextStyle(fontSize: 12,color: Color.fromRGBO(42, 130, 253, 1)),
                                    recognizer: TapGestureRecognizer()..onTap = (){
                                      Nav.goWebViewPage(context, data["privacyUrl"]);
                                    }
                                ),
                              ]
                          ),
                          )

                        ],
                      ),

                      SizedBox(height: 23,),
                      Divider(height: 1,),
                      Container(
                        height: 50,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(child: TextButton(onPressed: () => Navigator.pop(context) , child: Text("不同意")),),
                            VerticalDivider(width: 1,),
                            Expanded(child: TextButton(onPressed: () => Navigator.pop(context) , child: Text("同意")),),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,)
                    ],
                  ),
                ),
              )
          )
      ),
    );
  }
}




