
import 'package:flutter/material.dart';
import 'package:fluttertuike/widgets/state_layout.dart';


class NotFoundPage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("页面不存在"),
      ),
      body: StateLayout(
        type: StateType.empty,
        onPressed: (){},
        hintText: "页面不存在",
      ),
    );
  }
}
