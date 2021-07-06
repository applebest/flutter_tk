import 'package:flutter/material.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';

class ProductTestingWidget extends StatefulWidget {
  @override
  _ProductTestingWidgetState createState() => _ProductTestingWidgetState();
}

class _ProductTestingWidgetState extends State<ProductTestingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    )
      ..addStatusListener((status) {
        // 监听动画结束
        if (status == AnimationStatus.completed) {
          debugPrint("动画结束");
          //重置起点
          _controller.reset();
          //开启
          _controller.forward();
        }
      })
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 42),
          height: 172,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 36,
              ),
              RotationTransition(
                turns: _controller,
                child: LoadAssetImage("testing_load"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "产品检测中",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Text(
                "不符合推单产品规则的产品将无法\n一键推单",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromRGBO(136, 136, 136, 1),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
