/**
 * @author solox
 * @time 2020/3/13 0013-14:40
 * @login_repository.dart
 * @desc： 登入数据仓库
 */
import 'package:flustars/flustars.dart';
import 'package:flutter_basics/bean/user.dart';
import 'package:flutter_basics/bean/userbean.dart';
import 'package:flutter_basics/configs/constant_config.dart';
import 'package:flutter_basics/constant.dart';
import 'package:flutter_basics/http/api_utils.dart';
import 'package:flutter_basics/http/base_resp.dart';
import 'package:flutter_basics/http/dio_util.dart';

class LoginRepository {
  Future<UserBean> login(User userBean) async {
    BaseRespR<Map<String, dynamic>> baseResp = await DioUtil().requestR(
        Method.post, ApiUtils.getPath(path: ApiUtils.login_url),
        data: userBean.toJson());

    if (baseResp.status != Constant.status_success) {
      return new Future.error(baseResp.msg);
    }
    baseResp.response.headers.forEach((String name, List<String> values) {
      if (name == "set-cookie") {
        String cookie = values.toString();
        LogUtil.e("set-cookie: " + cookie);
        SpUtil.putString(KConstant.keyAppToken, cookie);
        DioUtil().setCookie(cookie);
      }
    });
    UserBean model = UserBean.fromJson(baseResp.data);

    SpUtil.putObject(KConstant.keyUserModel, model);
    return model;
  }
}
