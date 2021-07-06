
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertuike/widgets/state_layout.dart';

typedef RefreshCallback = Future<void> Function();
typedef LoadMoreCallback = Future<void> Function();

class RefreshListView extends StatefulWidget {
  RefreshListView({
    required this.itemCount,
    required this.itemBuilder,
    required this.onRefresh,
    required this.emptOnPressed,
    this.loadMore,
    this.hasMore = false,
    this.stateType = StateType.empty,
    this.pageSize = 10,
    this.padding,
    this.itemExtent,
  });

  final VoidCallback emptOnPressed;

  final RefreshCallback onRefresh;
  final LoadMoreCallback? loadMore;
  final int itemCount;
  final bool hasMore;
  final IndexedWidgetBuilder itemBuilder;
  final StateType stateType;

  /// 一页的数量，默认为10
  final int pageSize;

  /// padding属性使用时注意会破坏原有的SafeArea，需要自行计算bottom大小
  final EdgeInsetsGeometry? padding;
  final double? itemExtent;

  @override
  _RefreshListViewState createState() => _RefreshListViewState();
}

class _RefreshListViewState extends State<RefreshListView> {
  bool _isLoading = false;

  Future<void> _loadMore() async {
    if (widget.loadMore == null) {
      return;
    }
    if (_isLoading) {
      return;
    }
    if (!widget.hasMore) {
      return;
    }
    _isLoading = true;
    await widget.loadMore?.call();
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    // 刷新控件
    final Widget child = RefreshIndicator(
        child: widget.itemCount == 0
            ? StateLayout(
                type: widget.stateType, onPressed: widget.emptOnPressed)
            : ListView.builder(
                itemCount: widget.loadMore == null
                    ? widget.itemCount
                    : widget.itemCount + 1,
                padding: widget.padding,
                itemExtent: widget.itemExtent,
                itemBuilder: (BuildContext context, int index) {
                  if (widget.loadMore == null) {
                    return widget.itemBuilder(context, index);
                  } else {
                    return index < widget.itemCount
                        ? widget.itemBuilder(context, index)
                        : MoreWidget(
                            widget.itemCount, widget.hasMore, widget.pageSize);
                  }
                },
              ),
        onRefresh: widget.onRefresh);

    return SafeArea(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notifi) {
          // 滑动到底部并且是垂直方向
          if (notifi.metrics.pixels == notifi.metrics.maxScrollExtent &&
              notifi.metrics.axis == Axis.vertical) {
            _loadMore();
          }
          return true;
        },
        child: child,
      ),
    );
  }
}

class MoreWidget extends StatelessWidget {
  const MoreWidget(this.itemCount, this.hasMore, this.pageSize, {Key? key})
      : super(key: key);

  final int itemCount;
  final bool hasMore;
  final int pageSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (hasMore) CupertinoActivityIndicator(),
          if (hasMore)
            SizedBox(
              width: 5,
            ),
          Text(hasMore ? "正在加载中..." : (itemCount < pageSize ? "" : "没有了哟~"))
        ],
      ),
    );
  }
}
