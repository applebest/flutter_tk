
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  

  const MyAppBar({
    Key? key,
    this.backgroundColor,
    this.title = '',
    this.centerTitle = '',
    this.actionName = '',
    this.backImg = 'assets/images/leftItem.png',
    this.backImgColor,
    this.onPressed,
    this.isBack = true,
    this.isAddBack = true,
    this.style = SystemUiOverlayStyle.dark,
    this.titleFontSize = 18,
  }): super(key: key);


  final Color? backgroundColor;
  final String title;
  final String centerTitle;
  final String backImg;
  final Color? backImgColor;
  final String actionName;
  final VoidCallback? onPressed;
  final bool isBack;
  final bool isAddBack;
  final SystemUiOverlayStyle style;
  final double titleFontSize;



  @override
  Widget build(BuildContext context) {

    final Widget back = isBack ? IconButton(
        onPressed:() async {
          FocusManager.instance.primaryFocus?.unfocus();
          final isBack = await Navigator.maybePop(context);
          if(!isBack){
            await SystemNavigator.pop();
          }
        },
        tooltip:"Back",
        padding: EdgeInsets.all(12),
        icon:Image.asset(
          backImg,
          color: backImgColor ?? (style == SystemUiOverlayStyle.dark ? Color(0xFFB8B8B8) : null),
        )
    ):SizedBox.shrink();

    final Widget action = actionName.isNotEmpty ? Positioned(
      right: 0,
      child: Theme(
        data: Theme.of(context).copyWith(
          buttonTheme: ButtonThemeData(
            padding: EdgeInsets.symmetric(horizontal: 15),
            minWidth: 60,
          )
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(actionName, style: TextStyle(fontSize: 14,color: Colors.black),
          ),
        ),
      )
    ):SizedBox.shrink();


    final Widget titleWidget = Semantics(
      namesRoute: true,
      header: true,
      child: Container(
        alignment: centerTitle.isEmpty ? Alignment.centerLeft : Alignment.center,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 48.0),
        child: Text(
          title.isEmpty ? centerTitle : title,
          style: TextStyle(
            fontSize: titleFontSize,
          ),
        ),
      ),
    );



    return AnnotatedRegion<SystemUiOverlayStyle>(
        child: Material(
          color: backgroundColor,
          child: SafeArea(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                titleWidget,
                back,
                action
              ],
            ),
          ),
        ),
        value: style,
    );
  }





  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(48);
}
