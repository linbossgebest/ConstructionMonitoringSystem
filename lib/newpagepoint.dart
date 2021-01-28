import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:newjiankong/camera.dart';
import 'newpagepointone.dart';
import 'login.dart';
import 'camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'provider.dart';

/*class Newpagepoint extends StatefulWidget {
  Newpagepoint({Key key, this.pointCount, this.oneSubProject, this.url})
      : super(key: key);
  List pointCount = [];
  var oneSubProject;
  String url = '';
  @override
  _NewpagepointState createState() =>
      _NewpagepointState(this.pointCount, this.oneSubProject, this.url);
}

class _NewpagepointState extends State<Newpagepoint> {
  _NewpagepointState(this.pointCount, this.oneSubProject, this.url);
  List pointCount = [];
  var oneSubProject;
  int sensorType;
  List sensorOne = ['测点编号', '安装阶段', '上下缘'];
  List sensorTwo = ['测点编号', '安装阶段', '位移方向'];
  List sensorThree = ['测点编号', '安装阶段'];
  List sensorFour = ['测点编号', '安装阶段'];
  List sensor = ['测点编号', '安装阶段'];
  List sensorinfo = [];
  int count;
  List allPhase = [];
  List bianhao = ['请选择'];
  String url = '';
  bool offstage1 = true;
  bool offstage2 = true;
  bool offstage3 = true;
  bool offstage4 = true;
  String sign = '>';
  int index = 1;
  Map mapStyle = {
    1: '应变测点图',
    2: '变形测点图',
    3: '索力测点图',
    4: '环境测点图',
  };
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Color.fromRGBO(237, 237, 237, 1)
            //color: Colors.blue
            ),
        child: Center(
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              /*Expanded(
             child: ListView(
               children:[*/
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.apps),
                        Text('应变测点(' + pointCount[0].toString() + '个)'),
                        GestureDetector(child: Text(sign))
                      ],
                    ),
                    onTap: () {
                      /*setState(() {
               sensorType=2;
               sensor=sensorOne;
             });
             getSensorInfo();*/
                      /*Navigator.of(context).push(
                MaterialPageRoute(builder: (context){
                return Newpagepointone(pointNumber: 0,oneSubProject: oneSubProject,sensorType: sensorType,);
             })
          );*/
                      setState(() {
                        /*if(offstage4==true){
                 offstage4=!offstage4;
               }*/
                        if (offstage4 == true) {
                          offstage4 = false;
                          index = 1;
                        } else {
                          if (index == 1) {
                            offstage4 = true;
                          } else {
                            offstage4 = false;
                            index = 1;
                          }
                        }
                        /*offstage4=!offstage4;
            index=1;*/
                      });
                    },
                  )),
              /*Offstage(
           offstage: offstage1,
           child: GestureDetector(
             child:Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    //color: Colors.blue,
                    //width: MediaQuery.of(context).size.width - 22,
                    //height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text('应变测点图'),
                        Image.file(File(url),
                  fit: BoxFit.fill,)
                      ]
                    ),
                    )
                  ),
                onTap: (){
                  setState(() {
               sensorType=2;
               sensor=sensorOne;
             });
             getSensorInfo();
                },
           )
         ),*/
              SizedBox(height: 10),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.apps),
                        Text('变形测点(' + pointCount[1].toString() + '个)'),
                        Text('>')
                      ],
                    ),
                    onTap: () {
                      /*setState(() {
               sensorType=3;
               sensor=sensorTwo;
             });
             getSensorInfo();*/
                      setState(() {
                        /*if(offstage4==true){
                 offstage4=!offstage4;
               }*/
                        if (offstage4 == true) {
                          offstage4 = false;
                          index = 2;
                        } else {
                          if (index == 2) {
                            offstage4 = true;
                          } else {
                            offstage4 = false;
                            index = 2;
                          }
                        }
                        /*offstage4=!offstage4;
               index=2;*/
                      });
                      /*Navigator.of(context).push(
                MaterialPageRoute(builder: (context){
                return Newpagepointone(pointNumber: 1,oneSubProject: oneSubProject,sensorType: sensorType,);
              })
           );*/
                    },
                  )),
              /*Offstage(
           offstage: offstage2,
           child: GestureDetector(
             child:Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    //color: Colors.blue,
                    //width: MediaQuery.of(context).size.width - 22,
                    //height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text('变形测点图'),
                        Image.file(File(url),
                  fit: BoxFit.fill,)
                      ]
                    ),
                    )
                  ),
                onTap: (){
                  setState(() {
               sensorType=3;
               sensor=sensorTwo;
             });
             getSensorInfo();
                },
           )
         ),*/
              SizedBox(height: 10),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.apps),
                        Text('索力测点(' + pointCount[2].toString() + '个)'),
                        GestureDetector(child: Text('>'))
                      ],
                    ),
                    onTap: () {
                      /* setState(() {
               sensorType=4;
               sensor=sensorThree;
             });
             getSensorInfo();*/
                      setState(() {
                        /*if(offstage4==true){
                 offstage4=!offstage4;
               }*/
                        if (offstage4 == true) {
                          offstage4 = false;
                          index = 3;
                        } else {
                          if (index == 3) {
                            offstage4 = true;
                          } else {
                            offstage4 = false;
                            index = 3;
                          }
                        }
                        /*offstage4=!offstage4;
               index=3;*/
                      });
                      /*Navigator.of(context).push(
                MaterialPageRoute(builder: (context){
                return Newpagepointone(pointNumber: 2,oneSubProject: oneSubProject,sensorType: sensorType,);
              })
           );*/
                    },
                  )),
              /*Offstage(
           offstage: offstage3,
           child: GestureDetector(
             child:Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    //color: Colors.blue,
                    //width: MediaQuery.of(context).size.width - 22,
                    //height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text('索力测点图'),
                        Image.file(File(url),
                  fit: BoxFit.fill,)
                      ]
                    ),
                    )
                  ),
                onTap: (){
                  setState(() {
               sensorType=4;
               sensor=sensorThree;
             });
             getSensorInfo();
                },
           )
         ),*/
              SizedBox(height: 10),
              Container(
                  //color: Colors.white,
                  decoration: BoxDecoration(
                      //color: Colors.blue,
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.apps),
                        Text('环境测点(' + pointCount[3].toString() + '个)'),
                        GestureDetector(child: Text('>'))
                      ],
                    ),
                    onTap: () {
                      /*sensorType=5;
             sensor=sensorFour;
             getSensorInfo();*/
                      setState(() {
                        /*if(offstage4==true){
                 offstage4=!offstage4;
               }if(offstage4==false&&index==4){
                 offstage4=!offstage4;
               }*/
                        if (offstage4 == true) {
                          offstage4 = false;
                          index = 4;
                        } else {
                          if (index == 4) {
                            offstage4 = true;
                          } else {
                            offstage4 = false;
                            index = 4;
                          }
                        }
                        /*offstage4=!offstage4;
               index=4;*/
                      });
                      /*Navigator.of(context).push(
                MaterialPageRoute(builder: (context){
                return Newpagepointone(pointNumber: 3,oneSubProject: oneSubProject,sensorType: sensorType,);
              })
           );*/
                    },
                  )),
              Offstage(
                  offstage: offstage4,
                  child: GestureDetector(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        //color: Colors.blue,
                        //width: MediaQuery.of(context).size.width - 22,
                        //height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Text('环境测点图'),
                                Text(mapStyle[index]),
                                //Image.file(File(url),   //0715改
                                //Image.network('http://192.168.6.166:8101/GeneralProjDatum/AE132255F5E0102A691205F83FE7DD87D77C.png',
                                Image.network(
                                  'http://222.72.129.158:18101/GeneralProjDatum/AE132255F5E0102A691205F83FE7DD87D77C.png',
                                  fit: BoxFit.fill,
                                )
                              ]),
                        )),
                    onTap: () {
                      setState(() {
                        if (index == 1) {
                          sensorType = 2;
                          sensor = sensorOne;
                        } else if (index == 2) {
                          sensorType = 3;
                          sensor = sensorTwo;
                        } else if (index == 3) {
                          sensorType = 4;
                          sensor = sensorThree;
                        } else if (index == 4) {
                          sensorType = 5;
                          sensor = sensorFour;
                        }
                        /*sensorType=5;
             sensor=sensorFour;*/
                      });
                      getSensorInfo();
                    },
                  )),
              /*RaisedButton(
           child: Text('拍照'),
           onPressed:(){
             Navigator.of(context).push(
               MaterialPageRoute(builder: (context) {
                 return Camera();
               },
               )
             );
           }
           ),*/

              /*]
             )
             )*/
            ])) //
        );
  }

  getSensorInfo() async {
    WebApi webApi = WebApi.instance;
    sensorinfo = await webApi.getSensorInfo(oneSubProject.id, sensorType, 5, 0);
    //print(sensorinfo);
    bianhao = [];
    bianhao = ['请选择'];
    setState(() {
      for (int a = 0; a < sensorinfo.length; a++) {
        bianhao.add(sensorinfo[a].sensorId);
      }
    });

    print(bianhao);
    count = await webApi.getSensorCountByType(oneSubProject.id, sensorType);
    //print(count);

    allPhase = await webApi.getAllPhase(oneSubProject.id);
    //print(DateTime.parse(allPhase[0].startTime));
    //print(DateTime.parse(allPhase[0].endTime));
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Newpagepointone(
        pointNumber: sensorType - 2,
        oneSubProject: oneSubProject,
        sensorType: sensorType,
        sensor: sensor,
        sensorinfo: sensorinfo,
        bianhao: bianhao,
        allPhase: allPhase,
      );
    }));
  }

  Future<void> upload(BuildContext context) async {
    //String localPath="/storage/emulated/0/Pictures/flutter.pdf";
    //String localPath="/storage/emulated/0/Android/data/com.example.newjiankong/files/Pictures/9b24dbbe-73c7-41b2-9470-8f71e19adf56557072304.jpg";
    String localPath = '/storage/emulated/0/Android/data/pingnansanqiao.png';
    /*int a=_imgPath.toString().indexOf(':');
        String content=_imgPath.toString().substring(a+1);
        print(content);*/
    WebApi webApi = WebApi.instance;
    await webApi.fileUpload(localPath);
  }
}*/
List markIdlist = [];

