import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

/**
 * @author solox
 * @time 2020/3/13 0013-10:37
 * @token_interceptor.dart
 * @desc：Token 拦截器
 */
typedef void ChildContext(BuildContext context);

class TokenInterceptor extends Interceptor {
  ChildContext context;

  @override
  Future onError(DioError err) async {} //上下文

}
