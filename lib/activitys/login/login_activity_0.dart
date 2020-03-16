import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_basics/plugins/plugin_tarbar_activity.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

ProgressDialog pr;

class LoginActivity extends StatefulWidget {
  LoginActivity({Key key}) : super(key: key);

  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  void _login() async {
    Timer(Duration(seconds: 3), () {

      _btnController.success();

      Timer(Duration(seconds: 1), () {
        Route newRoute =
            MaterialPageRoute(builder: (context) => PluginTabarActivity());
        Navigator.pushReplacement(context, newRoute);
      });
    });
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
              Text(
                'Hello Wolrd',
                style: TextStyle(fontSize: 22.0, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              RoundedLoadingButton(
                child: Text('Login', style: TextStyle(color: Colors.white)),
                controller: _btnController,
                onPressed: _login,
              ),
              SizedBox(height: 20),
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
    );
  }
}
