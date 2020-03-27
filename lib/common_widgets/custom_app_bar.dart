import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 这是一个可以指定SafeArea区域背景色的AppBar
/// PreferredSizeWidget提供指定高度的方法
/// 如果没有约束其高度，则会使用PreferredSizeWidget指定的高度

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  
  /// 自定义高度
  final double contentHeight; 

  final Widget leadingWidget;
  final Widget titleWidget;
  final Widget trailingWidget;
  final String _title;

  /// 自动显示返回按钮, 当 leadingWidget != null 时失效
  final bool _autoBackBtn;
  
  ///  手势,当点击返回键时,处理的逻辑,如果不传值,则默认会返回上个界面,且不包含任何返回值
  final void Function(BuildContext ctx) _onReturn;

  CustomAppBar({
    String title,
    this.leadingWidget,
    this.contentHeight = kToolbarHeight,
    this.trailingWidget,
    this.titleWidget,
    bool autoBackBtn,
    Function(BuildContext ctx) onReturn
  }) : _title = title == null ? "" : title,
       _autoBackBtn = leadingWidget == null ? (autoBackBtn ?? true) : false,
       _onReturn = onReturn != null ? onReturn : null,
       super();

  @override
  State<StatefulWidget> createState() {
    return _CustomAppBarState();
  }

  @override
  Size get preferredSize => Size.fromHeight(contentHeight);
}

/// 这里没有直接用SafeArea，而是用Container包装了一层
/// 因为直接用SafeArea，会把顶部的statusBar区域留出空白
/// 外层Container会填充SafeArea，指定外层Container背景色也会覆盖原来SafeArea的颜色
///     var statusheight = MediaQuery.of(context).padding.top;  获取状态栏高度

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: SafeArea(
          top: true,
          child: Container(
            height: widget.contentHeight,
            decoration: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.0, color: Colors.grey.shade300),
              insets: EdgeInsets.zero
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: widget._autoBackBtn 
                      ? IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
                        //  返回上一页,退栈
                        if (widget._onReturn == null) {
                          Navigator.pop(context);
                        } else {
                          widget._onReturn(context);
                        }
                      },)
                      : widget.leadingWidget,
                  ),
                ),
                Container(
                  child: widget.titleWidget != null 
                    ? widget.titleWidget
                    : Text(widget._title, style: TextStyle(fontSize: 20),),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.only(right: 5),
                    child: widget.trailingWidget,
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}