
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertuike/constant/constant.dart';
import 'package:fluttertuike/widgets/state_layout.dart';
import 'package:oktoast/oktoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {

  final String url;
  final String title;

  WebViewPage(this.url,{this.title = "恒生活众包"});

  @override
  _WebViewPageState createState() => _WebViewPageState(title);
}

class _WebViewPageState extends State<WebViewPage> {
  // 隔离
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  int _progressValue = 0;

  String _title;
  _WebViewPageState(this._title);



  Set<JavascriptChannel> _jsChannel() {


    print("js监听");

    return <JavascriptChannel>[

      // 一账通code
      JavascriptChannel(name: "getCode", onMessageReceived: (JavascriptMessage message){

        print("一账通code ====>${message.message}");


      }),

      // 获取token
      JavascriptChannel(name: "getToken", onMessageReceived: (JavascriptMessage message){

        showToast("token");
        print("token ====>${message.message}");


      }),

      // token失效
      JavascriptChannel(name: "action", onMessageReceived: (JavascriptMessage message){
        showToast("token");

        print("tokenFailure ====>${message.message}");


      }),
      JavascriptChannel(name: "nativeBridge", onMessageReceived: (JavascriptMessage message){
        showToast("nativeBridge");

        print("nativeBridge ====>${message.message}");


      }),



    ].toSet();

}



  @override
  Widget build(BuildContext context) {
    print("webview build");
    return FutureBuilder<WebViewController>(
        builder: (context,snapshot){
          return WillPopScope(
            onWillPop: () async {
              if(snapshot.hasData){
                final bool canGoBack = await snapshot.data!.canGoBack();
                if(canGoBack){
                  await snapshot.data!.goBack();
                  return Future.value(false);
                }
              }
              return Future.value(true);
            },
            child: Scaffold(
                appBar: AppBar(
                  title: Text(_title),
                ),
                body: Stack(
                  children: [
                    WebView(
                      initialUrl: widget.url,
                      javascriptMode: JavascriptMode.unrestricted,
                      javascriptChannels: _jsChannel(),
                      navigationDelegate: (NavigationRequest request){
                        return  NavigationDecision.navigate;
                      },
                      // 一旦创建web视图调用
                      onWebViewCreated: (WebViewController webViewController){
                        _controller.complete(webViewController);
                      },
                      onProgress: (int progress){
                        setState(() {
                          _progressValue = progress;
                        });
                      },

                    ),
                    if(_progressValue != 100)LinearProgressIndicator(
                      value: _progressValue / 100,
                      backgroundColor: Colors.transparent,
                      minHeight: 2,
                    )else SizedBox.shrink()

                  ],
                )

            ),

          );
        }
    );
  }
}



