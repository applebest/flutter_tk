
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertuike/net/request_service.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:oktoast/oktoast.dart';
import 'package:permission_handler/permission_handler.dart';

class PostersPage extends StatelessWidget {

  GlobalKey _imgKey = GlobalKey();



  _save() async {

    try{

      PermissionStatus status = await Permission.storage.status;
      if(status != PermissionStatus.granted){
        status = await Permission.storage.request();
        if(status != PermissionStatus.granted){
            throw "请求授权失败";
        }
      }

      var response = await RequestService.instance.dio.get(
          "https://img1.baidu.com/it/u=409954673,232260503&fm=26&fmt=auto&gp=0.jpg",
          options: Options(responseType: ResponseType.bytes));
    //保存图片
    final result = await ImageGallerySaver.saveImage(response.data);

    if (result == null || result == '') throw '图片保存失败';

    showToast("保存成功");

    print("保存成功");

    }catch(e){
      print(e.toString());
    }




  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("推单海报"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child:CachedNetworkImage(
                  key: _imgKey,
                  imageUrl:"https://img1.baidu.com/it/u=409954673,232260503&fm=26&fmt=auto&gp=0.jpg",
                  placeholder: (BuildContext, String){
                    return Container(color: Colors.grey,);
                  },
                  fit: BoxFit.cover,
                )
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: _save,
              behavior: HitTestBehavior.opaque,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height:50,
                child: Text("保存",style: TextStyle(color: Colors.white),),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromRGBO(42, 130, 253, 1),
                ),
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),

    );
  }
}

