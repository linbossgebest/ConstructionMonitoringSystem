import 'dart:io';

import 'package:ditu/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'newpagepoint.dart';
import 'newpageword.dart';
import 'newpagestate.dart';
import 'amap.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'login.dart';
import 'provider.dart';
/*class Newpage extends StatefulWidget {
  Newpage(
      {Key key,
      this.projectName,
      this.pointCount,
      this.oneSubProject,
      this.wordFiles,
      this.datetime,
      this.allPhase,
      this.managementByOrgaId,
      this.url,
      this.projectInfo,
      this.sensorinfo})
      : super(key: key);
  String projectName = '';
  List pointCount = [];
  var oneSubProject;
  List wordFiles = [];
  var datetime;
  List allPhase = [];
  List managementByOrgaId = [];
  String url = '';
  List projectInfo = [];
  List sensorinfo = [];
  @override
  _NewpageState createState() => _NewpageState(
      this.projectName,
      this.pointCount,
      this.oneSubProject,
      this.wordFiles,
      this.datetime,
      this.allPhase,
      this.managementByOrgaId,
      this.url,
      this.projectInfo,
      this.sensorinfo);
}

class _NewpageState extends State<Newpage> {
  String projectName = '';
  List pointCount = [];
  var oneSubProject;
  List wordFiles = [];
  var datetime;
  _NewpageState(
      this.projectName,
      this.pointCount,
      this.oneSubProject,
      this.wordFiles,
      this.datetime,
      this.allPhase,
      this.managementByOrgaId,
      this.url,
      this.projectInfo,
      this.sensorinfo);
  int _currentindex = 0;
  List<Widget> list = [];
  List allPhase = [];
  List<DataRow> stageContent = [];
  List pointStype = ['应变测点', '变形测点', '索力测点', '环境测点'];
  List stage = ['当前施工阶段', '开始时间', '结束时间'];
  List managementByOrgaId = [];
  String url = '';
  List projectInfo = [];
  List sensorinfo = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //list.add(firstPage());
    list.add(Newpagemessage(
        pointCount: pointCount,
        allPhase: allPhase,
        datetime: datetime,
        managementByOrgaId: managementByOrgaId,
        url: url,
        projectInfo: projectInfo,
        oneSubProject: oneSubProject,
        sensorinfo: sensorinfo));
    list.add(Newpagepoint(
        pointCount: pointCount, oneSubProject: oneSubProject, url: url));
    list.add(Newpageword(
        oneSubProject: oneSubProject, managementByOrgaId: managementByOrgaId));
    list.add(Newpagestate(
        wordFiles: wordFiles, managementByOrgaId: managementByOrgaId));
    //print(datetime);
    //print(allPhase[0].startTime);
    //print(managementByOrgaId);
    //getstage();
    //print(oneSubProject);
    //print(sensorinfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(projectName),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text("监控首页")),
          BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text("监测信息")),
          BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text("控制指令")),
          BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text("文件资料")),
        ],
        onTap: (v) {
          setState(() {
            _currentindex = v;
          });
        },
      ),
      body: IndexedStack(
        index: _currentindex,
        children: list,
      ),
    );
  }
}

class Newpagemessage extends StatefulWidget {
  Newpagemessage(
      {Key key,
      this.pointCount,
      this.datetime,
      this.allPhase,
      this.managementByOrgaId,
      this.url,
      this.projectInfo,
      this.oneSubProject,
      this.sensorinfo})
      : super(key: key);
  List allPhase = [];
  var datetime;
  List pointCount = [];
  List managementByOrgaId = [];
  String url = '';
  List projectInfo = [];
  var oneSubProject;
  List sensorinfo = [];
  @override
  _NewpagemessageState createState() => _NewpagemessageState(
      this.pointCount,
      this.datetime,
      this.allPhase,
      this.managementByOrgaId,
      this.url,
      this.projectInfo,
      this.oneSubProject,
      this.sensorinfo);
}

class _NewpagemessageState extends State<Newpagemessage> {
  _NewpagemessageState(
      this.pointCount,
      this.datetime,
      this.allPhase,
      this.managementByOrgaId,
      this.url,
      this.projectInfo,
      this.oneSubProject,
      this.sensorinfo);
  List<DataRow> stageContent = [];
  List pointStype = ['应变测点', '变形测点', '索力测点', '环境测点'];
  List stage = ['当前施工阶段', '开始时间', '结束时间'];
  List pointCount = [];
  List allPhase = [];
  var datetime;
  List wordtable = ['文件名', '上传者', '上传时间'];
  List managementByOrgaId = [];
  List<DataRow> wordContent = [];
  String url = '';
  List projectInfo = [];
  var oneSubProject;
  //0930
  List typelist = [];
  List typelistdif = [];
  String typetext = '';
  Map type = {'2': '应力', '3': '位移', '4': '索力', '5': '环境'};
  var content;
  List<DataRow> dataRow = [];
  List sensorinfo = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getstage();
    getwordtable();
    //print(projectInfo);
    //print(subproject[4]);
    //print(oneSubProject.latitude);
    getContent();
    //print(sensorinfo);
    //print(allPhase);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(237, 237, 237, 1)
          //color: Colors.blue
          ),
      child: Column(
        children: <Widget>[
          Expanded(
              child: ListView(children: [
            /*LocationPage(
              latitude: oneSubProject.latitude,
              longitude: oneSubProject.longitude,
            ),*/
            SizedBox(height: 5),
            /*Container(
              //width: MediaQuery.of(context).size.width-22,
              //height: 150,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('桥梁信息：'),
                    Row(children: [Text('项目名称：'), Text(projectInfo[0] ?? '')]),
                    SizedBox(height: 6),
                    Row(children: [Text('项目所在地：'), Text(projectInfo[1] ?? '')]),
                    SizedBox(height: 6),
                    Row(children: [Text('建设单位：'), Text(projectInfo[2] ?? '')]),
                    SizedBox(height: 6),
                    Row(children: [Text('服务内容：'), Text(projectInfo[3] ?? '')]),
                    SizedBox(height: 6),
                    Row(children: [Text('项目描述：'), Text(projectInfo[4] ?? '')]),
                    SizedBox(height: 6),
                    Row(children: [Text('创建时间：'), Text(projectInfo[5] ?? '')]),
                  ]),
            ),*/
            /*LocationPage(
              latitude: oneSubProject.latitude,
              longitude: oneSubProject.longitude,
            ),*/
            Container(
              //width: MediaQuery.of(context).size.width-22,
              //height: 150,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white),
              child: Container(
                  margin: EdgeInsets.all(5),
                  width: 200,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('现场照片：'),
                        //Image.file(File(url),   //0715改
                        //Image.network('http://192.168.6.166:8101/GeneralProjDatum/AE132255F5E0102A691205F83FE7DD87D77C.png',
                        Image.network(
                          'http://222.72.129.158:18101/GeneralProjDatum/AE132255F5E0102A691205F83FE7DD87D77C.png',
                          fit: BoxFit.fill,
                        )
                      ])),
            ),
            SizedBox(height: 5),
            Container(
              //width: MediaQuery.of(context).size.width-22,
              //height: 150,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('测点统计：'),
                  /*SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        columns: pointStype
                            .map((e) => DataColumn(
                                label: Container(width: 50, child: Text(e))))
                            .toList(),
                        rows: [
                          DataRow(
                              cells: pointCount
                                  .map((e) => DataCell(Container(
                                      width: 50,
                                      child: Text(
                                        e.toString(),
                                        textAlign: TextAlign.center,
                                      ))))
                                  .toList())
                        ]),
                  ),*/
                  Container(
                    height: 200,
                    child: _simplePie(),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              //width: MediaQuery.of(context).size.width-22,
              //height: 150,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('施工进度：'),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: DataTable(
                          columns: stage
                              .map((e) => DataColumn(label: Text(e)))
                              .toList(),
                          /*rows:[
                    DataRow(cells: stageContent.map((e) => DataCell(Text(e.toString()))).toList())
                  ]*/
                          rows: stageContent,
                        ),
                        width: MediaQuery.of(context).size.width - 20,
                      ),
                    ),
                    SizedBox(height: 10),
                  ]),
            ),
            SizedBox(height: 5),
            /*Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(237, 237, 237, 1)),
                child: Column(children: [
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      //width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: DataTable(
                        columns: ['序号', '施工阶段', '测试内容', '监控状态']
                            .map((e) => DataColumn(label: Text(e)))
                            .toList(),
                        //rows: dataRow,
                        rows: [
                          DataRow(
                              cells: ['1', '1', '1', '1']
                                  .map((e) => DataCell(Text(e)))
                                  .toList())
                        ],
                      ),
                    ),
                  ))
                ])),*/
            Container(
              //width: MediaQuery.of(context).size.width-22,
              //height: 150,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('指令通知：'),
                    SingleChildScrollView(
                      //scrollDirection:Axis.vertical,
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: ['序号', '施工阶段', '测试内容', '监控状态']
                            .map((e) => DataColumn(label: Text(e)))
                            .toList(),
                        /*rows: [
                          DataRow(
                              cells: ['1', '1', '1', '1']
                                  .map((e) => DataCell(Text(e)))
                                  .toList())
                        ],*/
                        rows: dataRow,
                      ),
                    ),
                    SizedBox(height: 10),
                  ]),
            ),
            SizedBox(height: 5),
            Container(
              //width: MediaQuery.of(context).size.width-22,
              //height: 150,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('指令通知：'),
                    SingleChildScrollView(
                      //scrollDirection:Axis.vertical,
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: wordtable
                            .map((e) => DataColumn(label: Text(e)))
                            .toList(),
                        rows: wordContent,
                      ),
                    ),
                    SizedBox(height: 10),
                  ]),
            ),
          ]))
        ],
      ),
    );
  }

  getstage() {
    stageContent = [];
    for (int a = 0; a < allPhase.length; a++) {
      if (allPhase[a].startTime != null && allPhase[a].endTime != null) {
        if (DateTime.parse(allPhase[a].startTime).millisecondsSinceEpoch <
                datetime.millisecondsSinceEpoch &&
            DateTime.parse(allPhase[a].endTime).millisecondsSinceEpoch >
                datetime.millisecondsSinceEpoch) {
          /*stageContent.add(allPhase[a].name);
         stageContent.add(allPhase[a].startTime);
         stageContent.add(allPhase[a].endTime);*/
          int b = allPhase[a].startTime.toString().indexOf('T');
          String starttime = allPhase[a].startTime.toString().substring(0, b);
          String endtime = allPhase[a].endTime.toString().substring(0, b);
          var content = DataRow(
              cells: [
            allPhase[a].name,
            starttime,
            endtime,
          ].map((e) => DataCell(Text(e))).toList());
          stageContent.add(content);
        }
      }
    }
    if (stageContent.length == 0) {
      /*setState(() {
      stageContent.add('施工已结束');
      stageContent.add('-');
      stageContent.add('-');
      });*/
      var content = DataRow(
          cells: [
        '当前无施工',
        '-',
        '-',
      ].map((e) => DataCell(Text(e))).toList());
      stageContent.add(content);
    }
    //print(stageContent);
  }

  getwordtable() {
    wordContent = [];
    for (int a = 0; a < managementByOrgaId.length; a++) {
      int b = managementByOrgaId[a].time.toString().indexOf('T');
      String time = managementByOrgaId[a].time.toString().substring(0, b);
      var content = DataRow(
          cells: [
        managementByOrgaId[a].orderFileName,
        managementByOrgaId[a].sendName,
        time,
      ]
              .map((e) => DataCell(Container(
                  width: 110,
                  height: 100,
                  child: Text(
                    e,
                    maxLines: 5,
                    softWrap: true,
                  ))))
              .toList());
      wordContent.add(content);
    }
  }

  Widget _simplePie() {
    //var random = Random();

    var data = [
      PieSales('应变', pointCount[0],
          charts.ColorUtil.fromDartColor(Color(0xFF126610))),
      PieSales('变形', pointCount[1],
          charts.ColorUtil.fromDartColor(Color(0xFF522210))),
      PieSales('索力', pointCount[2],
          charts.ColorUtil.fromDartColor(Color(0xFF929910))),
      PieSales('环境', pointCount[3],
          charts.ColorUtil.fromDartColor(Color(0xFFD26699))),
    ];

    var seriesList = [
      charts.Series<PieSales, String>(
        id: 'Sales',
        domainFn: (PieSales sales, _) => sales.name,
        measureFn: (PieSales sales, _) => sales.sales,
        colorFn: (PieSales sales, _) => sales.color,
        data: data,
        labelAccessorFn: (PieSales row, _) => '${row.name}: ${row.sales}',
      )
    ];

    return charts.PieChart(seriesList,
        animate: true,
        defaultRenderer: new charts.ArcRendererConfig(arcRendererDecorators: [
          new charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.outside)
        ]));
  }

  getContent() {
    //stage = [];
    dataRow = [];
    /*for (int a = 0; a < allPhase.length; a++) {*/
    for (int a = allPhase.length - 1; a >= 0; a--) {
      typetext = '';
      typelist = [];
      typelistdif = [];
      for (int b = 0; b < sensorinfo.length; b++) {
        if (sensorinfo[b].installStage == allPhase[a].id) {
          typelist.add(sensorinfo[b].sensorType);
          //typetext=typetext+type[sensorinfo[b].sensorType.toString()];
        }
      }
      for (int c = 0; c < typelist.length; c++) {
        if (typelistdif.indexOf(typelist[c]) < 0) {
          typelistdif.add(typelist[c]);
        }
      }
      for (int d = 0; d < typelistdif.length; d++) {
        if (typetext == '') {
          typetext = typetext + type[typelistdif[d].toString()];
        } else {
          typetext = typetext + '、' + type[typelistdif[d].toString()];
        }

        //typetext=typetext.substring(1);
      }
      content = DataRow(
          cells: [a.toString(), allPhase[a].name, typetext, '正常']
              .map((e) => DataCell(Text(e)))
              .toList());
      dataRow.add(content);
    }
    print(typetext);
  }
}

