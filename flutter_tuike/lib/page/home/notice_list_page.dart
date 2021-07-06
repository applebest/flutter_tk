
import 'package:flutter/material.dart';
import 'package:fluttertuike/page/home/provider/notice_provider.dart';
import 'package:fluttertuike/page/home/widget/home_notice_item.dart';
import 'package:fluttertuike/widgets/refresh_list.dart';
import 'package:provider/provider.dart';

class NoticeListPage extends StatefulWidget {
  @override
  _NoticeListPageState createState() => _NoticeListPageState();
}

class _NoticeListPageState extends State<NoticeListPage> {


  NoticeProvider provider = NoticeProvider();



  Future<void> _onRefresh() async {

    provider.fetchData(true);

  }

  Future<void> _loadMore() async {
    provider.fetchData(false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _onRefresh();

  }


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<NoticeProvider>(
      create: (_) => provider,
      child: Scaffold(
        appBar: AppBar(
          title: Text("公告列表"),
        ),
        body: Container(
            color: Color.fromRGBO(252, 252, 252, 1),
            padding: EdgeInsets.only(top: 20,left: 15,right: 15),
            child:Consumer<NoticeProvider>(
                builder: (context, provider,  child){
                  if(provider.model == null){
                    return SizedBox.shrink();
                  }

                  return RefreshListView(
                    itemCount: provider.model?.list?.length ?? 0,
                    itemBuilder: (BuildContext context, int index){
                        if(provider.model != null){
                          return NoticeItem(provider.model!.list![0]);
                        }
                        return SizedBox.shrink();
                      },
                      hasMore: (provider.model?.totalCount ?? 0) > (provider.model?.pageNum ?? 0) ,
                      onRefresh: _onRefresh,
                      loadMore: _loadMore,
                      emptOnPressed:_onRefresh,
                  );
                }
            )
        ),

      ),
    );
  }



}
