
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:fluttertuike/constant/constant.dart';
import 'package:fluttertuike/page/home/widget/home_product_item.dart';
import 'package:fluttertuike/page/home/widget/home_product_tag.dart';
import 'package:fluttertuike/page/product/model/product_list_model.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';



class HomeProductView extends StatelessWidget {


  HomeProductView(this.model);

  final ProductModel model;


  @override
  Widget build(BuildContext context) {
    return Container(
     width: Constant.screenSize.width - 35,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(4.0),
       color: Colors.white,
     ),
     child:HomeProductItem(model)
   );
  }
}