class Newpagepoint extends StatefulWidget {
  Newpagepoint({Key key, this.subprojectId, this.projectPoint})
      : super(key: key);
  int subprojectId;
  List projectPoint = [];
  @override
  _NewpagepointState createState() =>
      _NewpagepointState(this.subprojectId, this.projectPoint);
}

class _NewpagepointState extends State<Newpagepoint> {
  _NewpagepointState(this.subprojectId, this.projectPoint);
  int subprojectId;
  List projectPoint = [];
  //List projectPoint = [];
  int featureType = 2;
  Color _color1 = Colors.blue;
  Color _color2 = Colors.white;
  Color _color3 = Colors.white;
  Color _color4 = Colors.white;
  Color _color5 = Colors.white;
  Color _color6 = Colors.white;
  List cedianNumberlist = [];
  List selectNumber = [];
  List idlist = [];
  List sensorIdlist = [];
  List sensor = ['测点Id', '测点编号'];
  int _rowsPerPage = 3;
  List<User> _data = [];
  String _starttime = '';
  String _endtime = '';
  int starttime;
  int endtime;
  bool offstageone = false;
  bool offstagetwo = true;
  bool offstageoff = true;
  bool offstageenv = true;
  List<UserValue> _dataone = [];
  List curve = [];
  List analysis = [];
  List<LinearSales> data = [];
  List<LinearSales> data1 = [];
  List<Datables> datable = [];
  List<Datableana> datableana = [];
  String dropvalue = '请选择';
  String dropvaluenv = '请选择';
  List<OrdinalSales> datao = [];
  //List<Series<LinearSales, DateTime>> seriesList = [];
  var seriesList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subprojectId = Provider.of<Counter>(context, listen: false).subprojectId;
    projectPoint = Provider.of<Counter>(context, listen: false).projectPoint;
    print(projectPoint[0]);
    print(projectPoint[1]);
    print(projectPoint[2]);
    print(projectPoint[3]);
    for (int a = 0; a < projectPoint[0].length; a++) {
      _data.add(User(projectPoint[0][a]['id'], projectPoint[0][a]['sensorId']));
    }
    _starttime = DateTime.now()
        .subtract(Duration(days: 180))
        .toString()
        .substring(0, 10);
    _endtime = DateTime.now().toString().substring(0, 10);
    starttime =
        DateTime.now().subtract(Duration(days: 180)).millisecondsSinceEpoch;
    endtime = DateTime.now().millisecondsSinceEpoch;
    _dataone.add(UserValue(1, 1, 1, '1'));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  //border: Border.all(width: 1, color: _color),
                  border: Border(bottom: BorderSide(width: 1, color: _color1)),
                  color: Colors.white),
              width: MediaQuery.of(context).size.width / 4,
              child: InkWell(
                child: Text(
                  '应力测点',
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  setState(() {
                    if (_color1 == Colors.white) {
                      _color1 = Colors.blue;
                      _color2 = Colors.white;
                      _color3 = Colors.white;
                      _color4 = Colors.white;
                      offstageoff = true;
                      offstageenv = true;
                      featureType = 2;
                      //getNewSensorInfo(subprojectId, featureType);
                      _data = [];
                      markIdlist = [];
                      datable = [];
                      datableana = [];
                      for (int a = 0; a < projectPoint[0].length; a++) {
                        _data.add(User(projectPoint[0][a]['id'],
                            projectPoint[0][a]['sensorId']));
                      }
                    }
                  });
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  //border: Border.all(width: 1, color: _color),
                  border: Border(bottom: BorderSide(width: 1, color: _color2)),
                  color: Colors.white),
              width: MediaQuery.of(context).size.width / 4,
              child: InkWell(
                child: Text(
                  '变形测点',
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  setState(() {
                    if (_color2 == Colors.white) {
                      _color2 = Colors.blue;
                      _color1 = Colors.white;
                      _color3 = Colors.white;
                      _color4 = Colors.white;
                      featureType = 3;
                      offstageoff = false;
                      offstageenv = true;
                      //getNewSensorInfo(subprojectId, featureType);
                      _data = [];
                      markIdlist = [];
                      datable = [];
                      datableana = [];
                      for (int a = 0; a < projectPoint[1].length; a++) {
                        _data.add(User(projectPoint[1][a]['id'],
                            projectPoint[1][a]['sensorId']));
                      }
                    }
                  });
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  //border: Border.all(width: 1, color: _color),
                  border: Border(bottom: BorderSide(width: 1, color: _color3)),
                  color: Colors.white),
              width: MediaQuery.of(context).size.width / 4,
              child: InkWell(
                child: Text(
                  '索力测点',
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  setState(() {
                    if (_color3 == Colors.white) {
                      _color3 = Colors.blue;
                      _color1 = Colors.white;
                      _color2 = Colors.white;
                      _color4 = Colors.white;
                      featureType = 4;
                      offstageoff = true;
                      offstageenv = true;
                      //getNewSensorInfo(subprojectId, featureType);
                      _data = [];
                      markIdlist = [];
                      datable = [];
                      datableana = [];
                      for (int a = 0; a < projectPoint[2].length; a++) {
                        _data.add(User(projectPoint[2][a]['id'],
                            projectPoint[2][a]['sensorId']));
                      }
                    }
                  });
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  //border: Border.all(width: 1, color: _color),
                  border: Border(bottom: BorderSide(width: 1, color: _color4)),
                  color: Colors.white),
              width: MediaQuery.of(context).size.width / 4,
              child: InkWell(
                child: Text(
                  '环境测点',
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  setState(() {
                    if (_color4 == Colors.white) {
                      _color4 = Colors.blue;
                      _color1 = Colors.white;
                      _color2 = Colors.white;
                      _color3 = Colors.white;
                      featureType = 5;
                      offstageoff = true;
                      offstageenv = false;
                      //getNewSensorInfo(subprojectId, featureType);
                      _data = [];
                      markIdlist = [];
                      datable = [];
                      datableana = [];
                      for (int a = 0; a < projectPoint[3].length; a++) {
                        _data.add(User(projectPoint[3][a]['id'],
                            projectPoint[3][a]['sensorId']));
                      }
                    }
                  });
                },
              ),
            ),
          ],
        ),
        Expanded(
            child: ListView(
          children: [
            Container(
              //margin: EdgeInsets.all(10),
              /*decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),*/
              color: Colors.white,
              child: PaginatedDataTable(
                  //header: Text('测点定义',style: TextStyle(fontSize:15),),
                  header: Text(
                    '测点信息',
                    style: TextStyle(fontSize: 15),
                  ),
                  columns: sensor.map((f) {
                    return DataColumn(label: Text(f));
                  }).toList(),
                  rowsPerPage: _data.length < 3 ? _data.length : _rowsPerPage,
                  //rowsPerPage: 3,
                  source: MyDataTableSource(_data)),
            ),
            Container(
                color: Colors.white,
                child: Row(children: [
                  SizedBox(width: 10),
                  Text('统计周期:'),
                  //SizedBox(width: 5),
                  Container(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(hintText: '起始时间'),
                        controller: TextEditingController(text: _starttime),
                        //controller: startTime,
                        onTap: () {
                          showDatePicker(
                                  //helpText:'日期',
                                  locale: Locale('zh'),
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now()
                                      .subtract(new Duration(days: 365)),
                                  lastDate: DateTime.now()
                                      .add(new Duration(days: 365)))
                              .then((onValue) {
                            setState(() {
                              _starttime = onValue.toString().substring(0, 10);
                              starttime = onValue.millisecondsSinceEpoch;
                              print(starttime);
                            });
                          });
                        },
                        onChanged: (v) {
                          setState(() {
                            _starttime = v;
                            //_endtime = '';
                            //endtime=0;
                          });
                          print(_starttime);
                        },
                      )),
                  SizedBox(width: 15),
                  Container(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(hintText: '结束时间'),
                        controller: TextEditingController(text: _endtime),
                        //controller: endTime,
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now()
                                      .subtract(new Duration(days: 365)),
                                  lastDate: DateTime.now()
                                      .add(new Duration(days: 365)))
                              .then((onValue) {
                            setState(() {
                              _endtime = onValue.toString().substring(0, 10);
                              endtime = onValue.millisecondsSinceEpoch;
                              print(endtime);
                            });
                          });
                        },
                        onChanged: (v) {
                          setState(() {
                            _endtime = v;
                          });
                        },
                      )),
                ])),
            SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      //color: Colors.blue,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              //border: Border.all(width: 1, color: _color),
                              border: Border(
                                  bottom: BorderSide(width: 1, color: _color5)),
                              color: Colors.white),
                          child: InkWell(
                            hoverColor: Colors.blue,
                            child: Text(
                              '监测曲线',
                              textAlign: TextAlign.center,
                            ),
                            onTap: () {
                              setState(() {
                                _color5 = Colors.blue;
                                _color6 = Colors.white;

                                offstageone = false;
                                offstagetwo = true;
                                if (featureType == 2) {
                                  getStressDataByTimeSlot();
                                } else if (featureType == 3) {
                                  getNewOffsetDataByTimeSlot();
                                } else if (featureType == 4) {
                                  getNewCableDataByTimeSlot();
                                } else if (featureType == 5) {
                                  getNewEnvByTimeSlot();
                                }
                              });
                            },
                          ),
                        ),
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              //border: Border.all(width: 1, color: _color),
                              border: Border(
                                  bottom: BorderSide(width: 1, color: _color6)),
                              color: Colors.white),
                          child: InkWell(
                            hoverColor: Colors.blue,
                            child: Text(
                              '统计分析',
                              textAlign: TextAlign.center,
                            ),
                            onTap: () {
                              setState(() {
                                _color6 = Colors.blue;
                                _color5 = Colors.white;
                                offstageone = true;
                                offstagetwo = false;
                              });
                            },
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Offstage(
              offstage: offstageoff,
              child: Container(
                width: 100,
                child: DropdownButton(
                    value: dropvalue,
                    items: ['请选择', '位移竖', '位移横', '位移纵']
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (v) {
                      setState(() {
                        dropvalue = v;
                        print(dropvalue);
                        if (curve.length == 0) {
                          Fluttertoast.showToast(msg: '没有数据');
                        } else if (curve.length > 0) {
                          setState(() {
                            _simpleLine();
                            _simpleBar();
                            addtable();
                          });
                        }
                      });
                    }),
              ),
            ),
            Offstage(
              offstage: offstageenv,
              child: Container(
                width: 100,
                child: DropdownButton(
                    value: dropvaluenv,
                    items: ['请选择', '温度', '湿度']
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (v) {
                      //print(v);
                      setState(() {
                        dropvaluenv = v;
                        if (curve.length == 0) {
                          Fluttertoast.showToast(msg: '没有数据');
                        } else if (curve.length > 0) {
                          setState(() {
                            _simpleLine();
                            _simpleBar();
                            addtable();
                          });
                        }
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Offstage(
                offstage: offstageone,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      //alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '——',
                            style: TextStyle(color: Colors.green),
                          ),
                          Text('实际值'),
                          Text(
                            '——',
                            style: TextStyle(color: Colors.red),
                          ),
                          Text('理论值'),
                        ],
                      ),
                    ),
                    Container(height: 240, child: _simpleLine()),
                    Container(
                      child: PaginatedDataTable(
                          //header: Text('测点定义',style: TextStyle(fontSize:15),),
                          header: Text(
                            '',
                            style: TextStyle(fontSize: 15),
                          ),
                          columns: ['测点编号', '实际值', '理论值', '差值', '误差', '监测时间']
                              .map((f) {
                            return DataColumn(label: Text(f));
                          }).toList(),
                          //rowsPerPage: datable.length < 6 ? datable.length : 6,
                          rowsPerPage: 6,
                          source: TestDataTableSource(datable)),
                    )
                  ],
                )),
            Offstage(
                offstage: offstagetwo,
                child: Column(
                  children: [
                    Container(
                      height: 240,
                      child: _simpleBar(),
                    ),
                    Container(
                      child: PaginatedDataTable(
                          //header: Text('测点定义',style: TextStyle(fontSize:15),),
                          header: Text(
                            '',
                            style: TextStyle(fontSize: 15),
                          ),
                          columns: [
                            '测点编号',
                            '实测max',
                            '实测min',
                            '差值max',
                            '差值min',
                            '误差max',
                            '误差min'
                          ].map((f) {
                            return DataColumn(label: Text(f));
                          }).toList(),
                          //rowsPerPage: datable.length < 6 ? datable.length : 6,
                          rowsPerPage: 6,
                          source: TestanaDataTableSource(datableana)),
                    )
                  ],
                )),
          ],
        ))
      ],
    );
  }

  getNewSensorInfo(int subprojectId, int featureType) async {
    WebApi webApi = WebApi.instance;
    projectPoint = await webApi.getNewSensorInfo(subprojectId, featureType);
    //print(projectPoint[0][0]['sensorId']);
    //print(projectPoint[0][1]['sensorId']);
    _data = [];
    setState(() {
      //_data = projectPoint[0];
      for (int a = 0; a < projectPoint[0].length; a++) {
        _data.add(
            User(projectPoint[0][a]['id'], projectPoint[0][a]['sensorId']));
      }
    });

    /*for (int a = 0; a < projectPoint[0].length; a++) {
      idlist = projectPoint[0][a]['id'];
      sensorIdlist = projectPoint[0][a]['sensorId'];
    }*/
    //print(idlist);
  }

  Widget _simpleLine() {
    data = [];
    data1 = [];

    if (featureType == 2) {
      for (int a = 0; a < curve.length; a++) {
        for (int b = 0; b < curve[a].length; b++) {
          var content = LinearSales(DateTime.parse(curve[a][b]['sampleTime']),
              curve[a][b]['phasesStress']);
          data.add(content);
        }
      }
      for (int a = 0; a < curve.length; a++) {
        for (int b = 0; b < curve[a].length; b++) {
          var content = LinearSales(DateTime.parse(curve[a][b]['sampleTime']),
              curve[a][b]['theoryStress']);
          data1.add(content);
        }
      }
    } else if (featureType == 3) {
      if (dropvalue == '位移竖') {
        for (int a = 0; a < curve.length; a++) {
          for (int b = 0; b < curve[a].length; b++) {
            var content = LinearSales(DateTime.parse(curve[a][b]['sampleTime']),
                curve[a][b]['verticalOffset']);
            data.add(content);
          }
        }
        for (int a = 0; a < curve.length; a++) {
          for (int b = 0; b < curve[a].length; b++) {
            var content = LinearSales(DateTime.parse(curve[a][b]['sampleTime']),
                curve[a][b]['tVerticalOffset']);
            data1.add(content);
          }
        }
      } else if (dropvalue == '位移横') {
        for (int a = 0; a < curve.length; a++) {
          for (int b = 0; b < curve[a].length; b++) {
            var content = LinearSales(DateTime.parse(curve[a][b]['sampleTime']),
                curve[a][b]['horizontalOffset']);
            data.add(content);
          }
        }
        for (int a = 0; a < curve.length; a++) {
          for (int b = 0; b < curve[a].length; b++) {
            var content = LinearSales(DateTime.parse(curve[a][b]['sampleTime']),
                curve[a][b]['tHorizontalOffset']);
            data1.add(content);
          }
        }
      } else if (dropvalue == '位移纵') {
        for (int a = 0; a < curve.length; a++) {
          for (int b = 0; b < curve[a].length; b++) {
            var content = LinearSales(DateTime.parse(curve[a][b]['sampleTime']),
                curve[a][b]['longitudinalOffset']);
            data.add(content);
          }
        }
        for (int a = 0; a < curve.length; a++) {
          for (int b = 0; b < curve[a].length; b++) {
            var content = LinearSales(DateTime.parse(curve[a][b]['sampleTime']),
                curve[a][b]['tLongitudinalOffset']);
            data1.add(content);
          }
        }
      }
    } else if (featureType == 4) {
      for (int a = 0; a < curve.length; a++) {
        for (int b = 0; b < curve[a].length; b++) {
          var content = LinearSales(DateTime.parse(curve[a][b]['sampleTime']),
              curve[a][b]['cableForce']);
          data.add(content);
        }
      }
      for (int a = 0; a < curve.length; a++) {
        for (int b = 0; b < curve[a].length; b++) {
          var content = LinearSales(DateTime.parse(curve[a][b]['sampleTime']),
              curve[a][b]['tCableForce']);
          data1.add(content);
        }
      }
    } else if (featureType == 5) {
      if (dropvaluenv == '温度') {
        for (int a = 0; a < curve.length; a++) {
          for (int b = 0; b < curve[a].length; b++) {
            var content = LinearSales(DateTime.parse(curve[a][b]['sampleTime']),
                curve[a][b]['temperature']);
            data.add(content);
          }
        }
        for (int a = 0; a < curve.length; a++) {
          for (int b = 0; b < curve[a].length; b++) {
            var content = LinearSales(DateTime.parse(curve[a][b]['sampleTime']),
                curve[a][b]['tTemperature']);
            data1.add(content);
          }
        }
      } else if (dropvaluenv == '湿度') {
        for (int a = 0; a < curve.length; a++) {
          for (int b = 0; b < curve[a].length; b++) {
            var content = LinearSales(DateTime.parse(curve[a][b]['sampleTime']),
                curve[a][b]['humidity']);
            data.add(content);
          }
        }
        for (int a = 0; a < curve.length; a++) {
          for (int b = 0; b < curve[a].length; b++) {
            var content = LinearSales(DateTime.parse(curve[a][b]['sampleTime']),
                curve[a][b]['tHumidity']);
            data1.add(content);
          }
        }
      }
    }

    seriesList = [
      charts.Series<LinearSales, DateTime>(
        id: 'Sales',
        //colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.green),
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      ),
      charts.Series<LinearSales, DateTime>(
        id: 'Darts',
        //colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.red),
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data1,
      ),
    ];

    return charts.TimeSeriesChart(seriesList, animate: true);
  }

  Widget _simpleBar() {
    datao = [];
    if (analysis.length == 0) {
      datao = [
        OrdinalSales('2014', 1),
      ];
    } else {
      if (featureType == 2) {
        datao = [
          OrdinalSales('实测max', analysis[0][0]['max']),
          OrdinalSales('实测min', analysis[0][0]['min']),
          OrdinalSales('差值max', analysis[0][0]['maxDvalue']),
          OrdinalSales('差值min', analysis[0][0]['minDvalue']),
          OrdinalSales('误差max', analysis[0][0]['maxDeviation']),
          OrdinalSales('误差min', analysis[0][0]['minDeviation']),
        ];
      } else if (featureType == 4) {
        datao = [
          OrdinalSales('实测max', analysis[0][0]['max']),
          OrdinalSales('实测min', analysis[0][0]['min']),
          OrdinalSales('差值max', analysis[0][0]['maxDvalue']),
          OrdinalSales('差值min', analysis[0][0]['minDvalue']),
          OrdinalSales('误差max', analysis[0][0]['maxDeviation']),
          OrdinalSales('误差min', analysis[0][0]['minDeviation']),
        ];
      } else if (featureType == 3) {
        if (dropvalue == '位移竖') {
          if (analysis.length == 0) {
            datao = [
              OrdinalSales('2014', 1),
            ];
          } else {
            datao = [
              OrdinalSales('实测max', analysis[0][0]['maxV']),
              OrdinalSales('实测min', analysis[0][0]['minV']),
              OrdinalSales('差值max', analysis[0][0]['maxDvalueV']),
              OrdinalSales('差值min', analysis[0][0]['minDvalueV']),
              OrdinalSales('误差max', analysis[0][0]['maxDeviationV']),
              OrdinalSales('误差min', analysis[0][0]['minDeviationV']),
            ];
          }
        } else if (dropvalue == '位移横') {
          if (analysis.length == 0) {
            datao = [
              OrdinalSales('2014', 1),
            ];
          } else {
            datao = [
              OrdinalSales('实测max', analysis[0][0]['maxH']),
              OrdinalSales('实测min', analysis[0][0]['minH']),
              OrdinalSales('差值max', analysis[0][0]['maxDvalueH']),
              OrdinalSales('差值min', analysis[0][0]['minDvalueH']),
              OrdinalSales('误差max', analysis[0][0]['maxDeviationH']),
              OrdinalSales('误差min', analysis[0][0]['minDeviationH']),
            ];
          }
        } else if (dropvalue == '位移纵') {
          if (analysis.length == 0) {
            datao = [
              OrdinalSales('2014', 1),
            ];
          } else {
            datao = [
              OrdinalSales('实测max', analysis[0][0]['maxL']),
              OrdinalSales('实测min', analysis[0][0]['minL']),
              OrdinalSales('差值max', analysis[0][0]['maxDvalueL']),
              OrdinalSales('差值min', analysis[0][0]['minDvalueL']),
              OrdinalSales('误差max', analysis[0][0]['maxDeviationL']),
              OrdinalSales('误差min', analysis[0][0]['minDeviationL']),
            ];
          }
        }
      } else if (featureType == 5) {
        if (dropvaluenv == '温度') {
          if (analysis.length == 0) {
            datao = [
              OrdinalSales('2014', 1),
            ];
          } else {
            datao = [
              OrdinalSales('实测max', analysis[0][0]['maxT']),
              OrdinalSales('实测min', analysis[0][0]['minT']),
              OrdinalSales('差值max', analysis[0][0]['maxDvalueT']),
              OrdinalSales('差值min', analysis[0][0]['minDvalueT']),
              OrdinalSales('误差max', analysis[0][0]['maxDeviationT']),
              OrdinalSales('误差min', analysis[0][0]['minDeviationT']),
            ];
          }
        } else if (dropvaluenv == '湿度') {
          if (analysis.length == 0) {
            datao = [
              OrdinalSales('2014', 1),
            ];
          } else {
            datao = [
              OrdinalSales('实测max', analysis[0][0]['maxH']),
              OrdinalSales('实测min', analysis[0][0]['minH']),
              OrdinalSales('差值max', analysis[0][0]['maxDvalueH']),
              OrdinalSales('差值min', analysis[0][0]['minDvalueH']),
              OrdinalSales('误差max', analysis[0][0]['maxDeviationH']),
              OrdinalSales('误差min', analysis[0][0]['minDeviationH']),
            ];
          }
        }
      }
    }

    var seriesList = [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.name,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: datao,
      )
    ];

    return charts.BarChart(
      seriesList,
      animate: true,
    );
  }

  addtable() {
    datable = [];
    datableana = [];

    if (featureType == 2) {
      for (int a = 0; a < curve.length; a++) {
        for (int b = 0; b < curve[a].length; b++) {
          var content = Datables(
              curve[a][b]['sensorId'],
              curve[a][b]['phasesStress'].toString(),
              curve[a][b]['theoryStress'].toString(),
              curve[a][b]['difference'].toString(),
              curve[a][b]['deviation'].toString(),
              curve[a][b]['sampleTime']);
          datable.add(content);
        }
      }
      for (int a = 0; a < analysis.length; a++) {
        for (int b = 0; b < analysis[a].length; b++) {
          var content = Datableana(
              analysis[a][b]['sensorId'],
              analysis[a][b]['max'].toString(),
              analysis[a][b]['min'].toString(),
              analysis[a][b]['maxDvalue'].toString(),
              analysis[a][b]['minDvalue'].toString(),
              analysis[a][b]['maxDeviationStr'],
              analysis[a][b]['minDeviationStr']);
          datableana.add(content);
        }
      }
    } else if (featureType == 4) {
      for (int a = 0; a < curve.length; a++) {
        for (int b = 0; b < curve[a].length; b++) {
          var content = Datables(
              curve[a][b]['sensorId'],
              curve[a][b]['cableForce'].toString(),
              curve[a][b]['tCableForce'].toString(),
              curve[a][b]['difference'].toString(),
              curve[a][b]['deviation'].toString(),
              curve[a][b]['sampleTime']);
          datable.add(content);
        }
      }
      for (int a = 0; a < analysis.length; a++) {
        for (int b = 0; b < analysis[a].length; b++) {
          var content = Datableana(
              analysis[a][b]['sensorId'],
              analysis[a][b]['max'].toString(),
              analysis[a][b]['min'].toString(),
              analysis[a][b]['maxDvalue'].toString(),
              analysis[a][b]['minDvalue'].toString(),
              analysis[a][b]['maxDeviationStr'],
              analysis[a][b]['minDeviationStr']);
          datableana.add(content);
        }
      }
    } else if (featureType == 3) {
      if (dropvalue == '位移竖') {
        for (int a = 0; a < curve.length; a++) {
          for (int b = 0; b < curve[a].length; b++) {
            var content = Datables(
                curve[a][b]['sensorId'],
                curve[a][b]['verticalOffset'].toString(),
                curve[a][b]['tVerticalOffset'].toString(),
                curve[a][b]['vDifference'].toString(),
                curve[a][b]['vDeviation'].toString(),
                curve[a][b]['sampleTime']);
            datable.add(content);
          }
        }
        for (int a = 0; a < analysis.length; a++) {
          for (int b = 0; b < analysis[a].length; b++) {
            var content = Datableana(
                analysis[a][b]['sensorId'],
                analysis[a][b]['maxV'].toString(),
                analysis[a][b]['minV'].toString(),
                analysis[a][b]['maxDvalueV'].toString(),
                analysis[a][b]['minDvalueV'].toString(),
                analysis[a][b]['maxDeviationVStr'],
                analysis[a][b]['minDeviationVStr']);
            datableana.add(content);
          }
        }
      } else if (dropvalue == '位移横') {
        for (int a = 0; a < curve.length; a++) {
          for (int b = 0; b < curve[a].length; b++) {
            var content = Datables(
                curve[a][b]['sensorId'],
                curve[a][b]['horizontalOffset'].toString(),
                curve[a][b]['tHorizontalOffset'].toString(),
                curve[a][b]['hDifference'].toString(),
                curve[a][b]['hDeviation'].toString(),
                curve[a][b]['sampleTime']);
            datable.add(content);
          }
        }
        for (int a = 0; a < analysis.length; a++) {
          for (int b = 0; b < analysis[a].length; b++) {
            var content = Datableana(
                analysis[a][b]['sensorId'],
                analysis[a][b]['maxH'].toString(),
                analysis[a][b]['minH'].toString(),
                analysis[a][b]['maxDvalueH'].toString(),
                analysis[a][b]['minDvalueH'].toString(),
                analysis[a][b]['maxDeviationHStr'],
                analysis[a][b]['minDeviationHStr']);
            datableana.add(content);
          }
        }
      } else if (dropvalue == '位移纵') {
        for (int a = 0; a < curve.length; a++) {
          for (int b = 0; b < curve[a].length; b++) {
            var content = Datables(
                curve[a][b]['sensorId'],
                curve[a][b]['longitudinalOffset'].toString(),
                curve[a][b]['tVerticalOffset'].toString(),
                curve[a][b]['lDifference'].toString(),
                curve[a][b]['lDeviation'].toString(),
                curve[a][b]['sampleTime']);
            datable.add(content);
          }
        }
        for (int a = 0; a < analysis.length; a++) {
          for (int b = 0; b < analysis[a].length; b++) {
            var content = Datableana(
                analysis[a][b]['sensorId'],
                analysis[a][b]['maxL'].toString(),
                analysis[a][b]['minL'].toString(),
                analysis[a][b]['maxDvalueL'].toString(),
                analysis[a][b]['minDvalueL'].toString(),
                analysis[a][b]['maxDeviationLStr'],
                analysis[a][b]['minDeviationLStr']);
            datableana.add(content);
          }
        }
      }
    } else if (featureType == 5) {
      if (dropvaluenv == '温度') {
        //
        for (int a = 0; a < curve.length; a++) {
          for (int b = 0; b < curve[a].length; b++) {
            var content = Datables(
                curve[a][b]['sensorId'],
                curve[a][b]['temperature'].toString(),
                curve[a][b]['tTemperature'].toString(),
                curve[a][b]['tDifference'].toString(),
                curve[a][b]['tDeviation'].toString(),
                curve[a][b]['sampleTime']);
            datable.add(content);
          }
        }
        for (int a = 0; a < analysis.length; a++) {
          for (int b = 0; b < analysis[a].length; b++) {
            var content = Datableana(
                analysis[a][b]['sensorId'],
                analysis[a][b]['maxT'].toString(),
                analysis[a][b]['minT'].toString(),
                analysis[a][b]['maxDvalueT'].toString(),
                analysis[a][b]['minDvalueT'].toString(),
                analysis[a][b]['maxDeviationTStr'],
                analysis[a][b]['minDeviationTStr']);
            datableana.add(content);
          }
        }
      } else if (dropvaluenv == '湿度') {
        //
        for (int a = 0; a < curve.length; a++) {
          for (int b = 0; b < curve[a].length; b++) {
            var content = Datables(
                curve[a][b]['sensorId'],
                curve[a][b]['humidity'].toString(),
                curve[a][b]['tHumidity'].toString(),
                curve[a][b]['hDifference'].toString(),
                curve[a][b]['hDeviation'].toString(),
                curve[a][b]['sampleTime']);
            datable.add(content);
          }
        }
        for (int a = 0; a < analysis.length; a++) {
          for (int b = 0; b < analysis[a].length; b++) {
            var content = Datableana(
                analysis[a][b]['sensorId'],
                analysis[a][b]['maxH'].toString(),
                analysis[a][b]['minH'].toString(),
                analysis[a][b]['maxDvalueH'].toString(),
                analysis[a][b]['minDvalueH'].toString(),
                analysis[a][b]['maxDeviationHStr'],
                analysis[a][b]['minDeviationHStr']);
            datableana.add(content);
          }
        }
      }
    }
  }

  getStressDataByTimeSlot() async {
    WebApi webApi = WebApi.instance;

    curve = [];
    analysis = [];
    //List value = [];
    List content = [];
    for (int a = 0; a < markIdlist.length; a++) {
      content = await webApi.getNewStressDataByTimeSlot(
          markIdlist[a], _starttime, _endtime);
      /*curve.add(content[0]['monitor']);
      analysis.add(content[0]['analysis']);*/
      if (content[0]['monitor'].length == 0) {
      } else if (content[0]['monitor'].length > 0) {
        curve.add(content[0]['monitor']);
        analysis.add(content[0]['analysis']);
      }
    }
    //print(curve);
    print(analysis);
    if (curve.length == 0) {
      Fluttertoast.showToast(msg: '没有数据');
    } else {
      setState(() {
        _simpleLine();
        _simpleBar();
        addtable();
      });
    }
  }

  getNewOffsetDataByTimeSlot() async {
    WebApi webApi = WebApi.instance;
    curve = [];
    analysis = [];
    List content = [];
    for (int a = 0; a < markIdlist.length; a++) {
      content = await webApi.getNewOffsetDataByTimeSlot(
          markIdlist[a], _starttime, _endtime);
      /*curve.add(content[0]['monitor']);
      analysis.add(content[0]['analysis']);*/
      if (content[0]['monitor'].length == 0) {
      } else if (content[0]['monitor'].length > 0) {
        curve.add(content[0]['monitor']);
        analysis.add(content[0]['analysis']);
      }
    }
    //print(curve);
    print(analysis);
    /*setState(() {
      _simpleLine();
      _simpleBar();
      addtable();
    });*/
  }

  getNewCableDataByTimeSlot() async {
    WebApi webApi = WebApi.instance;
    curve = [];
    analysis = [];
    List content = [];
    for (int a = 0; a < markIdlist.length; a++) {
      content = await webApi.getNewCableDataByTimeSlot(
          markIdlist[a], _starttime, _endtime);
      /*curve.add(content[0]['monitor']);
      analysis.add(content[0]['analysis']);*/
      if (content[0]['monitor'].length == 0) {
      } else if (content[0]['monitor'].length > 0) {
        curve.add(content[0]['monitor']);
        analysis.add(content[0]['analysis']);
      }
    }
    //print(curve);
    print(analysis);
    if (curve.length == 0) {
      Fluttertoast.showToast(msg: '没有数据');
    } else {
      setState(() {
        _simpleLine();
        _simpleBar();
        addtable();
      });
    }
  }

  getNewEnvByTimeSlot() async {
    WebApi webApi = WebApi.instance;
    curve = [];
    analysis = [];
    List content = [];
    for (int a = 0; a < markIdlist.length; a++) {
      content =
          await webApi.getNewEnvByTimeSlot(markIdlist[a], _starttime, _endtime);
      //print(content);
      if (content[0]['monitor'].length == 0) {
      } else if (content[0]['monitor'].length > 0) {
        curve.add(content[0]['monitor']);
        analysis.add(content[0]['analysis']);
      }
    }
    print(curve);
    /*print(analysis);
    setState(() {
      _simpleLine();
      _simpleBar();
      addtable();
    });*/
  }
}

