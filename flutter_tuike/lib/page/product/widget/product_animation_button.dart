

import 'package:flutter/material.dart';
import 'package:fluttertuike/widgets/load_iamge.dart';


const double _size = 46;


// 绘制圆形 解决setState重新build问题
class _BubblePainter extends CustomPainter {

  final Animation<double> animation;
  const _BubblePainter(this.animation):super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {

    final center = size.center(Offset.zero);
    final radius = center.dx * (1 + animation.value * 0.3);
    final paint = Paint()
      ..color = Colors.blue.shade200
      ..isAntiAlias = true;
    canvas.drawCircle(center, radius, paint);

  }

  @override
  bool shouldRepaint(_BubblePainter oldDelegate) {
   return this.animation != oldDelegate.animation;
  }
}




class ProductAnimationButton extends StatefulWidget {
  @override
  _ProductAnimationButtonState createState() => _ProductAnimationButtonState();
}

class _ProductAnimationButtonState extends State<ProductAnimationButton> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  // 初始化调用
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds:800),
    );
    _controller.repeat(reverse: true);
  }

  // 当state对象依赖关系发生变化时调用，如scaffold -> container -> text 变为 container-> container -> text
  // initState后立即调用，调用完后调用build
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  /*
  构建widget子树
  调用时机：initState之后
   在调用didChangeDependencies之后
   在调用didUpdateWidget之后
   在调用setState之后
  */
  @override
  Widget build(BuildContext context) {
    // RepaintBoundary 限制绘制区域 避免整个页面重绘
    return RepaintBoundary(
      child:  CustomPaint(
        painter: _BubblePainter(_controller),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.shade400,
          ),
          width: _size,
          height: _size,
          child: Text(
              "一键\n推单",style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }


  // 重新组装  用于调试，热重载时调用，release下不会调用
  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
  }



  /*
  当widget配置更改时调用
  这个函数调用完后自动调用build()
  */
  @override
  void didUpdateWidget(covariant ProductAnimationButton oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  // 当 State 被暂时从视图树中移除时(页面切换时 ,push ,pop) ，会调用这个函数
  @override
  void deactivate() {
    super.deactivate();
  }


  //widget销毁调用，在调用这个函数之前会调用deactivate
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



}
