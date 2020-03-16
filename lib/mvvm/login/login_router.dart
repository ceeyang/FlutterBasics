/**
 * @author solox
 * @time 2020/3/16 0016-9:40
 * @login_router.dart
 * @desc：为登入模块各个页面设置不同的路由
 */

import 'package:fluro/fluro.dart';
import 'package:flutter_basics/mvvm/login/page/login_activity.dart';
import 'package:flutter_basics/routers/router_init.dart';

class LoginRouter implements IRouterProvider {
  static String loginPage = '/login'; //登入页面

  @override
  void initRouter(Router router) {
    router.define(loginPage,
        handler: Handler(handlerFunc: (_, params) => LoginActivity()));

    //带参数
//    router.define(goodsEditPage, handler: Handler(handlerFunc: (_, params) {
//      bool isAdd = params['isAdd']?.first == 'true';
//      bool isScan = params['isScan']?.first == 'true';
//      return GoodsEditPage(isAdd: isAdd, isScan: isScan,);
//    }));
  }
}
