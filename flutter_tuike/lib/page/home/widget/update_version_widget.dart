

import 'package:flutter/material.dart';
import 'package:fluttertuike/constant/constant.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';

class UpdateVersionWidget extends StatelessWidget {

  final Map<String,dynamic>  versionData;

  UpdateVersionWidget(this.versionData);

  @override
  Widget build(BuildContext context) {
    return  Material(
      type: MaterialType.transparency,
      child: Center(
          child:Container(
            width: Constant.screenSize.width -  84,
            height: 345,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
//                SizedBox(height: 15.5,),
                LoadAssetImage("upataTopImg"),
                SizedBox(height: 6.5,),
                Text(
                    "发现新版本",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromRGBO(51, 51, 51, 1),
                  ),
                ),
                SizedBox(height:10,),

                Padding(padding: EdgeInsets.symmetric(horizontal: 32),
                  child:Text(
                  versionData["upgradeTitle"],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: SingleChildScrollView(
                    child: Text(
                      versionData["releaseInfo"],
                      style: TextStyle(
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontSize: 13,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),

                SizedBox(height:19.5,),
                GestureDetector(
                  onTap:() => Navigator.pop(context),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 19.5),
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(42, 130, 253, 1),
                    ),
                    child:Text("立即更新",style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(height:5,),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child:Text("下次再说",
                    style:TextStyle(
                      fontSize: 13,
                      color: Color.fromRGBO(153, 153, 153, 1),
                    ),
                    )
                )


              ],
            ),
          )
      ),
    );
  }
}
