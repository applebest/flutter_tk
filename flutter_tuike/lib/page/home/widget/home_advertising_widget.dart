
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertuike/routers/nav.dart';
import 'package:fluttertuike/routers/routers.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';

class HomeAdvertisingWidget extends StatelessWidget {

  Map<String,dynamic> data;
  HomeAdvertisingWidget(this.data);
  @override
  Widget build(BuildContext context) {


    return  Material(
      type: MaterialType.transparency,
      child: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 42),
              child:Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Nav.goWebViewPage(context, data["landingUrl"]),
                      child: CachedNetworkImage(imageUrl:data["imageUrl"]),
                    ),
                    SizedBox(height: 13,),
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: LoadAssetImage("home_advertising_close")
                    )
                  ],
                ),
              )
          )
      ),
    );

    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child:  Material(
        type: MaterialType.transparency,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 42),
            child:Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(imageUrl:data["imageUrl"]),
                  SizedBox(height: 13,),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: LoadAssetImage("home_advertising_close")
                  )
                ],
              ),
            )
          )
        ),
      ),
    );
  }
}
