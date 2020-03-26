import 'package:flutter/material.dart';


/// 自定义appbar 可弹出窗口
class CustomAppBar extends StatelessWidget  implements PreferredSizeWidget {
  /// 标题
  final String _title;

  ///  手势,当点击返回键时,处理的逻辑,如果不传值,则默认会返回上个界面,且不包含任何返回值
  final void Function(BuildContext ctx) _onReturn;

  CustomAppBar({String title, Function(BuildContext ctx) onReturn})
      : _title = title == null ? "" : title,
        _onReturn = onReturn != null ? onReturn : null;

  @override
  Widget build(BuildContext context) {
    return FixHeightAppBar(
      child: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            //color: Theme.of(context).textTheme.title.color,
          ),
          onTap: () {
            //  返回上一页,退栈
            if (_onReturn == null) {
              Navigator.pop(context);
            } else {
              _onReturn(context);
            }
          },
        ),
        centerTitle: true,
        title: Text(
          _title,
          //style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }
}

/// 固定高度的appbar 模型
class FixHeightAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// 布局代理
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }

  /// 传入child
  FixHeightAppBar({@required this.child});
}



/// 这是一个可以指定SafeArea区域背景色的AppBar
/// PreferredSizeWidget提供指定高度的方法
/// 如果没有约束其高度，则会使用PreferredSizeWidget指定的高度

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  
  final double contentHeight; //从外部指定高度
  Widget leadingWidget;
  Widget trailingWidget;
  String _title;
  
  ///  手势,当点击返回键时,处理的逻辑,如果不传值,则默认会返回上个界面,且不包含任何返回值
  final void Function(BuildContext ctx) _onReturn;

  HomeAppBar({
    @required this.leadingWidget,
    String title,
    this.contentHeight = kToolbarHeight,
    this.trailingWidget,
    Function(BuildContext ctx) onReturn
  }) : _title = title == null ? "" : title,
       _onReturn = onReturn != null ? onReturn : null,
       super();

  @override
  State<StatefulWidget> createState() {
    return new _HomeAppBarState();
  }

  @override
  Size get preferredSize => new Size.fromHeight(contentHeight);
}

/// 这里没有直接用SafeArea，而是用Container包装了一层
/// 因为直接用SafeArea，会把顶部的statusBar区域留出空白
/// 外层Container会填充SafeArea，指定外层Container背景色也会覆盖原来SafeArea的颜色
///     var statusheight = MediaQuery.of(context).padding.top;  获取状态栏高度

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        top: true,
        child: Container(
            // decoration: UnderlineTabIndicator(
            //   borderSide: BorderSide(width: 1.0, color: ),
            // ),
            height: widget.contentHeight,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: widget.leadingWidget,
                  ),
                ),
                Container(
                  child: Text(widget._title,
                      style: TextStyle(
                          fontSize: 17, color: Color(0xFF333333))),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.only(right: 5),
                    child: widget.trailingWidget,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
