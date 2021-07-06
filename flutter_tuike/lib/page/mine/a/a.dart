import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './a_model.dart';

/// Created by clt on 10/Jun/2021
///
/// Copyright ©2021 by clt. All rights reserved.
class AWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _StateAWidget();

}

class _StateAWidget extends State<AWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false, top: false,
      child: Scaffold(
        body: Builder(builder: (BuildContext context) {
          return ChangeNotifierProvider(
            create: (context) => AModel(),
            child: Consumer<AModel>(
                builder: (context, model, _) {
                  return Container(
                    color: Colors.white,
                  );
                }
            ),
          );
        }),
      ),
    );
  }
}