class MyDataTableSource extends DataTableSource {
  MyDataTableSource(this.data);

  //final List<User> data;
  List<User> data = [];
  //List idlist = [];
  //List sensorId = [];
  int featureType;
  /*List newsensorinfo = [];
  String edge = '';
  String offerDir = '';*/
  //List cedianNumberlist=[];
  //List selectNumber=[];
  bool selected = false;
  @override
  DataRow getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      selected: data[index].selected,
      onSelectChanged: (selected) {
        /*if (markIdlist.length > 0) {
          Fluttertoast.showToast(msg: '已经选择了一个测点' + markIdlist[0].toString());
        } else if (markIdlist.length == 0) {
          data[index].selected = selected;
          notifyListeners();
          if (selected == true) {
            markIdlist.add(data[index].id);
          } else {
            markIdlist.remove(data[index].id);
          }
        }*/
        if (selected == true) {
          if (markIdlist.length > 0) {
            Fluttertoast.showToast(msg: '已经选择了一个测点' + markIdlist[0].toString());
          } else {
            data[index].selected = selected;
            notifyListeners();
            markIdlist.add(data[index].id);
          }
        } else {
          data[index].selected = selected;
          notifyListeners();
          markIdlist.remove(data[index].id);
        }
        print(markIdlist);
      },
      cells: [
        DataCell(Text('${data[index].id}')),
        DataCell(Text('${data[index].sensorId}')),
        //DataCell(Text('${data[index].edge}')),
      ],
    );
  }

  @override
  int get selectedRowCount {
    return 0;
  }

  @override
  bool get isRowCountApproximate {
    return false;
  }

  @override
  int get rowCount {
    return data.length;
  }
}

