import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertuike/main.dart';
import 'package:fluttertuike/page/home/widget/home_product_view.dart';
import 'package:fluttertuike/page/product/model/product_list_model.dart';
import 'package:fluttertuike/page/product/model/product_title_model.dart';
import 'package:fluttertuike/page/product/provider/product_list_provider.dart';
import 'package:fluttertuike/page/product/widget/product_animation_button.dart';
import 'package:fluttertuike/page/product/widget/product_item.dart';
import 'package:fluttertuike/page/product/widget/product_not_borrow_view.dart';
import 'package:fluttertuike/page/product/widget/product_testing.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';
import 'package:fluttertuike/widgets/refresh_list.dart';
import 'package:fluttertuike/widgets/state_layout.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {

  final ProductTitleModel typeModel;

  ProductListPage(this.typeModel);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> with AutomaticKeepAliveClientMixin {


  late BuildContext dialogContext;


  ProductListProvider provider = ProductListProvider();

    StateType _stateType = StateType.loading;




    Future<void> _onRefresh() async {

      provider.fetchData(true, widget.typeModel.productType.toString());

    }

    Future _loadMore() async {

      provider.fetchData(false, widget.typeModel.productType.toString());

    }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;



  @override
    void initState() {
      super.initState();

       provider.fetchData(true, widget.typeModel.productType.toString());

    }

      @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(241, 243, 248, 1),
        floatingActionButton: InkWell(
          child: ProductAnimationButton(),
          onTap: (){

              showDialog(context: context, builder: (context){
                return ProductTestingWidget();
              });

              // 控制消失 从全局获取当前的context
              var ctx = MyApp.navigatorKey.currentContext;
              if(ctx != null){
                Future.delayed(Duration(seconds: 3),(){
                  Navigator.pop(ctx);
                });
              }




          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Builder(builder: (BuildContext context) {
          return ChangeNotifierProvider(
            create: (context) => provider,
            child: Consumer<ProductListProvider>(builder: (context, model, _) {
              return RefreshListView(
                  stateType: _stateType,
                  itemCount: provider.list.length,
                  hasMore: provider.page < provider.maxPage,
                  loadMore: _loadMore,
                  onRefresh: _onRefresh,
                  emptOnPressed: (){
                    _onRefresh();
                  },
                itemBuilder: (context,index){
                  ProductModel model = provider.list[index];

                  Widget child;

                  if(model.productType == 1){
                    child = ProductItem(model);

                  }else{
                    child =  ProductNotBorrowView(model);
                  }

                  if(index == 0){
                    child = Container(
                      padding: EdgeInsets.only(top: 15),
                      color: Color.fromRGBO(241, 243, 248, 1),
                      child: child,
                    );
                  }

                  return child;
                },

              );
            }),
          );
        }),
      ),
    );
  }


}
