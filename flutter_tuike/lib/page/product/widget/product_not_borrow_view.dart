
import 'package:flutter/material.dart';
import 'package:fluttertuike/page/home/widget/home_product_item.dart';
import 'package:fluttertuike/page/product/model/product_list_model.dart';


class ProductNotBorrowView extends StatelessWidget {


  ProductNotBorrowView(this.model);

  final ProductModel model;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(241, 243, 248, 1),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
              ),
              child:HomeProductItem(model)
          ),
          Container(
            height: 15,
            color: Color.fromRGBO(241, 243, 248, 1),
          )
        ],
      ),

    );
  }
}
