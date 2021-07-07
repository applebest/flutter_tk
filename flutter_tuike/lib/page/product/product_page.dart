import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:fluttertuike/constant/constant.dart';
import 'package:fluttertuike/event_bus/event_change_product_index.dart';
import 'package:fluttertuike/page/product/page/product_list_page.dart';
import 'package:fluttertuike/page/product/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {

  TabController? _tabController;
  final PageController _pageController = PageController(initialPage: 0);

  ProductProvider provider = ProductProvider();



  // 页面切换
  _onPageChange(int index) {
    _tabController?.animateTo(index);
//    provider.setIndex(index);
  }

  @override
  void initState() {
    super.initState();

    provider.fetchData(requestEnd: (){
      _tabController = TabController(length: provider.model!.list!.length, vsync: this);
    });

    // 通知监听
    eventBus.on<EventProductIndex>().listen((event) {
      _tabController?.animateTo(event.index);
      _pageController.jumpToPage(event.index);
    });

  }


  List<Widget>  _buildTabs(){
    
    if(provider.model?.list?.length == 0){
      return [];
    }
    
    double itemWidth  =  (Constant.screenSize.width - 160.0 ) / provider.model!.list!.length;

    print("itemWidth $itemWidth");

    return List.generate(provider.model!.list!.length, (index){

      return Container(
        width: itemWidth,
        alignment: Alignment.center,
        child: Text(
          provider.model!.list![index].productTypeName ?? "" ,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      );

    });

  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<ProductProvider>(
        create: (_) => provider,
        child: Scaffold(
          appBar: AppBar(
            title: Text("产品"),
            elevation: 0.0,
            backgroundColor: Colors.white,
          ),
          body:
          Consumer<ProductProvider>(
            builder: (context, provider,  child){
              if(provider.model == null){
                return SizedBox.shrink();
              }

              return Column(
                children: [
                  Container(
                    color: Color.fromRGBO(241, 243, 248, 1),
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 40,
                    child: TabBar(
                      indicatorPadding: EdgeInsets.only(left: 20,right: 20),
                      controller: _tabController,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor:Color.fromRGBO(51, 51, 51, 1),
                      labelColor: Color.fromRGBO(42, 130, 253, 1),
                      indicatorColor: Color.fromRGBO(42, 130, 253, 1),
                      tabs: _buildTabs(),
                      onTap: (int index) {
                        if (!mounted) {
                          return;
                        }
                        _pageController.jumpToPage(index);
                      },
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                        key: const Key('pageView'),
                        itemCount: provider.model?.list?.length,
                        onPageChanged: _onPageChange,
                        controller: _pageController,
                        itemBuilder: (_, int index) => ProductListPage(provider.model!.list![index])),
                  ),
                ],
              );
            },
          )
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
