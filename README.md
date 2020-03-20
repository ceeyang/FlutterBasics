<!--
 * @Author: your name
 * @Date: 2020-03-18 15:28:24
 * @LastEditTime: 2020-03-20 10:09:48
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: /FlutterBasics/README.md
 -->
# flutter_basics

A new Flutter project.

## Flutter Version
    flutter --version
  
    Flutter 1.12.13+hotfix.8 • channel stable • https://github.com/flutter/flutter.git
    Framework • revision 0b8abb4724 (4 weeks ago) • 2020-02-11 11:44:36 -0800
    Engine • revision e1e6ced81d
    Tools • Dart 2.7.0

## How to use
    dependencies:
      # add flutter_basics to you dependencies
      flutter_basics:
        git: https://github.com/ceeyang/FlutterBasics.git
        
    main.dart
       # Use the CustomApp as your default App
       void main() => runApp(CustomApp(config: (){
          print("config------------------");
       }));

## 关于 JSON 
    推荐使用以下两个工具 
    - https://www.json.cn/  JSON格式化
    - https://javiercbk.github.io/json_to_dart/  JSON 转 Dart 模型


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
