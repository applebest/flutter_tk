
import 'package:flutter/material.dart';
import 'package:fluttertuike/constant/constant.dart';
import 'package:fluttertuike/event_bus/event_change_product_index.dart';
import 'package:fluttertuike/page/home/home_page.dart';
import 'package:fluttertuike/page/product/product_page.dart';
import 'package:fluttertuike/page/customer/customer_page.dart';
import 'package:fluttertuike/page/mine/mine_page.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';
import 'package:provider/provider.dart';
import 'provider/rootProvider.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

// 方案1  不需要混入 RestorationMixin        class _TabBarPageState extends State<TabBarPage>
// 方案2  混入 RestorationMixin             class _TabBarPageState extends State<TabBarPage> with RestorationMixin
class _TabBarPageState extends State<TabBarPage> with RestorationMixin  {
  static const double _imageSize = 25.0;

  late List<Widget> _pageList;
  final List<String> _tabBarTitles = ["首页", "产品", "客户", "我的"];
  List<BottomNavigationBarItem>? _itemList;
  final PageController _pageController = PageController();
  RootProvider provider = RootProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
    eventBus.on<EventTabBarIndex>().listen((event) {
      provider.value = event.index;
      _pageController.jumpToPage(event.index);
    });
  }

  void initData() {
    _pageList = [HomePage(), ProductPage(), CustomerPage(), MinePage()];
  }

  List<BottomNavigationBarItem> _buildItemList() {

    if (_itemList == null) {
      const _images = [
        [
          LoadAssetImage("table_home_n", width: _imageSize),
          LoadAssetImage("table_home_s", width: _imageSize),
        ],
        [
          LoadAssetImage("table_product_n", width: _imageSize),
          LoadAssetImage("table_product_s", width: _imageSize),
        ],
        [
          LoadAssetImage("table_customer_n", width: _imageSize),
          LoadAssetImage("table_customer_s", width: _imageSize),
        ],
        [
          LoadAssetImage("table_mine_n", width: _imageSize),
          LoadAssetImage("table_mine_s", width: _imageSize),
        ],
      ];

      _itemList = List.generate(_images.length, (index) {
        return BottomNavigationBarItem(
          icon: _images[index][0],
          activeIcon: _images[index][1],
          label: _tabBarTitles[index],
          tooltip: "", // 去除长按提示
        );
      });
    }

    return _itemList!;
  }

  @override
  Widget build(BuildContext context) {
    Constant.screenSize =  MediaQuery.of(context).size;


//     方案1  使用provider跨页面改变tabBar的index
//    print("tabbar build");
//    return Consumer<RootProvider>(
//      builder: (_,__,___){
//
//        int currentIndex = Provider.of<RootProvider>(context, listen: false).index;
//
//        return Scaffold(
//          bottomNavigationBar: BottomNavigationBar(
//            items: _buildItemList(),
//            type: BottomNavigationBarType.fixed,
//            currentIndex: currentIndex,
//            iconSize: 21.0,
//            elevation: 5.0,
//            selectedFontSize: 12,
//            unselectedFontSize: 12,
//            selectedItemColor: Color.fromRGBO(42, 130, 253, 1),
//            unselectedItemColor: Color.fromRGBO(142, 142, 147, 1),
//            onTap: (index){
//              Provider.of<RootProvider>(context,listen: false).changeIndex(index);
//            },
//          ) ,
//          body: IndexedStack(
//            index: currentIndex,
//            children: _pageList,
//          ),
//        );
//      },
//    );


  // 方案2 使用
    return ChangeNotifierProvider<RootProvider>(
      create: (_) => provider,
     child:Scaffold(
        bottomNavigationBar: Consumer<RootProvider>(
          builder:(_,provider,__){
            return  BottomNavigationBar(
              items: _buildItemList(),
              type: BottomNavigationBarType.fixed,
              currentIndex: provider.value,
              iconSize: 21.0,
              elevation: 5.0,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              selectedItemColor: Color.fromRGBO(42, 130, 253, 1),
              unselectedItemColor: Color.fromRGBO(142, 142, 147, 1),
              onTap: (index) {
                _pageController.jumpToPage(index);
              } ,
            );
          },
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(), // 禁止滑动
          controller: _pageController,
        onPageChanged: (int index) => provider.value = index,
          children: _pageList,
        ),
      )
    );
  }


  // 方案2
  @override
  // TODO: implement restorationId
  String? get restorationId => "root";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(provider, "tabBarCurrentIndex");
  }



}
