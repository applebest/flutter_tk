
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertuike/widget_chain/widget_chain.dart';
import 'package:oktoast/oktoast.dart';

// 使用对widget拓展 解决flutter嵌套问题方案（并不是最优解）

class WithDrawalRecordPage extends StatefulWidget {
  @override
  _WithDrawalRecordPageState createState() => _WithDrawalRecordPageState();
}

class _WithDrawalRecordPageState extends State<WithDrawalRecordPage> {



  List<Map<String,String>> _dataSource = [

    {"title":"提现",
      "value":"提现成功",
      "subTitle":"100,000元",
      "subValue":"2021-01-11 11:11"
    },

    {"title":"不提现",
      "value":"提现over",
      "subTitle":"0元",
      "subValue":"2021-02-22 22:22"
    },

    {"title":"大大大",
      "value":"小小小",
      "subTitle":"到底大",
      "subValue":"还是小"
    },

    {"title":"打扫房间看",
      "value":"1234311",
      "subTitle":"都是覅金",
      "subValue":"214885i55"
    },

  ];

  /*
    链式调用包装widget 本质上就是自己调用自己并返回自己  理解为递归
    每次在外部包装一个widget并返回新的widget，新的widget可以继续进行包装
    布局理解:
     flutter嵌套形式：从大面看小面(由外向内 布局)  container->container->Column->container->row->text
     优势：编译器有开头和结尾的提示，好理解
     不足：嵌套明显，要多次拆分,影响代码体验与布局体验

     WidgetChain形式：从小面看大面（由内向外 布局）text->row->container->Column->container->container
     WidgetChain形式是与之相反的布局逻辑 从小包大 ，自己外面需要用什么布局组件即链式调用外部包装组件进行包装自身
     优势：局部解决嵌套问题 ，提升代码布局体验
     不足：需理解布局思想，从小结构到整体的包装，由细到粗（邪恶了😈）
          编译器不会提示布局的开头与结尾，在没有放入column或row内时不能先定义expanded组件

          例 WidgetChain.addNeighbor(Text(data["title"]?? "",textAlign: TextAlign.left,)).intoExpanded()
          这样定义调试台会报错，不影响效果
  */
  Widget _buildItem(Map<String,String> data) {

    Widget row1Text = WidgetChain
                      .addNeighbor(Text(data["title"]?? "",textAlign: TextAlign.left,));

    Widget row1value = WidgetChain
                      .addNeighbor(Text(data["value"]?? "",textAlign: TextAlign.right,));

    Widget row1 = [row1Text.intoExpanded(), row1value.intoExpanded()].intoRow();

    Widget row2Date = WidgetChain
        .addNeighbor(Text(data["subTitle"]?? "",textAlign: TextAlign.left,));

    Widget row2value =
        WidgetChain.addNeighbor(Text(data["subValue"]?? "",textAlign: TextAlign.right));

    Widget row2 = [row2Date.intoExpanded(), row2value.intoExpanded()].intoRow();

    return [row1, SizedBox(height: 2,), row2]
            .intoColumn(mainAxisAlignment: MainAxisAlignment.center)
            .intoContainer(height: 70,color: Colors.white)
            .intoInkWell(onTap: ()=> showToast(data.toString()))
            .intoContainer(
              height: 85,
              color: Color.fromRGBO(252, 252, 252, 1),
              padding: EdgeInsets.only(top: 15, left: 15, right: 15),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提现记录"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(_dataSource[index]);
        },
        itemCount: _dataSource.length,
      ).intoContainer(color: Color.fromRGBO(252, 252, 252, 1),)
    );
  }
}
