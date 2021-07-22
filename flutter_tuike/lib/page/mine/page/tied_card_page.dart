import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertuike/routers/nav.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';
import 'package:oktoast/oktoast.dart';

class StateImageWidget extends StatefulWidget {
  final String seelctedImage;
  final String normalImage;

  bool isSelected = false;
  final ValueChanged<bool> selected;

  StateImageWidget(this.seelctedImage, this.normalImage, this.isSelected,{required this.selected});

  @override
  _StateImageWidgetState createState() => _StateImageWidgetState();
}

class _StateImageWidgetState extends State<StateImageWidget> {
  @override
  Widget build(BuildContext context) {
    print(this.runtimeType.toString());
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
          widget.selected(widget.isSelected);
        });
      },
      child: LoadAssetImage(
          widget.isSelected ? widget.seelctedImage : widget.normalImage,
        width: 25,
        height: 25,
      ),
    );
  }
}

class SelectedBtn extends StatefulWidget {
  bool isSelected = false;

  final VoidCallback onTap;

  SelectedBtn({Key? key, required this.onTap}):super(key: key);

  @override
  _SelectedBtnState createState() => _SelectedBtnState();
}

class _SelectedBtnState extends State<SelectedBtn> {
  @override
  Widget build(BuildContext context) {
    print("类${this.runtimeType.toString()}, 选中${widget.isSelected}");
    return GestureDetector(
      onTap: (){
        if(widget.isSelected){
          widget.onTap.call();
        }
      },
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: widget.isSelected ? Color.fromRGBO(42, 130, 253, 1):Color.fromRGBO(192, 192, 192, 1),
        ),
        child: Text("确认",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}



class TiedAgreementWidget extends StatelessWidget {
  bool isSelected = false;
  final ValueChanged<bool> selected;

  TiedAgreementWidget({Key? key, required this.selected}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Row(
        children: [
          StateImageWidget("selected_s", "selected_n", isSelected ,selected:(value){
            this.isSelected = value;
            selected(value);
          },),
          SizedBox(
            width: 7.5,
          ),
          Expanded(
              child: Text.rich(
            TextSpan(children: [
              TextSpan(
                text: "我已阅读并同意",
                style: TextStyle(
                    fontSize: 12, color: Color.fromRGBO(102, 102, 102, 1)),
              ),
              TextSpan(
                  text: "《xx服务协议》",
                  style: TextStyle(
                      fontSize: 12, color: Color.fromRGBO(42, 130, 253, 1)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Nav.goWebViewPage(context, "https://www.sina.com.cn");
                    }),
            ]),
          )),
        ],
      ),
    );
  }
}

class TiedCardItem extends StatefulWidget {
  final String title;
  final String placeholder;
  final TextEditingController textController;

  TiedCardItem(this.title, this.placeholder, this.textController);

  @override
  _TiedCardItemState createState() => _TiedCardItemState();
}

class _TiedCardItemState extends State<TiedCardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 0.5,
        color: Color.fromRGBO(237, 237, 237, 1),
      ))),
      height: 60,
      child: Row(
        children: [
          Container(
            width: 65,
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(51, 51, 51, 1),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: TextField(
            controller: widget.textController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.placeholder,
                hintStyle: TextStyle(
                  color: Color.fromRGBO(153, 153, 153, 1),
                )),
            style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(51, 51, 51, 1),
            ),
          )),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

class TiedCardPage extends StatefulWidget {
  @override
  _TiedCardPageState createState() => _TiedCardPageState();
}

class _TiedCardPageState extends State<TiedCardPage> {
  List<String> _columnPlaceholderArr = [
    "请输入开户姓名",
    "请输入身份证号",
    "请输入银行卡号",
    "请输入开户行预留手机号"
  ];

  List<String> _columnTextArr = ["姓名", "身份证号", "银行卡号", "手机号"];

  List<TextEditingController> _textControllers = [];

  GlobalKey _tiedAgreementKey = GlobalKey();
  GlobalKey _btnKey = GlobalKey();


    @override
      void initState() {
        super.initState();
        for (int i = 0; i < _columnTextArr.length; i++) {
          TextEditingController controller = TextEditingController()
            ..addListener((){
              _textEditChange();
            });

          _textControllers.add(controller);


        }
      }

      void _textEditChange(){

        bool isLength = true;
        int  checkIndex = -1;
        for (TextEditingController controller in _textControllers) {
          checkIndex ++;
          if(controller.text.length == 0){
              isLength = false;
              break;
          }

        }

        TiedAgreementWidget tempWidget = _tiedAgreementKey.currentWidget as TiedAgreementWidget;

        if(tempWidget.isSelected && isLength){
          _updateBtn(true);
        }else{
          _updateBtn(false);
        }



      }

      _confirm(){

      // 键盘消失
      FocusManager.instance.primaryFocus?.unfocus();

        print("确定点击");
      }


    _updateBtn(bool selected){
      SelectedBtn widget =  _btnKey.currentWidget as SelectedBtn;
      // 减少重置状态
      if(widget.isSelected == selected){return;}
      widget.isSelected = selected;
      if(_btnKey.currentState != null){
        _btnKey.currentState!.setState(() {
        });
      }

    }


  List<Widget> _inputItems() {
    List<Widget> widgets = [];
    List<Widget> inputWidgets = [];
    for (int i = 0; i < _columnTextArr.length; i++) {
      inputWidgets.add(TiedCardItem(
          _columnTextArr[i], _columnPlaceholderArr[i], _textControllers[i]));
    }


    widgets.addAll(inputWidgets);


    List<Widget> bottomWidgets = [
      SizedBox(
        height: 15,
      ),
      TiedAgreementWidget(
        key: _tiedAgreementKey,
      selected: (selected){
          print(selected);
          _textEditChange();
        // 这个回调是在选中反选时调用， 通过GlobalKey 获取widget 绑定selected的状态重新setState
        // 这里这样做的目的是减少整体粒度的重绘，只做状态绑定的重绘（对于widget较多的页面拆分widget减少重绘）
//         SelectedBtn widget =  _btnKey.currentWidget as SelectedBtn;
//         widget.isSelected = selected;
//         if(_btnKey.currentState != null){
//            _btnKey.currentState!.setState(() {
//            });
//         }
        }
      ),
      SizedBox(height: 25,),
      SelectedBtn(
        key: _btnKey,
        onTap:_confirm,
      )
    ];

    widgets.addAll(bottomWidgets);


    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    print(this.runtimeType.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("实名绑卡认证"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: _inputItems(),
        ),
      ),
    );
  }
}
