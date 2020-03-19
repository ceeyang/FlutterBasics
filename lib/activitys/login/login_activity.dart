import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/bean/user.dart';
import 'package:flutter_basics/bean/userbean.dart';
import 'package:flutter_basics/activitys/login/login_repository.dart';
import 'package:flutter_basics/configs/constant_config.dart';
import 'package:flutter_basics/plugins/plugin_tarbar_activity.dart';
import 'package:flutter_basics/res/resouce.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  
  FocusNode _passwordFN = new FocusNode();

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
        Route newRoute =
            MaterialPageRoute(builder: (context) => PluginTabarActivity());
        Navigator.pushReplacement(context, newRoute);
      }).catchError((error) {
        LogUtil.e("LoginResp error: ${error.toString()}");
      });
    }
  }

  /// 账号按钮点击事件
  void _accountTextFieldChanged(String str) {
    print(str);
  }

  /// 密码改变事件
  void _passwordTextFieldChanged(String str) {

  }

  void _accountTextFiledSubmit(String str) {
    _passwordFN.requestFocus();
  }

  void _passwordTextFiledSubmit(String str) {

  }

  _loginItem(bool isAccount) {
    var textField = TextField(
      textInputAction: isAccount ? TextInputAction.next : TextInputAction.done,
      obscureText: isAccount ? false : true,
      focusNode: isAccount ? null : _passwordFN,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        icon: Icon(isAccount ? Icons.account_circle : Icons.lock),
        labelText: isAccount ? '请输入你的账号' : '请输入你的密码',
        helperText: isAccount ? '账号/邮箱/手机号' : '6~18位数字字母组合',
      ),
      onChanged: isAccount ? _accountTextFieldChanged : _passwordTextFieldChanged,
      autofocus: false,
      onSubmitted: isAccount ? _accountTextFiledSubmit : _passwordTextFiledSubmit,
      controller: isAccount ? _controllerName : _controllerPwd,
    );
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: textField
    );
  }

  /// 登录
  void _loginBtnOnPressed() {
    pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal,
        isDismissible: true,
        showLogs: true);
    pr.style(message: "logging in . . .");
    pr.show();
    Future.delayed(Duration(seconds: 2)).then((value) {
      pr.hide().whenComplete(() {
        SharedPreferences.getInstance().then((it){
          it.setBool(KConstant.keyIsLogined, true);
        });
        Route newRoute = MaterialPageRoute(
            builder: (context) => PluginTabarActivity());
        Navigator.pushReplacement(context, newRoute);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // 触摸收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
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
                _loginItem(true),
                Gaps.vGap15,
                _loginItem(false),
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
                    onPressed: _loginBtnOnPressed,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false, //防止软键盘弹起
    );
  }
}
