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

  TextEditingController _controllerName, _controllerPwd;
  LoginRepository loginRepository = LoginRepository();
  FocusNode _passwordFN = FocusNode();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;

  String username, password;

  String _assetsIcon = "assets/images/img_default_avatar.png";
  String _assetsBackgroundImage = "assets/images/template_background_image.png";

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((it) {
      setState(() {
        username = it.getString(KConstant.keyUserName);
        password = it.getString(KConstant.keyUserPassword);
        _controllerName = TextEditingController(text: username);
        _controllerPwd = TextEditingController(text: password);
      });
    });

  }

  void _userLogin() {
    User req = new User();
      req.code = username;
      req.password = password;
      loginRepository.login(req).then((UserBean model) {
        Route newRoute = MaterialPageRoute(builder: (context) => PluginTabarActivity());
        Navigator.pushReplacement(context, newRoute);
      }).catchError((error) {
        LogUtil.e("LoginResp error: ${error.toString()}");
      });
  }

  /// 账号按钮点击事件
  void _accountTextFieldSubmit(value) {
    _passwordFN.requestFocus();
  }

  /// 密码改变事件
  void _passwordTextFieldSubmit(value) {
    _passwordFN.unfocus();
  }

  String _validateAccount(value) {
    if (value == null || value.isEmpty) {
      return "请输入用户名";
    }
    return null;
  }

  String _validatePassword(value) {
    if (value == null || value.isEmpty) {
      return "请输入密码";
    }
    return null;
  }

  /// 登录
  void _loginBtnOnPressed() {

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      String name = _controllerName.text;
      String psd = _controllerPwd.text;

      SharedPreferences.getInstance().then((it) {
        it.setString(KConstant.keyUserName, name);
        it.setString(KConstant.keyUserPassword, psd);
      });

      pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal,
        isDismissible: true,
        showLogs: true
      );
      pr.style(message: "logging in . . .");
      pr.show();

      Future.delayed(Duration(seconds: 2)).then((value) {
        pr.hide().whenComplete(() {
          SharedPreferences.getInstance().then((it){
            it.setBool(KConstant.keyIsLogined, true);
          });
          Route newRoute = MaterialPageRoute(builder: (context) => PluginTabarActivity());
          Navigator.pushAndRemoveUntil(context, newRoute, (route) => route == null);
        });
      });

    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }


  /// MARK: - View -

  /// 输入框
  Widget _loginItem(bool isAccount) {
    var textField = TextFormField(
      textInputAction: isAccount ? TextInputAction.next : TextInputAction.done,
      obscureText: isAccount ? false : true,
      focusNode: isAccount ? null : _passwordFN,
      decoration: InputDecoration(
        icon: Icon(isAccount ? Icons.account_circle : Icons.lock),
        labelText: isAccount ? '请输入你的账号' : '请输入你的密码',
      ),
      onFieldSubmitted: isAccount ? _accountTextFieldSubmit : _passwordTextFieldSubmit,
      autofocus: false,
      controller: isAccount ? _controllerName : _controllerPwd,
      keyboardType: TextInputType.emailAddress,
      validator: isAccount ? _validateAccount : _validatePassword,
      autovalidate: _autoValidate,
    );
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: textField
    );
  }

  /// 登录视图
  Widget _buildLoginActivity() {
    return Scaffold(
      key: _scaffoldKey,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // 触摸收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(_assetsBackgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeInImage.assetNetwork(placeholder: _assetsIcon, image: _assetsIcon, width: 80, height: 80),
                SizedBox(height: 50,),
                _loginItem(true),
                Gaps.vGap15,
                _loginItem(false),
                SizedBox(height: 20,),
                IconButton(
                  iconSize: 80,
                  icon: Icon(Icons.keyboard_arrow_right), 
                  onPressed: _loginBtnOnPressed
                ),
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false, //防止软键盘弹起
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildLoginActivity();
  }
}