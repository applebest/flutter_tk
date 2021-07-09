
import 'package:flutter/material.dart';
import 'package:fluttertuike/constant/constant.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';
import 'package:oktoast/oktoast.dart';

class ShareWidget extends StatelessWidget {

//  ValueChanged callBack;
//
//  ShareWidget(this.callBack);


  @override
  Widget build(BuildContext context) {


    List<Map<String,String>> elementData = [
      {"icon":"weixin_icon","text":"微信好友"},
      {"icon":"pengyouquan_icon","text":"朋友圈"},
      {"icon":"createPoster","text":"生成海报"},
      {"icon":"copy_url","text":"复制链接"},
    ];

    return Container(
      constraints: BoxConstraints(
        maxHeight: 170
      ),
      child: Column(
        children: [
          SizedBox(height: 27,),
          Container(
            constraints: BoxConstraints(
                maxHeight: 70
            ),
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 1.3,
              crossAxisCount: 4,
              crossAxisSpacing: 0,
              children:List.generate(elementData.length, (index) {
                return GestureDetector(
                  onTap: (){
                    print(index);
//                    Navigator.of(context).pop(index);
                    Navigator.pop(context,index);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LoadAssetImage(elementData[index]["icon"] ?? "",width: 40,height: 40,),
                      Container(
                        height: 20,
                        margin: EdgeInsets.only(top: 5),
                        child: Text(elementData[index]["text"] ?? ""),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 28.5,),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: ()=> Navigator.pop(context),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "取消",
                  style: TextStyle(
                      color: Color.fromRGBO(142, 142, 147, 1),
                      fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,)

        ],
      ),
    );

  }
}
