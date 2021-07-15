import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertuike/constant/constant.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';

class MyTeamPage extends StatelessWidget {

  GlobalKey _globalKey = GlobalKey();

  Widget _myCreateTeamWidget() {
    return Container(
      key: _globalKey,
      decoration: BoxDecoration(
        color: Color.fromRGBO(241, 243, 248, 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                "我创建的团队",
                style: TextStyle(
                    fontSize: 15, color: Color.fromRGBO(46, 46, 77, 1)),
              )),
              Text(
                "团队规则",
                style: TextStyle(
                    fontSize: 14, color: Color.fromRGBO(22, 124, 254, 1)),
              ),
              SizedBox(
                width: 7,
              ),
              Icon(
                Icons.question_answer,
                color: Color.fromRGBO(22, 124, 254, 1),
              )
            ],
          ),
          SizedBox(
            height: 2.5,
          ),
          Text(
            "团队成员推单成功，您赚提拥！",
            style: TextStyle(
                fontSize: 12, color: Color.fromRGBO(143, 143, 160, 1)),
          ),
          SizedBox(
            height: 13,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 17.5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4)),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(30, 163, 245, 1),
                    Color.fromRGBO(21, 119, 255, 1)
                  ],
                  begin: Alignment(0, 0.08),
                  end: Alignment(1, 1),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 15, bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        "团队名称",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 6.5,
                      ),
                      Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.5),
                          border: Border.all(width: 0.5, color: Colors.white),
                        ),
                        child: Text(
                          "我是团长",
                          style: TextStyle(color: Colors.white, fontSize: 9),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("编辑名称",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                ),
                Divider(
                  height: 0.5,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 6,
                ),
                Text("团队推单最高提拥",
                    style: TextStyle(color: Colors.white, fontSize: 14)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "20%",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    Spacer(),
                    Container(
                      width: 86,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "招募队员",
                        style: TextStyle(
                            color: Color.fromRGBO(22, 124, 254, 1),
                            fontSize: 14),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _myJoinTeamWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0),
//          gradient: LinearGradient(
//            colors: [
//              Color.fromRGBO(255, 255, 255, 1),
//              Color.fromRGBO(255, 255, 255, 0),
//            ],
////            begin: Alignment(0.5, 0),
////            end: Alignment(0.5, 0.08),
//          ),
//          boxShadow: [
//            BoxShadow(
//              color: Color.fromRGBO(98, 114, 137, 0.15),
//              offset: Offset(0, -1.5),
//              blurRadius: 1,
//            )
//          ]
          ),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 23.5,
          ),
          Text(
            "我加入的团队",
            style:
                TextStyle(fontSize: 15, color: Color.fromRGBO(46, 46, 77, 1)),
          ),
          SizedBox(
            height: 13,
          ),
          Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 17.5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.5,
                ),
                Text("团队名称",style: TextStyle(fontSize: 14,color: Color.fromRGBO(46, 46, 77, 1)),),
                SizedBox(
                  height: 12.5,
                ),
                Row(
                  children: [
                    Text("团长",style: TextStyle(fontSize: 12,color: Color.fromRGBO(143, 143, 160, 1)),),
                    SizedBox(
                      width: 81,
                    ),
                    Text("团对人数（人）",style: TextStyle(fontSize: 12,color: Color.fromRGBO(143, 143, 160, 1)),),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 2.5,
                ),
                Row(
                  children: [
                    Text("王二狗",style: TextStyle(fontSize: 15,color: Color.fromRGBO(46, 46, 77, 1)),),
                    SizedBox(
                      width: 65,
                    ),
                    Text("30",style: TextStyle(fontSize: 15,color: Color.fromRGBO(46, 46, 77, 1)),),
                    Spacer(),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text("我的推单奖励：300.00元",style: TextStyle(fontSize: 12,color: Color.fromRGBO(143, 143, 160, 1)),),
              SizedBox(
                width: 7.5,
              ),
              Icon(Icons.arrow_right,color: Color.fromRGBO(143, 143, 160, 1),),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的团队"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: _globalKey.currentContext?.size?.height ?? 175,
            left:  (Constant.screenSize.width - 30)  / 2,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color:Color.fromRGBO(30, 163, 245, 1),
//                  gradient: LinearGradient(
//                    colors: [
//                      Color.fromRGBO(30, 163, 245, 1),
//                      Color.fromRGBO(21, 119, 255, 1)
//                    ],
//                    begin: Alignment(0, 0.08),
//                    end: Alignment(1, 1),
//                  )
              ),
            ),
          ),

          Container(
            child: Column(
              children: [
                _myCreateTeamWidget(),
                Expanded(child: _myJoinTeamWidget()),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
