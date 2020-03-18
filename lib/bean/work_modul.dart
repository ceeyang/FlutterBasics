import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// 工作模块
class WorkModul {

  /// 标题
  String title;
  /// 图标,当图标为空时,加载本地默认图标
  String imgUrl;
  /// 跳转目的地
  String destination;
  /// 参数
  String params;

  /// 默认图标
  Icon icon = Icon(Icons.message);

  WorkModul(
    this.title, 
    this.imgUrl,
    this.icon, 
    this.destination,
    this.params
  );

  WorkModul.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imgUrl = json['imgUrl'];
    destination = json['destination'];
    params = json['params'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['destination'] = this.destination;
    data['imgUrl'] = this.imgUrl;
    data['params'] = this.params;
    return data;
  }
}
