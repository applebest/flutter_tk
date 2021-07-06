
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertuike/event_bus/event_change_product_index.dart';
import 'package:fluttertuike/page/home/model/home_model.dart';
import 'package:fluttertuike/page/home/widget/home_product_tag.dart';
import 'package:fluttertuike/page/home/widget/home_product_view.dart';
import 'package:fluttertuike/page/product/model/product_list_model.dart';
import 'package:fluttertuike/root/provider/rootProvider.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';
import 'package:fluttertuike/Extension/text.dart';
import 'package:provider/provider.dart';

class HomeProductListView extends StatelessWidget {
  List<ProductList> productList;

  HomeProductListView(this.productList);

  Size screnSize = Size.zero;

  Widget _sectionView(ProductList model,int index,BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              model.title ?? "",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
//                  Provider.of<RootProvider>(context,listen: false).changeIndex(1);
                  eventBus.fire(EventTabBarIndex(1));
                  eventBus.fire(EventProductIndex(index));
                },
                child: Text(
                  "更多",
                ),
              )),
        ],
      ),
    );
  }

  Widget _horizontalItem(ProductModel listModel) {
    return HomeProductView(listModel);
  }

  Widget _horizontalListView(ProductList model) {
    return Container(
      height: 125,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          if(model.list?[index] != null){
            return _horizontalItem(model.list![index]);
          }
          return  SizedBox.shrink();

        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            width: 7.5,
          );
        },
        itemCount: model.list?.length ?? 0,
      ),
    );
  }

  Widget _productItem(ProductList model ,int index,BuildContext context) {
    return Column(
      children: [
        _sectionView(model,index,context),
        _horizontalListView(model),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (productList.length == 0) {
      return SizedBox.shrink();
    }
    screnSize = MediaQuery.of(context).size;

    return ListView.builder(
      shrinkWrap: true,
      physics: new NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return _productItem(productList[index],index,context);
      },
      itemCount: productList.length,
    );
  }
}
