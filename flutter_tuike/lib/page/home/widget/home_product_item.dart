import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertuike/page/home/widget/home_product_tag.dart';
import 'package:fluttertuike/page/product/model/product_list_model.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';

class HomeProductItem extends StatelessWidget {


  HomeProductItem(this.model);

  final ProductModel model;




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: CachedNetworkImage(
                width: 105,
                height: 105,
                fit: BoxFit.fill,
                placeholder: (_, __) {
                  return LoadAssetImage("product_placeholder");
                },
                imageUrl: model.iconUrl ?? "",
                errorWidget: (
                    BuildContext context,
                    String url,
                    dynamic error,
                    ) {
                  print(error);
                  return LoadAssetImage("product_placeholder");
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    model.productName ?? "",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(46, 46, 77, 1),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    model.productManual ?? "",
                    style: TextStyle(
                      color: Color.fromRGBO(163, 163, 178, 1),
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  if(model.tag != null && model.tag!.length > 0)HomeProductTagView(model.tag),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    model.detailAmount ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color.fromRGBO(230, 46, 21, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
