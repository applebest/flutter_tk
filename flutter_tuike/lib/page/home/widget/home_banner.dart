
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:fluttertuike/constant/constant.dart';
import 'package:fluttertuike/page/home/model/home_model.dart';
import 'package:fluttertuike/routers/nav.dart';
import 'package:fluttertuike/routers/routers.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';


class HomeBanner extends StatelessWidget {

  final List<BannerList> data;

  HomeBanner(this.data);


  @override
  Widget build(BuildContext context) {

    if(data.length == 0){
      return SizedBox.shrink();
    }



    return Container(
      height: 120,
      width: double.infinity,
      child: Swiper(
        itemCount: data.length,
        itemBuilder:  (BuildContext context, int index){
          return ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: CachedNetworkImage(
              placeholder: (context,url){
                return LoadAssetImage(
                    "home_header_placeholder"
                );
              },
              imageUrl: data[index].imageUrl ?? "",
              fit: BoxFit.fill,
            ),
          );
        },
        onTap: (int index){
          BannerList model = data[index];
          var map = json.decode(model.route!.last) as Map<String, dynamic>;
          String url = map["url"];
          print("url ==== ${url}");
          Nav.goWebViewPage(context, url);
        },
      ),
    );
  }
}

