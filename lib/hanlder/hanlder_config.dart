import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basics/activitys/configurable/configurable_activity.dart';
import 'package:flutter_basics/activitys/home/home_activity.dart';
import 'package:flutter_basics/activitys/mine/mine_activity.dart';
import 'package:flutter_basics/activitys/modul/moduls_activity.dart';
import 'package:flutter_basics/configs/constant_config.dart';
import 'package:flutter_basics/utils/custom_utils.dart';

class HanlderConfig {

  // 将 json 字符串解析为 HanlderConfigBean 对象
  // TODO: 目前先加载本地文件，后面需要下载服务器文件，对比版本号更新替换本地文件
  Future<HanlderConfigBean> loadLoaclConfig() async {
    // 获取本地的 json 字符串
    String configJson = await rootBundle.loadString('assets/jsons/local_basic_config.json');
    log(configJson);
    // 解析 json 字符串，返回的是 Map<String, dynamic> 类型
    final jsonMap = json.decode(configJson);

    print('jsonMap runType is ${jsonMap.runtimeType}');

    HanlderConfigBean config = HanlderConfigBean.fromJson(jsonMap);
    
    return config;
  }

  /// 获取 BottomNavigationbbarItem
  List<BottomNavigationBarItem> getTabbarItems(HanlderConfigBean config) {
    return config.body.tabBars.map<BottomNavigationBarItem>((item){
      if (item == ConstantConfig.TabHome) {
        return BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("首页")
        );
      }
      if (item == ConstantConfig.TabMenu) {
        return BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          title: Text("模块")
        );
      }
      if (item == ConstantConfig.TabMine) {
        return BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text("我的")
        );
      }
      return null;
    }).toList();
  }

  /// 获取 BottomNavigationbbarItem 对应的 activity
  List<Widget> getBodyPages(HanlderConfigBean config)  {
    return config.body.tabBars.map<Widget>((item){
      if (item == ConstantConfig.TabHome) {
        return HomeActivity();
      }
      if (item == ConstantConfig.TabMenu) {
        return ConfigurableActivity();
      }
      if (item == ConstantConfig.TabMine) {
        return MineActivity();
      }
      return null;
    }).toList();
  }
}

class HanlderConfigBean {
  String title;
  String version;
  String date;
  HanlderConfigInfoBean info;
  HanlderConfigBodyBean body;

  HanlderConfigBean({this.title, this.version, this.info, this.body});

  HanlderConfigBean.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    version = json['version'];
    date = json['date'];
    info = json['info'] != null ? new HanlderConfigInfoBean.fromJson(json['info']) : null;
    body = json['body'] != null ? new HanlderConfigBodyBean.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['title'] = this.title;
    data['version'] = this.version;
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    return data;
  }
}

class HanlderConfigInfoBean {
  String name;
  String company;
  String domain;

  HanlderConfigInfoBean({this.name, this.company, this.domain});

  HanlderConfigInfoBean.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    company = json['company'];
    domain = json['domain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['company'] = this.company;
    data['domain'] = this.domain;
    return data;
  }
}

class HanlderConfigBodyBean {
  List<String> tabBars;
  String description;

  HanlderConfigBodyBean({this.tabBars});

  HanlderConfigBodyBean.fromJson(Map<String, dynamic> json) {
    tabBars = json['tabBars'].cast<String>();
    description = json['description'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tabBars'] = this.tabBars;
    data['description'] = this.description;
    return data;
  }
}