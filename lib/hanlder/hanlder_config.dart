import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basics/activitys/mine/mine_activity.dart';
import 'package:flutter_basics/plugins/plugin_icon_helper.dart';
import 'package:flutter_basics/plugins/plugin_page_routes.dart';
import 'package:flutter_basics/utils/custom_utils.dart';

class HanlderConfig {

  // 将 json 字符串解析为 HanlderConfigBean 对象
  // TODO: 目前先加载本地文件，后面需要下载服务器文件，对比版本号更新替换本地文件
  Future<MainConfig> loadLoaclConfig() async {
    // 获取本地的 json 字符串
    String configJson = await rootBundle.loadString('assets/jsons/local_basic_config.json');

    // 解析 json 字符串，返回的是 Map<String, dynamic> 类型
    final jsonMap = json.decode(configJson);

    MainConfig config = MainConfig.fromJson(jsonMap);
    
    log("config: $config");

    return config;
  }

  HanlderConfigResult getTabBarItemAndPages(MainConfig config) {
    var widgets = List<Widget>();
    var items = List<BottomNavigationBarItem>();
    for (var item in config.body.tabBars) {
      items.add(_getItems(item));
      widgets.add(_getActivity(item));
    }
    log("config.body.tabbars: ${config.body.tabBars}");
    log(widgets);
    return HanlderConfigResult(widgets: widgets, items: items);
  }

  _getItems(MainConfigTabBars tab) {
    String icon = tab.icon;
    bool isUrl = icon.contains("http");
    if (isUrl) {
      return BottomNavigationBarItem(icon: Image.network(icon),title: Text(tab.title));
    } else {
      return BottomNavigationBarItem(icon: Icon(getMaterialIcon(icon)),title: Text(tab.title));
    }
  }

  _getActivity(MainConfigTabBars tab) {
    var target = routeMap[tab.route];
    if (target != null) {
      return target;
    }
    return MineActivity();
  }
}

class HanlderConfigResult {
  List<Widget> widgets;
  List<BottomNavigationBarItem> items;

  HanlderConfigResult({
    this.items,
    this.widgets
  }) : assert(widgets.length == items.length);
}

class MainConfig {
  String title;
  String version;
  String date;
  MainConfigInfo info;
  MainConfigBody body;

  MainConfig({this.title, this.version, this.date, this.info, this.body});

  MainConfig.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    version = json['version'];
    date = json['date'];
    info = json['info'] != null ? new MainConfigInfo.fromJson(json['info']) : null;
    body = json['body'] != null ? new MainConfigBody.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['version'] = this.version;
    data['date'] = this.date;
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    return data;
  }
}

class MainConfigInfo {
  String name;
  String company;
  String domain;

  MainConfigInfo({this.name, this.company, this.domain});

  MainConfigInfo.fromJson(Map<String, dynamic> json) {
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

class MainConfigBody {
  List<MainConfigTabBars> tabBars;
  String description;

  MainConfigBody({this.tabBars, this.description});

  MainConfigBody.fromJson(Map<String, dynamic> json) {
    if (json['tabBars'] != null) {
      tabBars = new List<MainConfigTabBars>();
      json['tabBars'].forEach((v) {
        tabBars.add(new MainConfigTabBars.fromJson(v));
      });
    }
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tabBars != null) {
      data['tabBars'] = this.tabBars.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    return data;
  }
}

class MainConfigTabBars {
  String title;
  String icon;
  String route;
  String params;

  MainConfigTabBars({this.title, this.icon, this.route, this.params});

  MainConfigTabBars.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    route = json['route'];
    params = json['params'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['route'] = this.route;
    data['params'] = this.params;
    return data;
  }
}