class PieSales {
  //final int year;
  final String name;
  final int sales;
  final charts.Color color;

  PieSales(this.name, this.sales, this.color);
}*/

class Newpage extends StatefulWidget {
  Newpage(
      {Key key,
      this.imgurl,
      this.oneProjectName,
      this.subprojectId,
      this.projectPoint,
      this.allphase,
      this.wordFiles,
      this.sensor})
      : super(key: key);
  String imgurl = '';
  String oneProjectName = '';
  int subprojectId;
  List projectPoint = [];
  List allphase = [];
  List wordFiles = [];
  List sensor = [];
  @override
  _NewpageState createState() => _NewpageState(
      this.imgurl,
      this.oneProjectName,
      this.subprojectId,
      this.projectPoint,
      this.allphase,
      this.wordFiles,
      this.sensor);
}

class _NewpageState extends State<Newpage> {
  _NewpageState(this.imgurl, this.oneProjectName, this.subprojectId,
      this.projectPoint, this.allphase, this.wordFiles, this.sensor);
  String imgurl = '';
  String oneProjectName = '';
  int subprojectId;
  int _currentindex = 0;
  List<Widget> list = [];
  List projectPoint = [];
  List allphase = [];
  List wordFiles = [];
  List sensor = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oneProjectName =
        Provider.of<Counter>(context, listen: false).oneProjectName;
    /*list.add(Newpagemessage(
        imgurl: imgurl,
        projectPoint: projectPoint,
        allphase: allphase,
        wordFiles: wordFiles
        ));*/
    list.add(Newpagemessage());
    /*list.add(
        Newpagepoint(subprojectId: subprojectId, projectPoint: projectPoint));*/
    list.add(Newpagepoint());
    /*list.add(Newpageword(
        wordFiles: wordFiles, sensorinfo: sensor, allphase: allphase));*/
    list.add(Newpageword());
    //list.add(Newpagestate(wordFiles: wordFiles));
    list.add(Newpagestate());
    //print(Provider.of<Counter>(context).wordlist.runtimeType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            title: Text(oneProjectName),
          ),
          preferredSize: Size.fromHeight(30)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("监控首页")),
          BottomNavigationBarItem(icon: Icon(Icons.message), title: Text("监测信息")),
          BottomNavigationBarItem(
              icon: Icon(Icons.info), title: Text("控制指令")),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter), title: Text("文件资料")),
        ],
        onTap: (v) {
          setState(() {
            _currentindex = v;
          });
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage("lib/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: IndexedStack(
          index: _currentindex,
          children: list,
        ),
      ),
    );
  }
}

