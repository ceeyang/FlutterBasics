import 'package:flutter/material.dart';
import 'package:flutter_basics/plugins/plugin_temp_view.dart';
import 'package:flutter_basics/utils/custom_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigurableActivity extends StatefulWidget {
  ConfigurableActivity({Key key}) : super(key: key);

  @override
  _ConfigurableActivityState createState() => _ConfigurableActivityState();
}

class _ConfigurableActivityState extends State<ConfigurableActivity> {

  bool _configLoaded = false;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((it){
      
    });

    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        _configLoaded = true;
      });
    });
  }

  Widget tempItem() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                color: Colors.blueGrey,
                width: 50,
                height: 50,
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 130,
                    height: 15,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width - 150,
                    height: 15,
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            color: Colors.blueGrey,
            width: MediaQuery.of(context).size.width - 30,
            height: 50,
          ),
        ],
      )
    );
  }
  
  _listViewBuilder(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tempItem();
      },
      itemCount: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Config")
      ),
      body: _configLoaded ? _listViewBuilder(context) : PluginTempViewActivity(),
    );
  }
}