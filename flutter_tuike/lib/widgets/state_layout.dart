import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';

class StateLayout extends StatelessWidget {
  const StateLayout(
      {Key? key, required this.type, required this.onPressed, this.hintText})
      : super(key: key);

  final VoidCallback onPressed;
  final StateType type;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (type == StateType.loading)
          CupertinoActivityIndicator(
            radius: 16.0,
          )
        else if (type != StateType.empty)
          Opacity(
            opacity: 1.0,
            child: LoadAssetImage(
              type.img,
            ),
          ),
        SizedBox(
          width: double.infinity,
          height: 7,
        ),
        Text(
          type.hintText,
          style:
              TextStyle(color: Color.fromRGBO(102, 102, 102, 1), fontSize: 14),
        ),

        if (type != StateType.loading && type != StateType.empty)
        SizedBox(
          width: double.infinity,
          height: 27.5,
        ),
        if (type != StateType.loading && type != StateType.empty)
          Container(
          alignment: Alignment.center,
          width: 120,
          height: 40,
          decoration: BoxDecoration(
            color: Color.fromRGBO(42, 130, 253, 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              "重新加载",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        )
      ],
    );
  }
}

enum StateType {
  /// 无网络
  network,
  // 无数据
  emptyData,
  // 服务器走丢了
  noService,
  // 加载中
  loading,

  /// 空
  empty
}

extension StateTypeExtension on StateType {
  String get img => <String>["nonetwork", "nodata", "noservice", "", ""][index];

  String get hintText => <String>[
        "( ⊙ o ⊙ )啊！网络不太顺畅哦~",
        "暂无数据",
        "( ⊙ o ⊙ )啊！服务器走丢了~"
            "",
        ""
      ][index];
}
