import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/bean/user.dart';
import 'package:flutter_basics/bean/userbean.dart';
import 'package:flutter_basics/common_widgets/login_item.dart';
import 'package:flutter_basics/mvvm/login/login_repository.dart';
import 'package:flutter_basics/plugins/plugin_tarbar_activity.dart';
import 'package:flutter_basics/res/resouce.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

ProgressDialog pr;

class LoginActivity extends StatefulWidget {
  LoginActivity({Key key}) : super(key: key);

  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  TextEditingController _controllerName = new TextEditingController();
  TextEditingController _controllerPwd = new TextEditingController();
  LoginRepository loginRepository = new LoginRepository();
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  bool _isClick = false;

  String username;
  String password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _controllerName.addListener(_verify);
//    _controllerPwd.addListener(_verify);
  }

  bool _verify() {
    username = _controllerName.text;
    password = _controllerPwd.text;
    bool isClick = true;
    if (username.isEmpty || username.length < 6) {
//        Fluttertoast.showToast(,username.isEmpty ? "请输入用户名～" : "用户名至少6位～");
      isClick = false;
    }
    if (password.isEmpty || password.length < 6) {
//        Util.showSnackBar(context, username.isEmpty ? "请输入密码～" : "密码至少6位～");
      isClick = false;
    }
    username = _controllerName.text;
    password = _controllerPwd.text;
    return isClick;
  }

  void _userLogin() {
    if (_verify()) {
      User req = new User();
      req.code = username;
      req.password = password;
      loginRepository.login(req).then((UserBean model) {
        LogUtil.v("LoginResp: ${model.toString()}");
        Route newRoute =
            MaterialPageRoute(builder: (context) => PluginTabarActivity());
        Navigator.pushReplacement(context, newRoute);
      }).catchError((error) {
        LogUtil.e("LoginResp error: ${error.toString()}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/template_background_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginItem(
                controller: _controllerName,
                prefixIcon: Icons.person,
//                hintText: IntlUtil.getString(context, CommonStrings.user_name),
              ),
              Gaps.vGap15,
              LoginItem(
                controller: _controllerPwd,
                prefixIcon: Icons.lock,
                hasSuffixIcon: true,
//                hintText: IntlUtil.getString(context, CommonStrings.user_pwd),
              ),
              SizedBox(
                height: 20,
              ),
              IconButton(
                icon: Icon(Icons.android),
                color: Colors.white,
                onPressed: () {
                  _userLogin();
                },
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                  onPressed: () {
                    pr = new ProgressDialog(context,
                        type: ProgressDialogType.Normal,
                        isDismissible: true,
                        showLogs: true);
                    pr.style(message: "logging in . . .");
                    pr.show();
                    Future.delayed(Duration(seconds: 2)).then((value) {
                      pr.hide().whenComplete(() {
                        print("当前系统语言为:${Localizations.localeOf(context)}");
                        Route newRoute = MaterialPageRoute(
                            builder: (context) => PluginTabarActivity());
                        Navigator.pushReplacement(context, newRoute);
                      });
                    });
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false, //防止软键盘弹起
    );
  }
}