class User {
  User(this.id, this.sensorId, {this.selected = false});

  final int id;
  final String sensorId;
  bool selected;
}

class LinearSales {
  //final String year;
  DateTime year;
  final double sales;

  LinearSales(this.year, this.sales);
}

class OrdinalSales {
  final String name;
  final double sales;

  OrdinalSales(this.name, this.sales);
}

class ValueDataTableSource extends DataTableSource {
  ValueDataTableSource(this.data);

  List<UserValue> data = [];
  int featureType;
  @override
  DataRow getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${data[index].sensorId}')),
        DataCell(Text('${data[index].actual}')),
        DataCell(Text('${data[index].theoretical}')),
        DataCell(Text('${data[index].error}')),
        //DataCell(Text('${data[index].edge}')),
      ],
    );
  }

  @override
  int get selectedRowCount {
    return 0;
  }

  @override
  bool get isRowCountApproximate {
    return false;
  }

  @override
  int get rowCount {
    return data.length;
  }
}

class UserValue {
  UserValue(this.sensorId, this.actual, this.theoretical, this.error);

  final int sensorId;
  final double actual;
  final double theoretical;
  final String error;
}

class Datables {
  String sensorId;
  String actualvalue;
  String theoreticalvalue;
  String difference;
  String deviation;
  String time;
  Datables(this.sensorId, this.actualvalue, this.theoreticalvalue,
      this.difference, this.deviation, this.time);
}

