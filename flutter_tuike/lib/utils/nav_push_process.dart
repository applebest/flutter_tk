

import 'package:flutter/material.dart';
import 'package:fluttertuike/main.dart';

class NavPushProcess extends NavigatorObserver{


  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);

//    var previousName = '';
//    if (previousRoute == null) {
//      previousName = 'null';
//    }else {
//      previousName = previousRoute?.settings.name ?? "";
//    }
//    print('导航器----->出栈--Current:' + (route.settings.name ?? "")  + '  Previous:' + previousName);

    print("压栈----> ${MyApp.navigatorKey.currentState.runtimeType} ");

  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);

//    var previousName = '';
//    if (previousRoute == null) {
//      previousName = 'null';
//    }else {
//      previousName = previousRoute?.settings.name ?? "";
//    }
//    print('导航器----->压栈--Current:' + (route.settings.name ?? "")  + '  Previous:' + previousName);
    print("压栈----> ${MyApp.navigatorKey.currentContext.runtimeType} ");
  }



}