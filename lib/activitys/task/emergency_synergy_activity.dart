import 'package:flutter/material.dart';
import 'package:flutter_basics/activitys/task/emergency_synergy_item_activity.dart';
import 'package:flutter_basics/common_widgets/custom_app_bar.dart';

/// 应急协同
class EmergencySynergyActivity extends StatefulWidget {
  EmergencySynergyActivity({Key key}) : super(key: key);

  @override
  _EmergencySynergyActivityState createState() => _EmergencySynergyActivityState();
}

class _EmergencySynergyActivityState extends State<EmergencySynergyActivity> {


  _searchBtnOnPressed(){
    debugPrint("WTF?");
  }

  _header() {
    
  }

  _buildBody() {
    return ListView(
      children: <Widget>[
        /// header
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 15),
            Icon(Icons.history, size: 40, color: Colors.blue,),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8,width: 80,
                  child: LinearProgressIndicator(backgroundColor: Colors.grey[400],valueColor: AlwaysStoppedAnimation(Colors.blue),value: .5, ),
                ),
                Text("剩余: 02:03:20", style: TextStyle(color: Colors.blue))
              ],
            ),
            SizedBox(width: 10),
            Container(color: Colors.grey[400], height: 30, width: 1,),
            SizedBox(width: 10),
            Text("航天微电机大厦 A 栋"),
            FlatButton(child: Text("详情 v", textAlign: TextAlign.end,), onPressed: null)
          ],
        ),
        SizedBox(height: 10),
        Container(color: Colors.grey.shade300,height: 1,),

        /// body
        Container(
          color: Color(0xFFEEF1F5), 
          child: Column(
            children: <Widget>[
              EmergencySynergyItemActivity(title: "人员", isOpen: true,),
              EmergencySynergyItemActivity(title: "洒水车",),
              EmergencySynergyItemActivity(title: "救护车",),
              EmergencySynergyItemActivity(title: "救护车",),
              EmergencySynergyItemActivity(title: "救护车",),
              EmergencySynergyItemActivity(title: "救护车",),
              EmergencySynergyItemActivity(title: "救护车",),
            ],
          ),
        )    
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "应急协同",
        trailingWidget: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: _searchBtnOnPressed,)
          ],
        ),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: _buildBody(),
      ),
    );
  }
}