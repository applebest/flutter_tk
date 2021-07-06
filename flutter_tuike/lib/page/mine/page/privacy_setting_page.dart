import 'package:flutter/material.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';


class PrivacySettingPage extends StatelessWidget {


  List <Map<String,dynamic>> _dataSource = [
    {
      "section":"系统权限",
      "rows": ["允许易融推客访问存储空间权限","允许易融推客访问手机状态权限"],
    },
    {
      "section":"隐私协议",
      "rows": ["查看用户协议及隐私政策"],
    },

  ];


  Widget _sectionRow(String section,List<String> rows){

    final Color black51 = Color.fromRGBO(51, 51, 51, 1);
    List<Widget> widgets = [];

   final Widget sectionView =  Container(
     height: 45,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text(section ,style: TextStyle(fontSize: 14,color:black51 ,fontWeight: FontWeight.bold ),)
        ],
      ),
    );

   widgets.add(sectionView);

    for (int i = 0; i < rows.length; i++){
        final String text = rows[i];
        Widget row  = InkWell(
          onTap: ()=> print("点击了$text"),
          child: Container(
            height: 54.5,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Expanded(child: Row(
                  children: [
                    Expanded(
                      child:Text(
                        text,
                        style: TextStyle(fontSize: 14,color: black51),
                      ),
                    ),
                    LoadAssetImage("mine_arrow"),
                  ],
                ),),
                Divider(height: 0.5,),
              ],
            ),
          ),
        );
        widgets.add(row);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:widgets,
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("隐私及设置"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(itemBuilder: (BuildContext context, int index){
          String section = _dataSource[index]["section"];
          List<String> rows = _dataSource[index]["rows"];
          return _sectionRow(section, rows);
          },
          itemCount: _dataSource.length,
        ),
      ),

    );
  }
}
