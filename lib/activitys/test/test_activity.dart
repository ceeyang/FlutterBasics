import 'package:flutter/material.dart';

class SampleAppPage extends StatefulWidget {
  
  final int _numberOfRow;
  final List<Object> _dataSources;

  SampleAppPage({
    Key key,
    int numberOfRow,
    List<Object> dataSources,
  }) : this._numberOfRow = numberOfRow ?? 4,
       this._dataSources = dataSources ?? [],
       super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    
    print(widget._numberOfRow);
    print(widget._dataSources);

  

    var numberOfLine = 0;
    var index = 0;
    for (var i = 0; i < widget._dataSources.length; i++) {

      print("//////: ${i / widget._numberOfRow}");
      print("%%%%%%: ${i % widget._numberOfRow}");

      index = i % widget._numberOfRow == 0 ? index : 0 ;
      numberOfLine += i % widget._numberOfRow == 0 ? 0 : 1;

      index += 1;
    }

    print(index);
    print(numberOfLine);
  }

  Widget gridViewDefaultCount(List<String> list) {
    return GridView.count(
      padding: EdgeInsets.all(10.0),
      //一行多少个
      crossAxisCount: 4,
      //滚动方向
      scrollDirection: Axis.vertical,
      // 左右间隔
      crossAxisSpacing: 10.0,
      // 上下间隔
      mainAxisSpacing: 10.0,
      //宽高比
      childAspectRatio: 2 / 2,
      //设置itemView 
      children: initListWidget(list),
    );
  }

  List<Widget> initListWidget(List<String> list) {
    List<Widget> lists = [];
    for (var item in list) {
      lists.add(Container(
        height: 50.0,
        width: 50.0,
        color: Colors.yellow,
        child: Center(
            child: Text(item)),
      ));
    }
    return lists;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: gridViewDefaultCount(widget._dataSources)
    );
  }

  Widget getRow(int i) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Row $i"),
      ),
      onTap: () {
        setState(() {
          widgets = List.from(widgets);
          widgets.add(getRow(widgets.length + 1));
          print('row $i');
        });
      },
    );
  }
}

class TestActivity extends StatefulWidget {
  TestActivity({Key key}) : super(key: key);

  @override
  _TestActivityState createState() => _TestActivityState();
}

class _TestActivityState extends State<TestActivity> {

  List<String> dataSource = [
    "fuck",
    "fuck",
    "shit",
    "what?",
    "fuck",
    "shit",
    "what?",
    "fuck",
    "shit",
    "what?",
    "shit",
    "what?",
    "kidding?",
    "23333"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(dataSource);
  }

  @override
  Widget build(BuildContext context) {
    return SampleAppPage(
      dataSources: dataSource,
      numberOfRow: 5,
    );
  }
}

class Collection {
  String name;
  String route;

  Collection({this.name, this.route});

  Collection.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    route = json['route'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['route'] = this.route;
    return data;
  }
}

class CollectionActivity extends StatefulWidget {
  CollectionActivity({Key key}) : super(key: key);

  @override
  _CollectionActivityState createState() => _CollectionActivityState();
}

class _CollectionActivityState extends State<CollectionActivity> {
  @override
  Widget build(BuildContext context) {
    return Container(
       //child: ,
    );
  }
}