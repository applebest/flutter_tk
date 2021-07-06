import 'package:flutter/material.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';


class HomeBottomLogoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      child: Center(

        child: LoadAssetImage(
          "appIcon_placeholder_gray"
        ),

      ),

    );
  }
}
