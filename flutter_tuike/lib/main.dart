
import 'package:flutter/material.dart';
import 'package:fluttertuike/net/request_service.dart';
import 'package:fluttertuike/root/provider/rootProvider.dart';
import 'package:fluttertuike/root/tab_bar.dart';
import 'package:fluttertuike/routers/routers.dart';
import 'package:fluttertuike/utils/nav_push_process.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';



void main() {

  WidgetsFlutterBinding.ensureInitialized();


  runApp(MyApp());

//  runApp(
//    MultiProvider(
//        providers: [
//            ChangeNotifierProvider(create: (_) => RootProvider()),
//        ],
//      child: MyApp(),
//
//    )
//  );
}

class MyApp extends StatelessWidget {


  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();


  @override
  Widget build(BuildContext context) {

    Routers.initRoutes();

    final Widget app =   MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.white,
            appBarTheme: AppBarTheme(
              elevation: 0,
            )
        ),
        navigatorObservers: [NavPushProcess()],
        navigatorKey: navigatorKey,
        home: TabBarPage(),
        onGenerateRoute: Routers.router.generator,
      );
    return OKToast(child: app);
  }
}