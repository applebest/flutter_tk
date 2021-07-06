import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class Utils {



  // 添加键盘toolBar
  static KeyboardActionsConfig getKeyboardActionsConfig(BuildContext context,List<FocusNode> list){

    return KeyboardActionsConfig(
      keyboardBarColor: Colors.white,
      nextFocus: true,
      actions: List.generate(list.length, (index) => KeyboardActionsItem(
          focusNode:list[index],
          toolbarButtons: [
            (node) {
              return GestureDetector(
                onTap: () => node.unfocus() ,
                child: Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Text("关闭"),
                ),
              );
            },
          ],
      ) ),
    );
  }


}