import 'package:flutter/cupertino.dart';
import 'package:fluttertuike/common/webview_page.dart';
import 'package:fluttertuike/constant/constant.dart';


class CustomerPage extends StatefulWidget {

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

    return WebViewPage(Constant.customerURL,title: "客户",);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;


}

