import 'package:flutter/material.dart';
import 'package:fluttertuike/constant/constant.dart';
import 'package:fluttertuike/page/mine/router/mine_router.dart';
import 'package:fluttertuike/routers/nav.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';
import 'package:fluttertuike/widgets/share.dart';
import 'package:oktoast/oktoast.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {


  List<Map<String,String>> dataList = [
    {"title":"我的订单"},
    {"title":"银行卡"},
    {"title":"在线客服"},
    {"title":"客服电话","phone":"400 004 5959"},
  ];


  _seeClick(){

    print("bottomshow");
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return ShareWidget();
    }).then((value) {
      switch (value){
        case 0:{
          showToast(value.toString());
        }
          break;

        case 1:{
          showToast(value.toString());
        }
          break;
      // 生成海报
        case 2:{
//          showToast(value.toString());
          Nav.push(context, MineRouter.postersPage);
        }

          break;

        case 3:{
          showToast(value.toString());
        }
          break;


        default:
          break;
      }

    });

  }


  Widget _topImageView() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/mine_top.png"),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          Positioned(
            left: 15,
            top: 39.5,
            child: LoadAssetImage("user_icon"),
          ),
          Positioned(
            left: 66.5,
            top: 50,
            child: Text(
              "注册/登录",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
            ),
          ),
          Positioned(
            right: 15.5,
            top: 33.5,
            child:TextButton(
              onPressed: (){
                // Uri.encodeComponent()  对中文编码 fluro不支持直接中文传参 需要编码
                Nav.push(
                    context,
                    "${MineRouter.settingPage}"
                        "?title=${Uri.encodeComponent("我是外部传入的标题")}"
                        "&message=${Uri.encodeComponent("我是外部传入的内容xxx")}"
                );
              },
              child: LoadAssetImage("setting"),
            )
          ),

        ],
      ),
    );
  }

  // 提现
  Widget _withdrawalView() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15, left: 17.5),
                      child: Text(
                        "可提现(元)",
                        style: TextStyle(
                          color: Color.fromRGBO(143, 143, 160, 1),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      height: 49,
                      padding: EdgeInsets.only(top: 5, left: 17.5),
                      child: Text(
                        "******",
                        style: TextStyle(
                          color: Color.fromRGBO(46, 46, 77, 1),
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: EdgeInsets.only(right: 17.5, top: 21),
                child: Container(
                  width: 96,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors:[Color.fromRGBO(30, 163, 245, 1),Color.fromRGBO(21, 119, 255, 1)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => Nav.push(context, MineRouter.withdrawalPage) ,
                    child: Text(
                      "提现",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(250, 251, 252, 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 除了padding 也可以使用sizeBox占据间隙 ,对于row 是横向布局，sizeBox的width就占据了所需间隙
                SizedBox(
                  width: 7.5,
                ),
                // expanded 占据剩余空间
                Expanded(
                    child: Text(
                  "累计收入(元) ***",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(46, 46, 77, 1)),
                )),
                SizedBox(
                  width: 30,
                ),
               // 使用手势处理点击， 使用button会有内边距 布局有影响
               GestureDetector(
                 onTap: _seeClick,
                 child: Text(
                   "查看",
                   style: TextStyle(
                       color: Color.fromRGBO(22, 124, 254, 1), fontSize: 14),
                 ),
               ),
                SizedBox(
                  width: 5,
                ),
                LoadAssetImage("mine_arrow_blue"),
                SizedBox(
                  width: 7.5,
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  // 我的团队
  Widget _teamView() {
    return GestureDetector(
      onTap: () {
        print("我的团队点击");
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), color: Colors.white),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 12.5, left: 17.5),
                  child: Text(
                    "我的团队",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(46, 46, 77, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.5, left: 17.5),
                  child: Text(
                    "团员推单成功，您赚提佣最高20%",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(46, 46, 77, 1),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 17.5),
                alignment: Alignment.centerRight,
                child: LoadAssetImage("mine_arrow"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // listView
  Widget _listView(){

  return  Container(
    height: (55.0 * dataList.length),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: ListView.builder(
        padding:EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        itemCount: dataList.length,
        itemBuilder: (BuildContext context,int index){
          return GestureDetector(
            onTap: (){
              print("${dataList[index]["title"]} 点击");
            },
            child: Container(
              height: 55,
              child: Row(
                children: [
                  SizedBox(width: 17.5,),
                  Expanded(
                    child: Text(
                      dataList[index]["title"]?? "",
                      style: TextStyle(
                          color: Color.fromRGBO(46, 46, 77, 1),
                          fontSize: 14
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded
                    (child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 17.5),
                      child: dataList[index]["phone"] == null ?
                      LoadAssetImage("mine_arrow") :
                      Text(
                          dataList[index]["phone"]!,
                          style: TextStyle(
                            color: Color.fromRGBO(22, 124, 254, 1),
                            fontSize: 14
                          ),
                      )
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );

  }


  // 定位布局
  Widget _stack() {

    final p1 = Positioned(
    top: 0,
    left: 0,
    right: 0,
    height: 173,
    child: _topImageView(),
    );
     double maxH =  (p1.top ?? 0) + (p1.height ?? 0) ;


    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 173,
          child: _topImageView(),
        ),
        Positioned(
          top: 95,
          left: 15,
          right: 15,
          height: 135.5,
          child: _withdrawalView(),
        ),
        Positioned(
          top: 245.5,
          left: 15,
          right: 15,
          height: 66,
          child: _teamView(),
        ),


        Positioned(
          top: 326.5,
          left: 15,
          right: 15,
          height: 220,
          child: _listView(),
        ),

        if((576.5 + 84) < Constant.screenSize.height)
        Positioned(
//          top: 576.5,
            bottom: 49 + 64,
            height: 84,
            left: 15,
            right: 15,
            child:Container(
              child: LoadAssetImage("appIcon_placeholder_gray"),
            )
        )
    else
          Positioned(
              top: 576.5,
              height: 84,
              left: 15,
              right: 15,
              child:Container(
                child: LoadAssetImage("appIcon_placeholder_gray"),
              )
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(241, 243, 248, 1),
        body: SingleChildScrollView(
            child: Container(
          width: Constant.screenSize.width,
          height: Constant.screenSize.height,
          child: _stack(),
        )),
      ),
    );
  }
}
