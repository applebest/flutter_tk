
import 'package:event_bus/event_bus.dart';
//Bus 初始化
EventBus eventBus = EventBus();

// 产品页切换头部导航下标
class EventProductIndex {

  int index;
  EventProductIndex(this.index);
}

// tabBar切换选中页面
class EventTabBarIndex{

  int index;
  EventTabBarIndex(this.index);
}