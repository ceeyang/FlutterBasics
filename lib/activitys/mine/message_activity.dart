import 'package:flutter/material.dart';
import 'package:flutter_basics/activitys/configurable/widgets/config_moduls_activity.dart';

class MessageActivity extends StatefulWidget {
  MessageActivity({Key key}) : super(key: key);

  @override
  _MessageActivityState createState() => _MessageActivityState();
}

class _MessageActivityState extends State<MessageActivity> {

  List<String> messages = [
    "msg0",
    "msg1",
    "msg2"
  ];

  Widget _listViewBuilder() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => CardModulsActivity(),
      itemCount: messages.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("消息")
      ),
      body: _listViewBuilder(),
    );
  }
}