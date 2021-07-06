import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertuike/page/home/model/home_model.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';

class HomeCeramicsWidget extends StatelessWidget {
  final List<CeramicsList> list;

  HomeCeramicsWidget(this.list);

  Widget _item( {CeramicsList? model}) {

    final imageUrl = model?.imageUrl ?? "";
    
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: Colors.white,
        ),
        child: imageUrl.length > 0 ? CachedNetworkImage(imageUrl: imageUrl): LoadAssetImage("ceramics_placeholder"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (list.length == 0) {
      return SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 80,
      child: Row(
        children: [
          Expanded(
            child: _item(model: list.first),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: _item(),
          ),
        ],
      ),
    );
  }
}