class Newpagemessage extends StatefulWidget {
  Newpagemessage(
      {Key key,
      this.imgurl,
      this.oneProjectName,
      this.projectPoint,
      this.allphase,
      this.wordFiles})
      : super(key: key);
  String imgurl = '';
  String oneProjectName = '';
  List projectPoint = [];
  List allphase = [];
  List wordFiles = [];
  @override
  _NewpagemessageState createState() => _NewpagemessageState(this.imgurl,
      this.oneProjectName, this.projectPoint, this.allphase, this.wordFiles);
}

class _NewpagemessageState extends State<Newpagemessage> {
  _NewpagemessageState(this.imgurl, this.oneProjectName, this.projectPoint,
      this.allphase, this.wordFiles);
  String imgurl = '';
  String oneProjectName = '';
  List projectPoint = [];
  List allphase = [];
  List<DataRow> stageContent = [];
  var datetime;
  List stage = ['当前施工阶段', '开始时间', '结束时间'];
  List wordFiles = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imgurl = Provider.of<Counter>(context, listen: false).imgurl;
    oneProjectName =
        Provider.of<Counter>(context, listen: false).oneProjectName;
    projectPoint = Provider.of<Counter>(context, listen: false).projectPoint;
    allphase = Provider.of<Counter>(context, listen: false).allphase;
    wordFiles = Provider.of<Counter>(context, listen: false).wordFiles;
    print(allphase);
    //print(wordFiles.length);
    datetime = DateTime.now();
    getstage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
              child: ListView(children: [
            /*LocationPage(
              latitude: oneSubProject.latitude,
              longitude: oneSubProject.longitude,
            ),*/
            SizedBox(height: 5),

            /*LocationPage(
              latitude: oneSubProject.latitude,
              longitude: oneSubProject.longitude,
            ),*/
            Container(
              //width: MediaQuery.of(context).size.width-22,
              //height: 150,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white),
              child: Container(
                  margin: EdgeInsets.all(5),
                  width: 200,
                  child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text('现场照片：'),
                        ),
                        Image.network(
                          imgurl,
                          fit: BoxFit.fill,
                        )
                      ])),
            ),
            SizedBox(height: 5),
            Container(
              //width: MediaQuery.of(context).size.width-22,
              //height: 150,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('测点统计：'),
                  /*SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        columns: pointStype
                            .map((e) => DataColumn(
                                label: Container(width: 50, child: Text(e))))
                            .toList(),
                        rows: [
                          DataRow(
                              cells: pointCount
                                  .map((e) => DataCell(Container(
                                      width: 50,
                                      child: Text(
                                        e.toString(),
                                        textAlign: TextAlign.center,
                                      ))))
                                  .toList())
                        ]),
                  ),*/
                  Container(
                    height: 200,
                    child: _simplePie(),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              //width: MediaQuery.of(context).size.width-22,
              //height: 150,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('施工进度：'),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: DataTable(
                          columns: stage
                              .map((e) => DataColumn(label: Text(e)))
                              .toList(),
                          /*rows:[
                    DataRow(cells: stageContent.map((e) => DataCell(Text(e.toString()))).toList())
                  ]*/
                          rows: stageContent,
                        ),
                        width: MediaQuery.of(context).size.width - 20,
                      ),
                    ),
                    SizedBox(height: 10),
                  ]),
            ),
            SizedBox(height: 5),
            /*Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(237, 237, 237, 1)),
                child: Column(children: [
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      //width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: DataTable(
                        columns: ['序号', '施工阶段', '测试内容', '监控状态']
                            .map((e) => DataColumn(label: Text(e)))
                            .toList(),
                        //rows: dataRow,
                        rows: [
                          DataRow(
                              cells: ['1', '1', '1', '1']
                                  .map((e) => DataCell(Text(e)))
                                  .toList())
                        ],
                      ),
                    ),
                  ))
                ])),*/
            /*Container(
              //width: MediaQuery.of(context).size.width-22,
              //height: 150,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('监控状态：'),
                    /*SingleChildScrollView(
                      //scrollDirection:Axis.vertical,
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: ['序号', '施工阶段', '测试内容', '监控状态']
                            .map((e) => DataColumn(label: Text(e)))
                            .toList(),
                        /*rows: [
                          DataRow(
                              cells: ['1', '1', '1', '1']
                                  .map((e) => DataCell(Text(e)))
                                  .toList())
                        ],*/
                        rows: dataRow,
                      ),
                    ),*/
                    SizedBox(height: 10),
                  ]),
            ),*/
            /*SizedBox(height: 5),
            Container(
              //width: MediaQuery.of(context).size.width-22,
              //height: 150,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('指令通知：'),
                    /*SingleChildScrollView(
                      //scrollDirection:Axis.vertical,
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: wordtable
                            .map((e) => DataColumn(label: Text(e)))
                            .toList(),
                        rows: wordContent,
                      ),
                    ),*/
                    SizedBox(height: 10),
                  ]),
            ),*/
          ]))
        ],
      ),
    );
  }

  Widget _simplePie() {
    //var random = Random();

    var data = [
      PieSales('应变', projectPoint[0].length,
          charts.ColorUtil.fromDartColor(Color(0xFF126610))),
      PieSales('变形', projectPoint[1].length,
          charts.ColorUtil.fromDartColor(Color(0xFF522210))),
      PieSales('索力', projectPoint[2].length,
          charts.ColorUtil.fromDartColor(Color(0xFF929910))),
      PieSales('环境', projectPoint[3].length,
          charts.ColorUtil.fromDartColor(Color(0xFFD26699))),
    ];

    var seriesList = [
      charts.Series<PieSales, String>(
        id: 'Sales',
        domainFn: (PieSales sales, _) => sales.name,
        measureFn: (PieSales sales, _) => sales.sales,
        colorFn: (PieSales sales, _) => sales.color,
        data: data,
        labelAccessorFn: (PieSales row, _) => '${row.name}: ${row.sales}',
      )
    ];

    return charts.PieChart(seriesList,
        animate: true,
        defaultRenderer: new charts.ArcRendererConfig(arcRendererDecorators: [
          new charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.outside)
        ]));
  }

  getstage() {
    stageContent = [];
    for (int a = 0; a < allphase.length; a++) {
      if (allphase[a]['startTime'] != null && allphase[a]['endTime'] != null) {
        if (DateTime.parse(allphase[a]['startTime']).millisecondsSinceEpoch <
                datetime.millisecondsSinceEpoch &&
            DateTime.parse(allphase[a]['endTime']).millisecondsSinceEpoch >
                datetime.millisecondsSinceEpoch) {
          int b = allphase[a]['startTime'].toString().indexOf('T');
          String starttime =
              allphase[a]['startTime'].toString().substring(0, b);
          String endtime = allphase[a]['endTime'].toString().substring(0, b);
          var content = DataRow(
              cells: [
            allphase[a]['name'],
            starttime,
            endtime,
          ].map((e) => DataCell(Text(e))).toList());
          stageContent.add(content);
        }
      }
    }
    if (stageContent.length == 0) {
      var content = DataRow(
          cells: [
        '当前无施工',
        '-',
        '-',
      ].map((e) => DataCell(Text(e))).toList());
      stageContent.add(content);
    }
    //print(stageContent);
  }
}

class PieSales {
  //final int year;
  final String name;
  final int sales;
  final charts.Color color;

  PieSales(this.name, this.sales, this.color);
}