class TestDataTableSource extends DataTableSource {
  TestDataTableSource(this.data);

  List<Datables> data = [];
  int featureType;
  @override
  DataRow getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${data[index].sensorId}')),
        DataCell(Text('${data[index].actualvalue}')),
        DataCell(Text('${data[index].theoreticalvalue}')),
        DataCell(Text('${data[index].difference}')),
        DataCell(Text('${data[index].deviation}')),
        DataCell(Text('${data[index].time}')),
        //DataCell(Text('${data[index].edge}')),
      ],
    );
  }

  @override
  int get selectedRowCount {
    return 0;
  }

  @override
  bool get isRowCountApproximate {
    return false;
  }

  @override
  int get rowCount {
    return data.length;
  }
}

class Datableana {
  String sensorId;
  String max;
  String min;
  String maxDvalue;
  String minDvalue;
  String maxDeviationStr;
  String minDeviationStr;

  Datableana(this.sensorId, this.max, this.min, this.maxDvalue, this.minDvalue,
      this.maxDeviationStr, this.minDeviationStr);
}

class TestanaDataTableSource extends DataTableSource {
  TestanaDataTableSource(this.data);

  List<Datableana> data = [];
  int featureType;
  @override
  DataRow getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${data[index].sensorId}')),
        DataCell(Text('${data[index].max}')),
        DataCell(Text('${data[index].min}')),
        DataCell(Text('${data[index].maxDvalue}')),
        DataCell(Text('${data[index].minDvalue}')),
        DataCell(Text('${data[index].maxDeviationStr}')),
        DataCell(Text('${data[index].minDeviationStr}')),
      ],
    );
  }

  @override
  int get selectedRowCount {
    return 0;
  }

  @override
  bool get isRowCountApproximate {
    return false;
  }

  @override
  int get rowCount {
    return data.length;
  }
}
