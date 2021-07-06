import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:fluttertuike/page/home/model/home_model.dart';
import 'package:fluttertuike/page/home/provider/home_provider.dart';
import 'package:fluttertuike/page/home/widget/home_bottom_logo.dart';
import 'package:fluttertuike/page/home/widget/home_ceramics.dart';
import 'package:fluttertuike/page/home/widget/home_product.dart';
import 'package:fluttertuike/page/home/widget/notice_widget.dart';
import 'package:fluttertuike/widgets/my_app_bar.dart';
import 'package:fluttertuike/widgets/refresh_list.dart';
import 'package:fluttertuike/widgets/state_layout.dart';
import 'package:provider/provider.dart';
import 'package:fluttertuike/page/home/widget/home_banner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  HomeProvider provider = HomeProvider();

  late List<Widget> widgets;

  List<Widget> _buildList() {
    List<Widget> list = <Widget>[];
    final model = provider.model;
    if (model == null) {
      return list;
    }

    final banner = Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: HomeBanner(model.bannerList ?? []));

    final space12 = SizedBox(
      height: 12.5,
    );
    final notice = NoticeWidget(model.noticeList ?? []);
    final space15 = SizedBox(
      height: 15,
    );
    final ceramics = HomeCeramicsWidget(model.ceramicsList ?? []);
    final horizontalList = HomeProductListView(model.productList ?? []);
    final bottomLogo = HomeBottomLogoView();

    list.add(banner);
    list.add(space12);
    list.add(notice);
    list.add(space15);
    list.add(ceramics);
    list.add(horizontalList);
    list.add(bottomLogo);
    widgets = list;
    return list;
  }

  Future<void> _onRefresh() async {
    provider.fetchData();
  }

  @override
  void initState() {
    // TODO: implement initState

    provider.fetchData();
    provider.requestAlertData(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("首页build 构建");

    return ChangeNotifierProvider<HomeProvider>(
      create: (_) => provider,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            centerTitle: false,
            title: Text(
              "恒生活众包",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(46, 46, 77, 1),
              ),
            ),
          ),
          body: Consumer<HomeProvider>(
            builder: (context, provider, child) {
              return RefreshListView(
                  stateType: StateType.loading,
                  itemCount: _buildList().length,
                  itemBuilder: (BuildContext context, int index) {
                    if (widgets.length > 0) {
                      return widgets[index];
                    } else {
                      return _buildList()[index];
                    }
                  },
                  onRefresh: _onRefresh,
                  emptOnPressed: _onRefresh);

//            return ListView(
//                children: _buildList()
//            );
            },
          )),
    );
  }
}
