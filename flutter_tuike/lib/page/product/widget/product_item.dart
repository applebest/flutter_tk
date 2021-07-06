import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertuike/page/product/model/product_list_model.dart';
import 'package:fluttertuike/Extension/text.dart';

class ProductItem extends StatelessWidget {
  final ProductModel? model;

  ProductItem(this.model);

  Widget _buildTitleView() {




    return Row(
      children: [
         CachedNetworkImage(
            width: 31,
            height: 31,
            imageUrl: model?.iconUrl ?? "",
          ),
        SizedBox(
          width: 6,
        ),

        Expanded(
          flex: 1,
          child:  Text(
            model?.productName ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(46, 46, 77, 1),
            ),
          ),
        ),

        SizedBox(
          width: 10,
        ),

//        Text(
//          model?.productName ?? "",
//          style: TextStyle(
//            fontSize: 16,
//            color: Color.fromRGBO(46, 46, 77, 1),
//          ),
//        ),

        Container(
          width: (model?.tag?.first ?? "").paintWidthWithTextStyle(TextStyle(
            fontSize: 10,
          )) +
              10,
          margin: EdgeInsets.only(right: 15),
          alignment: Alignment.center,
          decoration: new BoxDecoration(
              border: new Border.all(
                  color: Color.fromRGBO(46, 154, 241, 1), width: 0.5),
              color: Color.fromRGBO(213, 234, 250, 0.32),
              borderRadius: new BorderRadius.circular((1.0))),
          child: Text(
            model?.tag?.first ?? "",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 10,
              color: Color.fromRGBO(245, 166, 35, 1),
            ),
            maxLines: 1,
          ),
        ),


//        Expanded(
//          flex: 1,
//          child: Container(
//            width: (model?.tag?.first ?? "").paintWidthWithTextStyle(TextStyle(
//                  fontSize: 10,
//                )) +
//                10,
//            margin: EdgeInsets.only(right: 15),
//            alignment: Alignment.centerRight,
//            decoration: new BoxDecoration(
//                border: new Border.all(
//                    color: Color.fromRGBO(46, 154, 241, 1), width: 0.5),
//                color: Color.fromRGBO(213, 234, 250, 0.32),
//                borderRadius: new BorderRadius.circular((1.0))),
//            child: Text(
//              model?.tag?.first ?? "",
//              overflow: TextOverflow.ellipsis,
//              style: TextStyle(
//                fontSize: 10,
//                color: Color.fromRGBO(245, 166, 35, 1),
//              ),
//              maxLines: 1,
//            ),
//          ),
//        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (model == null) {
      return SizedBox.shrink();
    }

    return Container(
      height: 175,
      width: double.infinity,
      color: Color.fromRGBO(241, 243, 248, 1),
      child: Container(
          height: 160,
          margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child:

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.5,),
                _buildTitleView(),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 1,
                  thickness: 0.5,
                  color: Color.fromRGBO(220, 222, 243, 1),
                ),

                SizedBox(
                  height: 17,
                ),

                Text(
                  model?.productManual ?? "",
                  style: TextStyle(
                    color: Color.fromRGBO(46, 46, 77, 1),
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 8.5,
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    model?.productFeatures ?? "",
                    style: TextStyle(
                      wordSpacing: 4.5,
                      fontSize: 12,
                      color: Color.fromRGBO(46, 46, 77, 1),
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )),
              ],
            ),
          )
      ),
    );
  }
}
