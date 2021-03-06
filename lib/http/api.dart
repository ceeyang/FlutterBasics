/// 接口列表
class Api {

  /// 基础 URl 地址
  static const baseUrl = "http://xfyhpc.xft119.com:9005/";

  /// H5地址
  static H5aApi h5;

  /// 登录
  static const login = "base/login/";

  /// 配置文件地址
  static const config = "https://raw.githubusercontent.com/XiaoAnTechnology/FlutterBasics/master/assets/jsons/local_basic_config.json";
}

/// H5 地址
class H5aApi {
  
  /// Api.h5.h5ModulUrl
  String get h5ModulUrl => "";

}