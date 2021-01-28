import 'package:flutter/material.dart';
import 'login.dart';

/*class Newpagepointone extends StatefulWidget {
  Newpagepointone({Key key,this.pointNumber,this.oneSubProject}) : super(key: key);
  int pointNumber;
  var oneSubProject;
  @override
  _NewpagepointoneState createState() => _NewpagepointoneState(this.pointNumber,this.oneSubProject);
}

class _NewpagepointoneState extends State<Newpagepointone> {
  List pointStyle=['请选择','应变测点','变形测点','索力测点','环境测点'];
  _NewpagepointoneState(this.pointNumber,this.oneSubProject);
  int pointNumber;
  var oneSubProject;
  String _value='请选择';
  String _value1='请选择';
  List sensorOne=['测点编号','安装阶段','上下缘'];
  List sensorTwo=['测点编号','安装阶段','位移方向'];
  List sensorThree=['测点编号','安装阶段'];
  List sensorFour=['测点编号','安装阶段'];
  List sensor=['测点编号','安装阶段'];
  int sensorType;
  List sensorinfo=[];
  List numberList=['请选择'];
  int count;
  List allPhase=[];
  Map sensormap={};
  List<Map> newsensorinfo=[]; 
  Map edgemap={'1':'上','2':'下','0':'无该属性','null':'null'};
  Map offerDir={'1':'纵向','2':'横向','3':'纵横','4':'竖向','5':'纵竖','6':'横竖','7':'纵横竖','0':'无该属性','null':'null'};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print(oneSubProject.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title:Text(pointStyle[pointNumber+1]),
       ),
       body: Column(
         children:[
           Container(
             margin: EdgeInsets.all(10),
             decoration: BoxDecoration(
              border: Border.all(width: 1,color: Colors.grey),
              borderRadius: BorderRadius.circular(10)
             ),
             child:Container(
               width: MediaQuery.of(context).size.width-22,
               height: 200,
               child:Text('图片')
             )
           ),
           SizedBox(height:10),
           Row(
             children: <Widget>[
               Container(
                child:Row(children: <Widget>[
                  SizedBox(width:10),
                  Text('测点类型:'),
                  SizedBox(width:5),
              DropdownButton(
                value: _value,
                items: pointStyle.map((f){
                  return DropdownMenuItem(child: Text(f),value:f);
                }).toList(),
                 onChanged:(v){
                    setState(() {
                       _value=v;
                       _value1='请选择';
                      if(v=='应变测点'){
                        sensorType=2;
                        sensor=sensorOne;
                      }else if(v=='变形测点'){
                        sensorType=3;
                        sensor=sensorTwo;
                      }else if(v=='索力测点'){
                        sensorType=4;
                        sensor=sensorThree;
                      }else if(v=='环境测点'){
                        sensorType=5;
                        sensor=sensorFour;
                      }
                      getSensorInfo();
                    });
                 }
                 )
                ],)
              ),
              Container(
                child:Row(children: <Widget>[
                  SizedBox(width:40),
                  Text('测点编号:'),
                  SizedBox(width:5),
              DropdownButton(
                value: _value1,
                items: numberList.map((f){
                  return DropdownMenuItem(child: Text(f),value: f,);
                }).toList(),
                 onChanged:(v){
                    setState(() {
                      _value=v;
                    });
                 }
                 )
                ],)
              ),
              
             ],
           ),
           //测点信息
           Expanded(
              child:ListView(
                children:[
                  Container(
                    margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
              border: Border.all(width: 1,color: Colors.grey),
              borderRadius: BorderRadius.circular(20)
             ),
              child: PaginatedDataTable(
                header: Text('测点信息表'),
                columns: sensor.map((f){
                  return DataColumn(label: Text(f));
                }).toList(),
                rowsPerPage:3,
                //source: MyDataTableSource(sensorinfo,sensorType),
                source: MyDataTableSource(newsensorinfo,sensorType)
              ),
            ),
            /*Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
              border: Border.all(width: 1,color: Colors.grey),
              borderRadius: BorderRadius.circular(20)
             ),
              child:Column(children: <Widget>[
                Row(
             children:[
                FlatButton(
             child:Text('全部'),
             onPressed:(){
               //dataLine1=[];
               setState(() {
                 /*dataLine1=dataLine;
                 dataLine2=dataLineA;
                 dataLine3=dataLineB;
                 a=0;*/
                if(sensorType==2){
                  //getStressDataByTime();
                }else if(sensorType==3){
                  //getOffsetDataByTime();
                }else if(sensorType==4){
                  //getCableDataByTime();
                }else if(sensorType==5){
                  //getEnvByTime();
                }
               });
               
             } ,
           ),
           FlatButton(
             child:Text('前进'),
             onPressed:(){ 

             } ,
           ),
           FlatButton(
             child:Text('后退'),
             onPressed:(){
               
             } ,
           ),
             ]
           ),
           
           /*Container(
             height:200,
             //color: Colors.blue,
             //child:charts.LineChart(getLine1()),
             
                child: getLine1(),
                
              
           ),*/
              
              ],)
            )*/
            Container(

            )
             ]
              )
              )
         ]
       ),
    );
  }

  getSensorInfo()async{
    WebApi webApi =  WebApi.instance;
    sensorinfo=await webApi.getSensorInfo(oneSubProject.id, sensorType, 5, 0);
    //print(sensorinfo);
    numberList=['请选择'];
    setState(() {
      for(int a=0;a<sensorinfo.length;a++){
      numberList.add(sensorinfo[a].sensorId);
    }
    });
    
    print(numberList);
    count=await webApi.getSensorCountByType(oneSubProject.id,sensorType);
    //print(count);

    allPhase=await webApi.getAllPhase(oneSubProject.id);
    
  }

  getnewSensor(){
    newsensorinfo=[];
    
     for(int a=0;a<sensorinfo.length;a++){
      sensormap={};     
      sensormap['sensorId']=sensorinfo[a].sensorId;
      sensormap['id']=sensorinfo[a].id;
      sensormap['edge']=edgemap['${sensorinfo[a].edge}'];      
      sensormap['offerDir']=offerDir['${sensormap['offerDir']}'];
      sensormap['installStage']=sensorinfo[a].installStage;

       for(int b=0;b<allPhase.length;b++){
         //sensormap['name']='';
         //print(sensorinfo[a].installStage);
         //print(allPhase[b].id);
         if(sensorinfo[a].installStage==allPhase[b].id){
           sensormap['name']=allPhase[b].name;
           //stateName=allPhase[b].name;
           print(sensormap['name']);
         }
       }
       //if(stateName=='null')
      newsensorinfo.add(sensormap);
    }
    //print(newsensorinfo);
  

  }
}*/

/*class MyDataTableSource extends DataTableSource {
  MyDataTableSource(this.data,this.sensorType);

  //final List<User> data;
  List data=[];
  int sensorType;
  List newsensorinfo=[];
  String edge='';
  String offerDir='';
  @override
  DataRow getRow(int index) {    
    if(sensorType==2){
       if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${data[index]['sensorId']}')),
        DataCell(Text('${data[index]['name']}')),
         DataCell(Text('${data[index]['edge']}')),
      ],
    );
    }else if(sensorType==3){
      if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${data[index]['sensorId']}')),
        DataCell(Text('${data[index]['name']}')),
        DataCell(Text('${data[index]['offerDir']}')),
      ],
    );
    }else if(sensorType==4){
      if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${data[index]['sensorId']}')),
        DataCell(Text('${data[index]['name']}')),
      ],
    );
    }else if(sensorType==5){
      if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${data[index]['sensorId']}')),
        DataCell(Text('${data[index]['name']}')),
      ],
    );
    }   
    
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
}*/

import 'package:flutter/material.dart';
import 'infodialog.dart';
import 'denglu.dart';
//import 'package:apifm/apifm.dart' as Apifm;
//import 'package:charts_flutter/flutter.dart' as charts;
import 'login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/core.dart';

List cedianNumberlist = [];
List selectNumber = [];

class Newpagepointone extends StatefulWidget {
  Newpagepointone(
      {Key key,
      this.pointNumber,
      this.oneSubProject,
      this.sensorType,
      this.sensor,
      this.sensorinfo,
      this.bianhao,
      this.allPhase})
      : super(key: key);
  var oneSubProject;
  int pointNumber;
  //String pointNumber;
  int sensorType;
  List sensor = [];
  List sensorinfo = [];
  List bianhao = [];
  List allPhase = [];
  @override
  _NewpagepointoneState createState() => _NewpagepointoneState(
      this.pointNumber,
      this.oneSubProject,
      this.sensorType,
      this.sensor,
      this.sensorinfo,
      this.bianhao,
      this.allPhase);
}

class _NewpagepointoneState extends State<Newpagepointone>
    with AutomaticKeepAliveClientMixin {
  _NewpagepointoneState(this.pointNumber, this.oneSubProject, this.sensorType,
      this.sensor, this.sensorinfo, this.bianhao, this.allPhase);
  List pointStyle = ['请选择', '应变测点', '变形测点', '索力测点', '环境测点'];
  int pointNumber;
  //String pointNumber;
  var oneSubProject;
  List sensorinfo = [];
  List bianhao = [];
  List allPhase = [];
  int sensorType;
  int count;
  List stressDataByTime = [];
  List offsetDataByTime = [];
  List cableDataByTime = [];
  List envByTime = [];
  //List allPhase=[];
  bool get wantKeepAlive => true;

  List<Linesales> dataLine = [];
  List<Linesales> dataLine1 = [];
  List<Linesales> dataLine2 = [];
  List<Linesales> dataLine3 = [];
  /*List<SalesData> dataLine = [];
  List<SalesData> dataLine1 = [];
  List<SalesData> dataLine2 = [];*/
  int a = 0;
  String _value = '请选择';
  String _value1 = '请选择';
  //List pointStyle=['应变测点','变形测点','索力测点','环境测点'];
  List yingbian = ['拱肋1-1', '拱肋1-2', '系梁1-1', '系梁1-2'];
  List bianxing = ['扣塔测点1', '扣塔测点2', '扣塔测点3'];
  List suoli = ['背索测点1', '扣索测点1', '吊杆测点1'];
  List huanjing = ['温度测点1', '湿度测点1'];
  //List bianhao=['请选择'];
  String _starttime = '';
  String _endtime = '';
  int starttime;
  int endtime;
  String cedianStyle = '';
  int cedianNumber;
  int theoryId;
  int theoryNumber;
  //List cedianNumber1ist=[];
  List theoryId1ist = [];
  List theoryNumber1ist = [];
  /*List sensorOne=['测点编号','安装阶段','上下缘'];
  List sensorTwo=['测点编号','安装阶段','位移方向'];
  List sensorThree=['测点编号','安装阶段'];
  List sensorFour=['测点编号','安装阶段'];
  List sensor=['测点编号','安装阶段'];*/
  List sensor = [];
  List sensorDate = [];
  Map sensormap = {};
  Map sensormap1 = {};
  List<Map> newsensorinfo = [];
  List newsensorinfos = [];
  Map edgemap = {'1': '上', '2': '下', '0': '无该属性', 'null': 'null'};
  Map offerDir = {
    '1': '纵向',
    '2': '横向',
    '3': '纵横',
    '4': '竖向',
    '5': '纵竖',
    '6': '横竖',
    '7': '纵横竖',
    '0': '无该属性',
    'null': 'null'
  };
  String stateName = '';
  List theoryData = [];

  List theorycableForce = [];
  double theorycable;

  List installStageId = [];
  int startTime;
  int endTime;
  int time;
  List phaseId = [];
  List<Widget> checklist = [];
  var check;
  bool checkbool = false;
  List<bool> checkBool = [];
  List errorlist = [];
  double error;
  List<DataRow> datalist = [];
  List<DataRow> datalist1 = [];
  var content;
  String pointsensorId = '';
  ScrollController _scrollController;
  bool offstate = true;
  bool offstate1 = true;
  bool offstate2 = true;
  List dataColumn = ['测点编号', '测试值', '理论值', '误差'];
  List dataColumnv = ['测点编号', '测试竖', '理论竖', '误差'];
  List dataColumnh = ['测点编号', '测试横', '理论横', '误差'];
  List dataColumnl = ['测点编号', '测试纵', '理论纵', '误差'];
  List dataColumnt = ['测点编号', '测试温', '理论温', '误差'];
  List dataColumnhu = ['测点编号', '测试湿', '理论湿', '误差'];
  List dataRowlist = [];
  String pointStylename = '';
  bool offstate3 = true;
  bool offstate4 = true;
  List dataColumne = [
    '测点编号',
    '理论值',
    '实测max',
    '实测min',
    '差值max',
    '差值min',
    '误差max',
    '误差min'
  ];
  List cable = [];
  List theory = [];
  List errors = [];
  double difference;
  List differencelist = [];
  List<SalesData> dataLine4 = [];
  List<SalesData> dataLine5 = [];
  List<SalesData> dataLine6 = [];
  List<PointData> dataLine7 = [];
  List dataLine8 = [];
  List<Widget> icons = [Text('测点编号'), Icon(Icons.keyboard_arrow_down)];
  //List selectNumber=[];
  String groupValue = '';
  //List cedianNumberlist = [];
  List theoryNumberlist = [];
  List theoryIdlist = [];
  List valuelist = [];
  //List charts=[];
  var contentChart;
  List<ChartSeries<SalesData, String>> contentCharts = [];
  List<ChartSeries<PointData, String>> contentdoubleCharts = [];
  List cableDataByTimelist = [];
  List theoryDatalist = [];
  List theorycableForce1 = [];
  List dropdown = ['请选择', '最大值', '最小值', '最大差值', '最小差值', '最大误差', '最小误差'];
  String dropdownText = '请选择';
  List maxValue = [];
  List minValue = [];
  List maxdiffValue = [];
  List mindiffValue = [];
  List maxerrorValue = [];
  List minerrorValue = [];
  int _rowsPerPage = 3;
  List<User> _data = [];
  List<List<DataRow>> datalistone = [];
  List<List<DataRow>> datalisttwo = [];
  int index = 0;
  List<DataRow> datalists = [];
  List<DataRow> datalisth = [];
  List<DataRow> datalistz = [];
  List<DataRow> datalisthu = [];
  List<DataRow> datalistte = [];
  List<DataRow> datalistss = [];
  List<DataRow> datalisthh = [];
  List<DataRow> datalistzz = [];
  List<DataRow> datalisthuhu = [];
  List<DataRow> datalisttete = [];
  List theorycableForces = [];
  List theorycableForceh = [];
  List theorycableForcez = [];
  List theorycableForcehu = [];
  List theorycableForcete = [];
  List maxValues = [];
  List minValues = [];
  List maxdiffValues = [];
  List mindiffValues = [];
  List maxerrorValues = [];
  List minerrorValues = [];
  List maxValueh = [];
  List minValueh = [];
  List maxdiffValueh = [];
  List mindiffValueh = [];
  List maxerrorValueh = [];
  List minerrorValueh = [];
  List maxValuez = [];
  List minValuez = [];
  List maxdiffValuez = [];
  List mindiffValuez = [];
  List maxerrorValuez = [];
  List minerrorValuez = [];
  List maxValuehu = [];
  List minValuehu = [];
  List maxdiffValuehu = [];
  List mindiffValuehu = [];
  List maxerrorValuehu = [];
  List minerrorValuehu = [];
  List maxValuete = [];
  List minValuete = [];
  List maxdiffValuete = [];
  List mindiffValuete = [];
  List maxerrorValuete = [];
  List minerrorValuete = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(sensorType);
    getnewSensor();
    /*for(int a=0;a<sensorinfo.length;a++){
      print(sensorinfo[a].offerDir);
    }*/
    for (int a = 0; a < bianhao.length; a++) {
      checkBool.add(false);
    }
    if (sensorType == 3) {
      setState(() {
        offstate1 = false;
      });
    } else if (sensorType == 5) {
      setState(() {
        offstate2 = false;
      });
    }
    _starttime = DateTime.now()
        .subtract(Duration(days: 180))
        .toString()
        .substring(0, 10);
    _endtime = DateTime.now().toString().substring(0, 10);
    starttime =
        DateTime.now().subtract(Duration(days: 180)).millisecondsSinceEpoch;
    endtime = DateTime.now().millisecondsSinceEpoch;
    //0722
    for (int a = 0; a < newsensorinfo.length; a++) {
      _data.add(User(
          newsensorinfo[a]['sensorId'],
          newsensorinfo[a]['name'],
          newsensorinfo[a]['offerDir'],
          newsensorinfo[a]['edge'],
          newsensorinfo[a]['markId']));
    }
    //print(newsensorinfo);
    cedianNumberlist = [];
    selectNumber = [];
    datalist = datalists;
    datalist1 = datalistss;
    SyncfusionLicense.registerLicense(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(pointStyle[pointNumber + 1]),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: ListView(
                    //shrinkWrap: true,
                    controller: _scrollController,
                    children: [
                  /*Container(
                    child: Text('图片'),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    //color: Colors.blue,
                    width: MediaQuery.of(context).size.width - 22,
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)),
                  ),*/
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
                          '测点定义',
                          style: TextStyle(fontSize: 15),
                        ),
                        columns: sensor.map((f) {
                          return DataColumn(label: Text(f));
                        }).toList(),
                        rowsPerPage:
                            _data.length < 3 ? _data.length : _rowsPerPage,
                        /*actions: <Widget>[
                          FlatButton(
                            //icon: Icon(Icons.check), 
                            child:Text('测点分析'),
                            onPressed: (){
                              setState(() {
                                if (sensorType == 2) {
                                  getStressDataByTime();
                                } else if (sensorType == 3) {
                                  getOffsetDataByTime();
                                } else if (sensorType == 4) {
                                  getCableDataByTime();
                                } else if (sensorType == 5) {
                                  getEnvByTime();
                                }
                              });
                              print(cedianNumberlist);
                              print(selectNumber);
                            })
                        ],*/
                        /*onRowsPerPageChanged: (v) {
                             setState(() {
                            _rowsPerPage = v;
                                            });
                        },*/
                        //availableRowsPerPage: [3,5,7],
                        //source: MyDataTableSource(sensorinfo,sensorType),
                        //source: MyDataTableSource(newsensorinfo, sensorType)),
                        source: MyDataTableSource(_data, sensorType)),
                  ),
                  Container(
                      child: Column(children: [
                    Container(
                        color: Colors.white,
                        child: Row(children: [
                          SizedBox(width: 10),
                          Text('统计周期:'),
                          //SizedBox(width: 5),
                          Container(
                              width: 90,
                              child: TextField(
                                decoration: InputDecoration(hintText: '起始时间'),
                                controller:
                                    TextEditingController(text: _starttime),
                                //controller: startTime,
                                onTap: () {
                                  showDatePicker(
                                          //helpText:'日期',
                                          locale: Locale('zh'),
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now().subtract(
                                              new Duration(days: 365)),
                                          lastDate: DateTime.now()
                                              .add(new Duration(days: 365)))
                                      .then((onValue) {
                                    setState(() {
                                      _starttime =
                                          onValue.toString().substring(0, 10);
                                      starttime =
                                          onValue.millisecondsSinceEpoch;
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
                          SizedBox(width: 5),
                          Container(
                              width: 90,
                              child: TextField(
                                decoration: InputDecoration(hintText: '结束时间'),
                                controller:
                                    TextEditingController(text: _endtime),
                                //controller: endTime,
                                onTap: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now().subtract(
                                              new Duration(days: 365)),
                                          lastDate: DateTime.now()
                                              .add(new Duration(days: 365)))
                                      .then((onValue) {
                                    setState(() {
                                      _endtime =
                                          onValue.toString().substring(0, 10);
                                      endtime = onValue.millisecondsSinceEpoch;
                                      print(endtime);
                                    });
                                  });
                                  //_getworkloadbytime(context);
                                },
                                onChanged: (v) {
                                  setState(() {
                                    _endtime = v;
                                  });

                                  //_getworkloadbytime(context);
                                },
                              )),
                          //测点编号
                          /*FlatButton(
                              color: Colors.white,
                              child: Row(children:icons),
                              onPressed: () {
                                  showAlertDialog();
                                  /*setState(() {
                                    offstate = !offstate;
                                    if(offstate==false){
                                      icons=[Text('测点编号'),Icon(Icons.keyboard_arrow_up)];
                                    }else if(offstate==true){
                                      icons=[Text('测点编号'),Icon(Icons.keyboard_arrow_down)];
                                    }
                                  });*/
                              },
                            ),*/
                          /*Container(
                          width:70,
                          child:FlatButton(
                        color: Colors.white,
                          child: Text('确定'),
                          onPressed: () {
                            if (sensorType == 2) {
                              getStressDataByTime();
                            } else if (sensorType == 3) {
                              getOffsetDataByTime();
                            } else if (sensorType == 4) {
                              getCableDataByTime();
                            } else if (sensorType == 5) {
                              getEnvByTime();
                            }

                            //getTheoryData();
                          }),
                        )*/
                          //位移选择
                          /*Offstage(
                          offstage: offstate1,
                          child:DropdownButton(
                          value: _value,
                          items: ['请选择','位移竖','位移横','位移纵'].map((e) => DropdownMenuItem(child: Text(e),value: e,)).toList(), 
                          onChanged: (v){
                            setState(() {
                              _value=v;
                            });
                          }
                          )
                        )*/
                        ])),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        /*Container(
                child:Row(children: <Widget>[
                  SizedBox(width:10),
                  Text('测点类型:'),
                  SizedBox(width:5),
              DropdownButton(
                value: _value,
                items: pointStyle.map((f){
                  return DropdownMenuItem(child: Text(f),value:f);
                }).toList(),
                 onChanged:(v){
                    setState(() {
                      _value=v;
                      _value1='请选择';
                      if(v=='应变测点'){
                        //sensorType=2;
                        //sensor=sensorOne;
                      }else if(v=='变形测点'){
                        //sensorType=3;
                        //sensor=sensorTwo;
                      }else if(v=='索力测点'){
                        //sensorType=4;
                        //sensor=sensorThree;
                      }else if(v=='环境测点'){
                        //sensorType=5;
                        //sensor=sensorFour;
                      }
                      getSensorInfo();
                      //getAllPhase();
                      //newsensorinfos=newsensorinfo;
                      //getnewSensor();
                    });
                 }
                 )
                ],)
              ),*/
                        Container(
                            child: Row(
                          children: <Widget>[
                            //SizedBox(width: 40),
                            /*FlatButton(
                              color: Colors.white,
                              child: Row(children:icons),
                              onPressed: () {
                                  showAlertDialog();
                                  /*setState(() {
                                    offstate = !offstate;
                                    if(offstate==false){
                                      icons=[Text('测点编号'),Icon(Icons.keyboard_arrow_up)];
                                    }else if(offstate==true){
                                      icons=[Text('测点编号'),Icon(Icons.keyboard_arrow_down)];
                                    }
                                  });*/
                              },
                            ),*/

                            /*SizedBox(width:5),
              DropdownButton(
                value: _value1,
                items: bianhao.map((f){
                  return DropdownMenuItem(child: Text(f),value: f,);
                }).toList(),
                 onChanged:(v){
                    setState(() {
                      _value1=v;
                      //getnewSensor();
                      if(v=='请选择'){

                      }else{
                        for(int a=0;a<sensorinfo.length;a++){
                          if(sensorinfo[a].sensorId==v){
                              //cedianNumber=sensorinfo[a].id;
                              cedianNumber=sensorinfo[a].markId;
                              theoryNumber=sensorinfo[a].id;
                              theoryId=sensorinfo[a].installStage;
                          }
                        }
                        print(cedianNumber);
                        
                      }
                      
                    });
                 }
                 )*/
                          ],
                        )),
                        //SizedBox(width: 10),
                      ],
                    ),
                    Offstage(
                        offstage: offstate,
                        child: Container(
                            child: Column(children: showChecktile()))),
                  ])),

                  Row(
                    children: <Widget>[
                      FlatButton(
                        color: Colors.white,
                        child: Text('监测曲线'),
                        onPressed: () {
                          setState(() {
                            if (offstate3 == true) {
                              offstate3 = false;
                            }
                            offstate4 = true;
                            dataLine1 = [];
                            dataLine = [];
                            dataLine2 = [];
                            dataLine4 = [];
                            setState(() {
                              if (sensorType == 2) {
                                /*dataLine4 = [];
                              for (int a = 0;
                                      a < stressDataByTime.length;
                                      a++) {
                                    dataLine4.add(SalesData(stressDataByTime[a].sampleTime.toString().substring(0,13),stressDataByTime[a].phasesStress)); 
                                  }
                                  dataLine5 = dataLine4;
                                  
                                  dataLine4 = [];
                                  for (int a = 0;
                                      a < theorycableForce.length;
                                      a++) {
                                    dataLine4.add(SalesData(stressDataByTime[a].sampleTime.toString().substring(0,13),theorycableForce[a]));
                                  }
                                  dataLine6 = dataLine4;*/
                                getStressDataByTime();
                                //0723注销
                                /*dataLine = [];
                                dataLine4 = [];
                                contentCharts=[];
                                for(int b=0;b<selectNumber.length;b++){
                                    dataLine4 = [];
                                    dataLine5 = [];
                                    dataLine6 = [];
                                    for (int a = 0;
                                      a < cableDataByTimelist[b].length;
                                      a++) {
                                    dataLine4.add(SalesData(cableDataByTimelist[b][a].sampleTime.toString().substring(0,13),cableDataByTimelist[b][a].phasesStress)); 
                                  }
                                  dataLine5 = dataLine4;
                                  //dataLine7.add(dataLine4);
                                  contentChart=LineSeries<SalesData, String>(
                                  name: '实际'+selectNumber[b],
                                  dataSource:dataLine5,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  markerSettings: MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);
                                  dataLine = [];
                                  dataLine4 = [];
                                  for (int a = 0; 
                                      a < theorycableForce1[b].length;
                                      a++) {
                                    dataLine4.add(SalesData(cableDataByTimelist[b][a].sampleTime.toString().substring(0,13),theorycableForce1[b][a]));
                                  }
                                  dataLine6 = dataLine4;
                                  dataLine8.add(dataLine4);
                                  contentChart=LineSeries<SalesData, String>(
                                  name: '理论'+selectNumber[b],
                                  dataSource:dataLine6,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  markerSettings: MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);
                                  //0723注销
                                  /*dataLine4 = [];
                                    dataLine5 = [];
                                    dataLine6 = [];
                                    for (int a = 0;
                                      a < cableDataByTimelist[1].length;
                                      a++) {
                                    dataLine4.add(SalesData(cableDataByTimelist[1][a].sampleTime.toString().substring(0,13),cableDataByTimelist[1][a].cableForce)); 
                                  }
                                  dataLine5 = dataLine4;
                                  //dataLine7.add(dataLine4);
                                  contentChart=LineSeries<SalesData, String>(
                                  name: '实际'+selectNumber[1],
                                  dataSource:dataLine5,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  markerSettings: MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);
                                  dataLine = [];
                                  dataLine4 = [];
                                  for (int a = 0; 
                                      a < theorycableForce1[1].length;
                                      a++) {
                                    dataLine4.add(SalesData(cableDataByTimelist[1][a].sampleTime.toString().substring(0,13),theorycableForce1[1][a]));
                                  }
                                  dataLine6 = dataLine4;
                                  dataLine8.add(dataLine4);
                                  contentChart=LineSeries<SalesData, String>(
                                  name: '理论'+selectNumber[1],
                                  dataSource:dataLine6,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  markerSettings: MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);*/
                                }*/

                              } else if (sensorType == 3) {
                                getOffsetDataByTime();
                                /* datalists = [];
                                 datalisth = [];
                                 datalistz = [];
                                 datalistss = [];
                                 datalisthh = [];
                                 datalistzz = [];
                                datalistone=[];
                                datalisttwo=[];
                                
                                
                                //位移横
                                setState(() {
                                pointStylename='位移横';
                                dataColumn=dataColumnh;
                                datalist=[];
                                theorycableForce1=[];
                                maxValue=[];
                                minValue=[];
                                maxdiffValue=[];
                                mindiffValue=[];
                                maxerrorValue=[];
                                minerrorValue=[];
                                maxValueh=[];
                                minValueh=[];
                                maxdiffValueh=[];
                                mindiffValueh=[];
                                maxerrorValueh=[];
                                minerrorValueh=[];
                                for(int e=0;e<cedianNumberlist.length;e++){
                                phaseId=[];
                                theorycableForce = [];
                                errorlist=[];
                                differencelist=[];
                                datalist1=[];     //0721新增
                                theorycableForceh=[];
                                for (int a = 0; a < cableDataByTimelist[e].length; a++) {
                                    time = 0;
                                    time =
                                          DateTime.parse(cableDataByTimelist[e][a].sampleTime).millisecondsSinceEpoch;
                                for (int b = 0; b < allPhase.length; b++) {
                                    startTime = 0;
                                    endTime = 0;
                                    startTime =
                                            DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
                                    endTime = DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
                                if (time < endTime && time > startTime) {
                                    theoryId = 0;
                                    theoryId = allPhase[b].id;
                                     phaseId.add(theoryId);
                                }
                                }
                                }
                                //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);
    
                                for (int a = 0; a < theoryDatalist[e].length; a++) {
                                    for (int b = 0; b < phaseId.length; b++) {
                                        if (theoryDatalist[e][a].phaseId == phaseId[b]) {
                                            theorycable = 0;
                                            theorycable = theoryDatalist[e][a].hOffset;
                                            theorycableForce.add(theorycable);
                                            //theorycableForce1.add(theorycableForce);
                                        }
                                    }
                                }
                                theorycableForce1.add(theorycableForce);
                                theorycableForceh.add(theorycableForce);
                                print(1);
                                print(theorycableForce);
                                //print(theorycableForce1);
                                String error1 = '';
    
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    error = 0;
                                    error = (cableDataByTimelist[e][a].horizontalOffset - theorycableForce[a]) /
                                    theorycableForce[a];
                                    error1 = (error * 100).toStringAsFixed(2);
                                    error = double.parse(error1);
                                    errorlist.add(error);
                                    difference=cableDataByTimelist[e][a].horizontalOffset - theorycableForce[a];
                                    differencelist.add(difference);
                                }
                                print(2);
                                print(errorlist);
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    cableDataByTimelist[e][a].horizontalOffset.toString(),
                                    theorycableForce[a].toString(),
                                    errorlist[a].toString() + '%'
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                       datalist.add(content);
                                       datalisth.add(content);
                                    });
                                }
                                //特征值分析
                                cable=[];
                                for (int a = 0; a < cableDataByTimelist[e].length; a++){
                                    cable.add(cableDataByTimelist[e][a].horizontalOffset);
                                }
                                cable.sort((a, b) => (a).compareTo(b));    //从小到大排列
                                differencelist.sort((a, b) => (a).compareTo(b));
                                errorlist.sort((a, b) => (a).compareTo(b));
                                print(cable);
                                print('11');
                                maxValue.add(cable[cable.length-1]);
                                minValue.add(cable[0]);
                                maxdiffValue.add(differencelist[differencelist.length-1]);
                                mindiffValue.add(differencelist[0]);
                                maxerrorValue.add(errorlist[errorlist.length-1]);
                                minerrorValue.add(errorlist[0]);
                                maxValueh.add(cable[cable.length-1]);
                                minValueh.add(cable[0]);
                                maxdiffValueh.add(differencelist[differencelist.length-1]);
                                mindiffValueh.add(differencelist[0]);
                                maxerrorValueh.add(errorlist[errorlist.length-1]);
                                minerrorValueh.add(errorlist[0]);
                                print(maxValue);
                                print(minValue);
                                //datalist1=[];
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    theorycableForce[a].toString(),
                                    //cableDataByTime[a].cableForce.toString(),
                                    cable[cable.length-1].toString(),
                                    cable[0].toString(),
                                    differencelist[differencelist.length-1].toString(),
                                    differencelist[0].toString(),
                                    errorlist[errorlist.length-1].toString() + '%',
                                    errorlist[0].toString() + '%',
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                        datalist1.add(content);
                                        datalisthh.add(content);
                                    });
                                }
                                }
                                
                                });
                                //位移纵
                                setState(() {
                                pointStylename='位移纵';
                                dataColumn=dataColumnl;
                                datalist=[];
                                theorycableForce1=[];
                                maxValue=[];
                                minValue=[];
                                maxdiffValue=[];
                                mindiffValue=[];
                                maxerrorValue=[];
                                minerrorValue=[];
                                maxValuez=[];
                                minValuez=[];
                                maxdiffValuez=[];
                                mindiffValuez=[];
                                maxerrorValuez=[];
                                minerrorValuez=[];
                                for(int e=0;e<cedianNumberlist.length;e++){
                                phaseId=[];
                                theorycableForce = [];
                                errorlist=[];
                                differencelist=[];
                                datalist1=[];     //0721新增
                                theorycableForcez=[];
                                for (int a = 0; a < cableDataByTimelist[e].length; a++) {
                                    time = 0;
                                    time =
                                          DateTime.parse(cableDataByTimelist[e][a].sampleTime).millisecondsSinceEpoch;
                                for (int b = 0; b < allPhase.length; b++) {
                                    startTime = 0;
                                    endTime = 0;
                                    startTime =
                                            DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
                                    endTime = DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
                                if (time < endTime && time > startTime) {
                                    theoryId = 0;
                                    theoryId = allPhase[b].id;
                                     phaseId.add(theoryId);
                                }
                                }
                                }
                                //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);
    
                                for (int a = 0; a < theoryDatalist[e].length; a++) {
                                    for (int b = 0; b < phaseId.length; b++) {
                                        if (theoryDatalist[e][a].phaseId == phaseId[b]) {
                                            theorycable = 0;
                                            theorycable = theoryDatalist[e][a].lOffset;
                                            theorycableForce.add(theorycable);
                                            //theorycableForce1.add(theorycableForce);
                                        }
                                    }
                                }
                                theorycableForce1.add(theorycableForce);
                                theorycableForcez.add(theorycableForce);
                                print(1);
                                print(theorycableForce);
                                //print(theorycableForce1);
                                String error1 = '';
    
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    error = 0;
                                    error = (cableDataByTimelist[e][a].longitudinalOffset - theorycableForce[a]) /
                                    theorycableForce[a];
                                    error1 = (error * 100).toStringAsFixed(2);
                                    error = double.parse(error1);
                                    errorlist.add(error);
                                    difference=cableDataByTimelist[e][a].longitudinalOffset - theorycableForce[a];
                                    differencelist.add(difference);
                                }
                                print(2);
                                print(errorlist);
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    cableDataByTimelist[e][a].longitudinalOffset.toString(),
                                    theorycableForce[a].toString(),
                                    errorlist[a].toString() + '%'
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                       datalist.add(content);
                                       datalistz.add(content);
                                    });
                                }
                                //特征值分析
                                cable=[];
                                for (int a = 0; a < cableDataByTimelist[e].length; a++){
                                    cable.add(cableDataByTimelist[e][a].longitudinalOffset);
                                }
                                cable.sort((a, b) => (a).compareTo(b));    //从小到大排列
                                differencelist.sort((a, b) => (a).compareTo(b));
                                errorlist.sort((a, b) => (a).compareTo(b));
                                print(cable);
                                print('11');
                                maxValue.add(cable[cable.length-1]);
                                minValue.add(cable[0]);
                                maxdiffValue.add(differencelist[differencelist.length-1]);
                                mindiffValue.add(differencelist[0]);
                                maxerrorValue.add(errorlist[errorlist.length-1]);
                                minerrorValue.add(errorlist[0]);
                                maxValuez.add(cable[cable.length-1]);
                                minValuez.add(cable[0]);
                                maxdiffValuez.add(differencelist[differencelist.length-1]);
                                mindiffValuez.add(differencelist[0]);
                                maxerrorValuez.add(errorlist[errorlist.length-1]);
                                minerrorValuez.add(errorlist[0]);
                                print(maxValue);
                                print(minValue);
                                //datalist1=[];
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    theorycableForce[a].toString(),
                                    //cableDataByTime[a].cableForce.toString(),
                                    cable[cable.length-1].toString(),
                                    cable[0].toString(),
                                    differencelist[differencelist.length-1].toString(),
                                    differencelist[0].toString(),
                                    errorlist[errorlist.length-1].toString() + '%',
                                    errorlist[0].toString() + '%',
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                        datalist1.add(content);
                                        datalistzz.add(content);
                                    });
                                }
                                }
                                /*datalist=datalists;
                                datalist1=datalistss;
                                dataColumn=dataColumnv;
                                theorycableForce1=theorycableForces;
                                //datalist=[];
                                //theorycableForce1=[];
                                maxValue=[];
                                minValue=[];
                                maxdiffValue=[];
                                mindiffValue=[];
                                maxerrorValue=[];
                                minerrorValue=[];*/
                                });

                                //位移竖
                                setState(() {
                                  pointStylename='位移竖';
                                dataColumn=dataColumnv;
                                datalist=[];
                                theorycableForce1=[];
                                maxValue=[];
                                minValue=[];
                                maxdiffValue=[];
                                mindiffValue=[];
                                maxerrorValue=[];
                                minerrorValue=[];
                                maxValues=[];
                                minValues=[];
                                maxdiffValues=[];
                                mindiffValues=[];
                                maxerrorValues=[];
                                minerrorValues=[];
                                datalist1=[];     //0721新增
                                theorycableForces=[];
                                for(int e=0;e<cedianNumberlist.length;e++){
                                phaseId=[];
                                theorycableForce = [];
                                errorlist=[];
                                differencelist=[];
    
                                for (int a = 0; a < cableDataByTimelist[e].length; a++) {
                                    time = 0;
                                    time =
                                          DateTime.parse(cableDataByTimelist[e][a].sampleTime).millisecondsSinceEpoch;
                                for (int b = 0; b < allPhase.length; b++) {
                                    startTime = 0;
                                    endTime = 0;
                                    startTime =
                                            DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
                                    endTime = DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
                                if (time < endTime && time > startTime) {
                                    theoryId = 0;
                                    theoryId = allPhase[b].id;
                                     phaseId.add(theoryId);
                                }
                                }
                                }
                                //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);
    
                                for (int a = 0; a < theoryDatalist[e].length; a++) {
                                    for (int b = 0; b < phaseId.length; b++) {
                                        if (theoryDatalist[e][a].phaseId == phaseId[b]) {
                                            theorycable = 0;
                                            theorycable = theoryDatalist[e][a].vOffset;
                                            theorycableForce.add(theorycable);
                                            //theorycableForce1.add(theorycableForce);
                                        }
                                    }
                                }
                                theorycableForce1.add(theorycableForce);
                                theorycableForces.add(theorycableForce);
                                print(1);
                                print(theorycableForce);
                                //print(theorycableForce1);
                                String error1 = '';
    
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    error = 0;
                                    error = (cableDataByTimelist[e][a].verticalOffset - theorycableForce[a]) /
                                    theorycableForce[a];
                                    error1 = (error * 100).toStringAsFixed(2);
                                    error = double.parse(error1);
                                    errorlist.add(error);
                                    difference=cableDataByTimelist[e][a].verticalOffset - theorycableForce[a];
                                    differencelist.add(difference);
                                }
                                print(2);
                                print(errorlist);
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    cableDataByTimelist[e][a].verticalOffset.toString(),
                                    theorycableForce[a].toString(),
                                    errorlist[a].toString() + '%'
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                       datalist.add(content);
                                       datalists.add(content);
                                    });
                                }
                                //特征值分析
                                cable=[];
                                //theorycableForce=[];
                                for (int a = 0; a < cableDataByTimelist[e].length; a++){
                                    cable.add(cableDataByTimelist[e][a].verticalOffset);
                                }
                                cable.sort((a, b) => (a).compareTo(b));    //从小到大排列
                                differencelist.sort((a, b) => (a).compareTo(b));
                                errorlist.sort((a, b) => (a).compareTo(b));
                                print(cable);
                                print('11');
                                maxValue.add(cable[cable.length-1]);
                                minValue.add(cable[0]);
                                maxdiffValue.add(differencelist[differencelist.length-1]);
                                mindiffValue.add(differencelist[0]);
                                maxerrorValue.add(errorlist[errorlist.length-1]);
                                minerrorValue.add(errorlist[0]);
                                maxValues.add(cable[cable.length-1]);
                                minValues.add(cable[0]);
                                maxdiffValues.add(differencelist[differencelist.length-1]);
                                mindiffValues.add(differencelist[0]);
                                maxerrorValues.add(errorlist[errorlist.length-1]);
                                minerrorValues.add(errorlist[0]);
                                print(maxValue);
                                print(minValue);
                                //datalist1=[];
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    theorycableForce[a].toString(),
                                    //cableDataByTime[a].cableForce.toString(),
                                    cable[cable.length-1].toString(),
                                    cable[0].toString(),
                                    differencelist[differencelist.length-1].toString(),
                                    differencelist[0].toString(),
                                    errorlist[errorlist.length-1].toString() + '%',
                                    errorlist[0].toString() + '%',
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                        datalist1.add(content);
                                        datalistss.add(content);
                                    });
                                }
                                }
                                });*/
                                //0722新增
                                /*if(pointStylename=='位移竖'){
                                  /*for (int a = 0;
                                      a < offsetDataByTime.length;
                                      a++) {

                                    dataLine4.add(SalesData(offsetDataByTime[a].sampleTime.toString().substring(0,13),offsetDataByTime[a].verticalOffset));
                                  }

                                  dataLine5 = dataLine4;
                                  dataLine4 = [];
                                  for (int a = 0;
                                      a < theorycableForce.length;
                                      a++) {

                                    dataLine4.add(SalesData(offsetDataByTime[a].sampleTime.toString().substring(0,13),theorycableForce[a]));
                                    //dataLine6 = dataLine4;
                                  }
                                  //dataLine2 = dataLine;
                                  dataLine6 = dataLine4;*/
                                //0722注销
                                dataLine = [];
                                dataLine4 = [];
                                contentCharts=[];
                                for(int b=0;b<selectNumber.length;b++){
                                    dataLine4 = [];
                                    dataLine5 = [];
                                    dataLine6 = [];
                                    for (int a = 0;
                                      a < cableDataByTimelist[b].length;
                                      a++) {
                                    dataLine4.add(SalesData(cableDataByTimelist[b][a].sampleTime.toString().substring(0,13),cableDataByTimelist[b][a].verticalOffset)); 
                                  }
                                  dataLine5 = dataLine4;
                                  //dataLine7.add(dataLine4);
                                  contentChart=LineSeries<SalesData, String>(
                                  name: '实际'+selectNumber[b],
                                  dataSource:dataLine5,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  markerSettings: MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);
                                  dataLine = [];
                                  dataLine4 = [];
                                  for (int a = 0; 
                                      a < theorycableForce1[b].length;
                                      a++) {
                                    dataLine4.add(SalesData(cableDataByTimelist[b][a].sampleTime.toString().substring(0,13),theorycableForce1[b][a]));
                                  }
                                  dataLine6 = dataLine4;
                                  dataLine8.add(dataLine4);
                                  contentChart=LineSeries<SalesData, String>(
                                  name: '理论'+selectNumber[b],
                                  dataSource:dataLine6,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  markerSettings: MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);
                                } 
                                //0722注销
                                
                              }else if(pointStylename=='位移横'){
                                  /*for (int a = 0;
                                      a < offsetDataByTime.length;
                                      a++) {
                                    //dataLine.add(Linesales(int.parse(cableDataByTime[a].sampleTime), cableDataByTime[a].cableForce));
                                    /*dataLine.add(Linesales(
                                        DateTime.parse(
                                            offsetDataByTime[a].sampleTime),
                                        offsetDataByTime[a].horizontalOffset));*/
                                    dataLine4.add(SalesData(offsetDataByTime[a].sampleTime.toString().substring(0,13),offsetDataByTime[a].horizontalOffset));
                                  }
                                  /*dataLine1 = dataLine;
                                  dataLine = [];*/
                                  dataLine5 = dataLine4;
                                  dataLine4 = [];
                                  for (int a = 0;
                                      a < theorycableForce.length;
                                      a++) {
                                    //dataLine.add(Linesales(int.parse(cableDataByTime[a].sampleTime), cableDataByTime[a].cableForce));
                                    /*dataLine.add(Linesales(
                                        DateTime.parse(
                                            offsetDataByTime[a].sampleTime),
                                        theorycableForce[a]));*/
                                    dataLine4.add(SalesData(offsetDataByTime[a].sampleTime.toString().substring(0,13),theorycableForce[a]));
                                    
                                  }
                                  //dataLine2 = dataLine;
                                  dataLine6 = dataLine4;*/
                                dataLine = [];
                                dataLine4 = [];
                                contentCharts=[];
                                for(int b=0;b<selectNumber.length;b++){
                                    dataLine4 = [];
                                    dataLine5 = [];
                                    dataLine6 = [];
                                    for (int a = 0;
                                      a < cableDataByTimelist[b].length;
                                      a++) {
                                    dataLine4.add(SalesData(cableDataByTimelist[b][a].sampleTime.toString().substring(0,13),cableDataByTimelist[b][a].horizontalOffset)); 
                                  }
                                  dataLine5 = dataLine4;
                                  //dataLine7.add(dataLine4);
                                  contentChart=LineSeries<SalesData, String>(
                                  name: '实际'+selectNumber[b],
                                  dataSource:dataLine5,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  markerSettings: MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);
                                  dataLine = [];
                                  dataLine4 = [];
                                  for (int a = 0; 
                                      a < theorycableForce1[b].length;
                                      a++) {
                                    dataLine4.add(SalesData(cableDataByTimelist[b][a].sampleTime.toString().substring(0,13),theorycableForce1[b][a]));
                                  }
                                  dataLine6 = dataLine4;
                                  dataLine8.add(dataLine4);
                                  contentChart=LineSeries<SalesData, String>(
                                  name: '理论'+selectNumber[b],
                                  dataSource:dataLine6,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  markerSettings: MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);
                                } 

                              }else if(pointStylename=='位移纵'){
                                  /*for (int a = 0;
                                      a < offsetDataByTime.length;
                                      a++) {
                                    //dataLine.add(Linesales(int.parse(cableDataByTime[a].sampleTime), cableDataByTime[a].cableForce));
                                    /*dataLine.add(Linesales(
                                        DateTime.parse(
                                            offsetDataByTime[a].sampleTime),
                                        offsetDataByTime[a].longitudinalOffset));*/
                                    dataLine4.add(SalesData(offsetDataByTime[a].sampleTime.toString().substring(0,13),offsetDataByTime[a].longitudinalOffset));
                                  }
                                  /*dataLine1 = dataLine;
                                  dataLine = [];*/
                                  dataLine5 = dataLine4;
                                  dataLine4 = [];
                                  for (int a = 0;
                                      a < theorycableForce.length;
                                      a++) {
                                    //dataLine.add(Linesales(int.parse(cableDataByTime[a].sampleTime), cableDataByTime[a].cableForce));
                                    /*dataLine.add(Linesales(
                                        DateTime.parse(
                                            offsetDataByTime[a].sampleTime),
                                        theorycableForce[a]));*/
                                    dataLine4.add(SalesData(offsetDataByTime[a].sampleTime.toString().substring(0,13),theorycableForce[a]));
                                  }
                                  //dataLine2 = dataLine;
                                  dataLine6 = dataLine4;*/
                                dataLine = [];
                                dataLine4 = [];
                                contentCharts=[];
                                for(int b=0;b<selectNumber.length;b++){
                                    dataLine4 = [];
                                    dataLine5 = [];
                                    dataLine6 = [];
                                    for (int a = 0;
                                      a < cableDataByTimelist[b].length;
                                      a++) {
                                    dataLine4.add(SalesData(cableDataByTimelist[b][a].sampleTime.toString().substring(0,13),cableDataByTimelist[b][a].longitudinalOffset)); 
                                  }
                                  dataLine5 = dataLine4;
                                  //dataLine7.add(dataLine4);
                                  contentChart=LineSeries<SalesData, String>(
                                  name: '实际'+selectNumber[b],
                                  dataSource:dataLine5,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  markerSettings: MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);
                                  dataLine = [];
                                  dataLine4 = [];
                                  for (int a = 0; 
                                      a < theorycableForce1[b].length;
                                      a++) {
                                    dataLine4.add(SalesData(cableDataByTimelist[b][a].sampleTime.toString().substring(0,13),theorycableForce1[b][a]));
                                  }
                                  dataLine6 = dataLine4;
                                  dataLine8.add(dataLine4);
                                  contentChart=LineSeries<SalesData, String>(
                                  name: '理论'+selectNumber[b],
                                  dataSource:dataLine6,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  markerSettings: MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);
                                } 
                              }*/

                              } else if (sensorType == 4) {
                                /*dataLine = [];
                              dataLine4 = [];
                              contentCharts=[];*/
                                /*for (int a = 0;
                                      a < cableDataByTime.length;
                                      a++) {
                                    //dataLine.add(Linesales(int.parse(cableDataByTime[a].sampleTime), cableDataByTime[a].cableForce));
                                    /*dataLine.add(Linesales(
                                        DateTime.parse(
                                            cableDataByTime[a].sampleTime),
                                        cableDataByTime[a].cableForce));*/
                                    dataLine4.add(SalesData(cableDataByTime[a].sampleTime.toString().substring(0,13),cableDataByTime[a].cableForce)); 
                                  }
                                  dataLine5 = dataLine4;
                                  dataLine = [];
                                  dataLine4 = [];
                                  for (int a = 0;
                                      a < theorycableForce.length;
                                      a++) {
                                    //dataLine.add(Linesales(int.parse(cableDataByTime[a].sampleTime), cableDataByTime[a].cableForce));
                                    /*dataLine.add(Linesales(
                                        DateTime.parse(
                                            cableDataByTime[a].sampleTime),
                                        theorycableForce[a]));*/
                                    dataLine4.add(SalesData(cableDataByTime[a].sampleTime.toString().substring(0,13),theorycableForce[a]));
                                  }
                                  dataLine6 = dataLine4;*/
                                getCableDataByTime();
                                //0723注销
                                /*dataLine = [];
                                dataLine4 = [];
                                contentCharts=[];
                                for(int b=0;b<selectNumber.length;b++){
                                    dataLine4 = [];
                                    dataLine5 = [];
                                    dataLine6 = [];
                                    for (int a = 0;
                                      a < cableDataByTimelist[b].length;
                                      a++) {
                                    dataLine4.add(SalesData(cableDataByTimelist[b][a].sampleTime.toString().substring(0,13),cableDataByTimelist[b][a].cableForce)); 
                                  }
                                  dataLine5 = dataLine4;
                                  //dataLine7.add(dataLine4);
                                  contentChart=LineSeries<SalesData, String>(
                                  name: '实际'+selectNumber[b],
                                  dataSource:dataLine5,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  markerSettings: MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);
                                  dataLine = [];
                                  dataLine4 = [];
                                  for (int a = 0; 
                                      a < theorycableForce1[b].length;
                                      a++) {
                                    dataLine4.add(SalesData(cableDataByTimelist[b][a].sampleTime.toString().substring(0,13),theorycableForce1[b][a]));
                                  }
                                  dataLine6 = dataLine4;
                                  dataLine8.add(dataLine4);
                                  contentChart=LineSeries<SalesData, String>(
                                  name: '理论'+selectNumber[b],
                                  dataSource:dataLine6,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  markerSettings: MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);

                                }*/
                                //0723注销
                              } else if (sensorType == 5) {
                                getEnvByTime(); //0723新增
                                //0723增
                                //湿度
                                /*setState(() {
                                pointStylename='湿度';
                                dataColumn=dataColumnhu;
                                datalist=[];
                                theorycableForce1=[];
                                maxValue=[];
                                minValue=[];
                                maxdiffValue=[];
                                mindiffValue=[];
                                maxerrorValue=[];
                                minerrorValue=[];
                                datalisthu=[];
                                datalisthuhu=[];
                                maxValuehu=[];
                                minValuehu=[];
                                maxdiffValuehu=[];
                                mindiffValuehu=[];
                                maxerrorValuehu=[];
                                minerrorValuehu=[];
                                theorycableForcehu=[];
                                for(int e=0;e<cedianNumberlist.length;e++){
                                phaseId=[];
                                theorycableForce = [];
                                errorlist=[];
                                differencelist=[];
                                datalist1=[];     //0721新增
                                for (int a = 0; a < cableDataByTimelist[e].length; a++) {
                                    time = 0;
                                    time =
                                          DateTime.parse(cableDataByTimelist[e][a].sampleTime).millisecondsSinceEpoch;
                                for (int b = 0; b < allPhase.length; b++) {
                                    startTime = 0;
                                    endTime = 0;
                                    startTime =
                                            DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
                                    endTime = DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
                                if (time < endTime && time > startTime) {
                                    theoryId = 0;
                                    theoryId = allPhase[b].id;
                                     phaseId.add(theoryId);
                                }
                                }
                                }
                                //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);
    
                                for (int a = 0; a < theoryDatalist[e].length; a++) {
                                    for (int b = 0; b < phaseId.length; b++) {
                                        if (theoryDatalist[e][a].phaseId == phaseId[b]) {
                                            theorycable = 0;
                                            theorycable = theoryDatalist[e][a].humidity;
                                            theorycableForce.add(theorycable);
                                            //theorycableForce1.add(theorycableForce);
                                        }
                                    }
                                }
                                theorycableForce1.add(theorycableForce);
                                theorycableForcehu.add(theorycableForce);
                                print(1);
                                print(theorycableForce);
                                //print(theorycableForce1);
                                String error1 = '';
    
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    error = 0;
                                    error = (cableDataByTimelist[e][a].humidity - theorycableForce[a]) /
                                    theorycableForce[a];
                                    error1 = (error * 100).toStringAsFixed(2);
                                    error = double.parse(error1);
                                    errorlist.add(error);
                                    difference=cableDataByTimelist[e][a].humidity - theorycableForce[a];
                                    differencelist.add(difference);
                                }
                                print(2);
                                print(errorlist);
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    cableDataByTimelist[e][a].humidity.toString(),
                                    theorycableForce[a].toString(),
                                    errorlist[a].toString() + '%'
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                       datalist.add(content);
                                       datalisthu.add(content);
                                    });
                                }
                                //特征值分析
                                cable=[];
                                for (int a = 0; a < cableDataByTimelist[e].length; a++){
                                    cable.add(cableDataByTimelist[e][a].humidity);
                                }
                                cable.sort((a, b) => (a).compareTo(b));    //从小到大排列
                                differencelist.sort((a, b) => (a).compareTo(b));
                                errorlist.sort((a, b) => (a).compareTo(b));
                                print(cable);
                                print('11');
                                maxValue.add(cable[cable.length-1]);
                                minValue.add(cable[0]);
                                maxdiffValue.add(differencelist[differencelist.length-1]);
                                mindiffValue.add(differencelist[0]);
                                maxerrorValue.add(errorlist[errorlist.length-1]);
                                minerrorValue.add(errorlist[0]);
                                maxValuehu.add(cable[cable.length-1]);
                                minValuehu.add(cable[0]);
                                maxdiffValuehu.add(differencelist[differencelist.length-1]);
                                mindiffValuehu.add(differencelist[0]);
                                maxerrorValuehu.add(errorlist[errorlist.length-1]);
                                minerrorValuehu.add(errorlist[0]);
                                print(maxValue);
                                print(minValue);
                                //datalist1=[];
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    theorycableForce[a].toString(),
                                    //cableDataByTime[a].cableForce.toString(),
                                    cable[cable.length-1].toString(),
                                    cable[0].toString(),
                                    differencelist[differencelist.length-1].toString(),
                                    differencelist[0].toString(),
                                    errorlist[errorlist.length-1].toString() + '%',
                                    errorlist[0].toString() + '%',
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                        datalist1.add(content);
                                        datalisthuhu.add(content);
                                    });
                                }
                                }
                                });
                              //温度
                               setState(() {
                                pointStylename='温度';
                                dataColumn=dataColumnt;
                                datalist=[];
                                theorycableForce1=[];
                                maxValue=[];
                                minValue=[];
                                maxdiffValue=[];
                                mindiffValue=[];
                                maxerrorValue=[];
                                minerrorValue=[];
                                datalistte=[];
                                datalisttete=[];
                                maxValuete=[];
                                minValuete=[];
                                maxdiffValuete=[];
                                mindiffValuete=[];
                                maxerrorValuete=[];
                                minerrorValuete=[];
                                theorycableForcete=[];
                                for(int e=0;e<cedianNumberlist.length;e++){
                                phaseId=[];
                                theorycableForce = [];
                                errorlist=[];
                                differencelist=[];
                                datalist1=[];     //0721新增
                                for (int a = 0; a < cableDataByTimelist[e].length; a++) {
                                    time = 0;
                                    time =
                                          DateTime.parse(cableDataByTimelist[e][a].sampleTime).millisecondsSinceEpoch;
                                for (int b = 0; b < allPhase.length; b++) {
                                    startTime = 0;
                                    endTime = 0;
                                    startTime =
                                            DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
                                    endTime = DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
                                if (time < endTime && time > startTime) {
                                    theoryId = 0;
                                    theoryId = allPhase[b].id;
                                     phaseId.add(theoryId);
                                }
                                }
                                }
                                //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);
    
                                for (int a = 0; a < theoryDatalist[e].length; a++) {
                                    for (int b = 0; b < phaseId.length; b++) {
                                        if (theoryDatalist[e][a].phaseId == phaseId[b]) {
                                            theorycable = 0;
                                            theorycable = theoryDatalist[e][a].temperature;
                                            theorycableForce.add(theorycable);
                                            //theorycableForce1.add(theorycableForce);
                                        }
                                    }
                                }
                                theorycableForce1.add(theorycableForce);
                                theorycableForcete.add(theorycableForce);
                                print(1);
                                print(theorycableForce);
                                //print(theorycableForce1);
                                String error1 = '';
    
                               /* for (int a = 0; a < theorycableForce.length; a++) {
                                    error = 0;
                                    error = (cableDataByTimelist[e][a].longitudinalOffset - theorycableForce[a]) /
                                    theorycableForce[a];
                                    error1 = (error * 100).toStringAsFixed(2);
                                    error = double.parse(error1);
                                    errorlist.add(error);
                                    difference=cableDataByTimelist[e][a].longitudinalOffset - theorycableForce[a];
                                    differencelist.add(difference);
                                }*/
                                print(2);
                                print(errorlist);
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    cableDataByTimelist[e][a].temperature.toString(),
                                    //theorycableForce[a].toString(),
                                    //errorlist[a].toString() + '%'
                                    '-',
                                    '-',
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                       datalist.add(content);
                                       datalistte.add(content);
                                    });
                                }
                                //特征值分析
                                cable=[];
                                for (int a = 0; a < cableDataByTimelist[e].length; a++){
                                    cable.add(cableDataByTimelist[e][a].temperature);
                                }
                                cable.sort((a, b) => (a).compareTo(b));    //从小到大排列
                                differencelist.sort((a, b) => (a).compareTo(b));
                                errorlist.sort((a, b) => (a).compareTo(b));
                                print(cable);
                                print('11');
                                maxValue.add(cable[cable.length-1]);
                                minValue.add(cable[0]);
                                //maxdiffValue.add(differencelist[differencelist.length-1]);
                                //mindiffValue.add(differencelist[0]);
                                //maxerrorValue.add(errorlist[errorlist.length-1]);
                                //minerrorValue.add(errorlist[0]);
                                maxValuete.add(cable[cable.length-1]);
                                minValuete.add(cable[0]);
                                print(maxValue);
                                print(minValue);
                                //datalist1=[];
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    '-',
                                    //theorycableForce[a].toString(),
                                    //cableDataByTime[a].cableForce.toString(),
                                    cable[cable.length-1].toString(),
                                    cable[0].toString(),
                                    '-',
                                    '-',
                                    '-',
                                    '-',
                                    //differencelist[differencelist.length-1].toString(),
                                    //differencelist[0].toString(),
                                    //errorlist[errorlist.length-1].toString() + '%',
                                    //errorlist[0].toString() + '%',
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                        datalist1.add(content);
                                        datalisttete.add(content);
                                    });
                                }
                                }
                                });*/
                                //湿度

                                //0723增
                                //0723注销
                                /*if(pointStylename=='温度'){
                                dataLine4 = [];
                               /* for (int a = 0;
                                      a < envByTime.length;
                                      a++) {
                                    //dataLine.add(Linesales(int.parse(cableDataByTime[a].sampleTime), cableDataByTime[a].cableForce));
                                    /*dataLine.add(Linesales(
                                        DateTime.parse(
                                            envByTime[a].sampleTime),
                                        envByTime[a].temperature));*/
                                    dataLine4.add(SalesData(envByTime[a].sampleTime.toString().substring(0,13),envByTime[a].temperature));
                                  }
                                  //dataLine1 = dataLine;
                                    dataLine5 = dataLine4;
                                    dataLine4 = [];*/
                                //0723注销
                                dataLine = [];
                                dataLine4 = [];
                                contentCharts=[];
                                for(int b=0;b<selectNumber.length;b++){
                                    dataLine4 = [];
                                    dataLine5 = [];
                                    dataLine6 = [];
                                    for (int a = 0;
                                      a < cableDataByTimelist[b].length;
                                      a++) {
                                    dataLine4.add(SalesData(cableDataByTimelist[b][a].sampleTime.toString().substring(0,13),cableDataByTimelist[b][a].temperature)); 
                                  }
                                  dataLine5 = dataLine4;
                                  //dataLine7.add(dataLine4);
                                  contentChart=LineSeries<SalesData, String>(
                                  name: '实际'+selectNumber[b],
                                  dataSource:dataLine5,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  markerSettings: MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);
                                //0723注销
                                  /*dataLine = [];
                                  dataLine4 = [];
                                  for (int a = 0; 
                                      a < theorycableForce1[b].length;
                                      a++) {
                                    dataLine4.add(SalesData(cableDataByTimelist[b][a].sampleTime.toString().substring(0,13),theorycableForce1[b][a]));
                                  }
                                  dataLine6 = dataLine4;
                                  dataLine8.add(dataLine4);
                                  contentChart=LineSeries<SalesData, String>(
                                  name: '理论'+selectNumber[b],
                                  dataSource:dataLine6,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  markerSettings: MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);*/
                                }

                              }else if(pointStylename=='湿度'){
                                /*dataLine4 = [];
                                   for (int a = 0;
                                      a < envByTime.length;
                                      a++) {
                                    //dataLine.add(Linesales(int.parse(cableDataByTime[a].sampleTime), cableDataByTime[a].cableForce));
                                    /*dataLine.add(Linesales(
                                        DateTime.parse(
                                            envByTime[a].sampleTime),
                                        envByTime[a].humidity));*/
                                    dataLine4.add(SalesData(envByTime[a].sampleTime.toString().substring(0,13),envByTime[a].humidity));
                                  }
                                  /*dataLine1 = dataLine;
                                  dataLine = [];*/
                                  dataLine5 = dataLine4;
                                    dataLine4 = [];
                                  for (int a = 0;
                                      a < theorycableForce.length;
                                      a++) {
                                    //dataLine.add(Linesales(int.parse(cableDataByTime[a].sampleTime), cableDataByTime[a].cableForce));
                                    /*dataLine.add(Linesales(
                                        DateTime.parse(
                                            envByTime[a].sampleTime),
                                        theorycableForce[a]));*/
                                    dataLine4.add(SalesData(envByTime[a].sampleTime.toString().substring(0,13),theorycableForce[a]));
                                  }
                                  //dataLine2 = dataLine;
                                  dataLine6 = dataLine4;*/
                                //0723注销
                                dataLine = [];
                                dataLine4 = [];
                                contentCharts=[];
                                for(int b=0;b<selectNumber.length;b++){
                                    dataLine4 = [];
                                    dataLine5 = [];
                                    dataLine6 = [];
                                    for (int a = 0;
                                      a < cableDataByTimelist[b].length;
                                      a++) {
                                    dataLine4.add(SalesData(cableDataByTimelist[b][a].sampleTime.toString().substring(0,13),cableDataByTimelist[b][a].humidity)); 
                                  }
                                  dataLine5 = dataLine4;
                                  //dataLine7.add(dataLine4);
                                  contentChart=LineSeries<SalesData, String>(
                                  name: '实际'+selectNumber[b],
                                  dataSource:dataLine5,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  markerSettings: MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);
                                  dataLine = [];
                                  dataLine4 = [];
                                  for (int a = 0; 
                                      a < theorycableForce1[b].length;
                                      a++) {
                                    dataLine4.add(SalesData(cableDataByTimelist[b][a].sampleTime.toString().substring(0,13),theorycableForce1[b][a]));
                                  }
                                  dataLine6 = dataLine4;
                                  dataLine8.add(dataLine4);
                                  contentChart=LineSeries<SalesData, String>(
                                  name: '理论'+selectNumber[b],
                                  dataSource:dataLine6,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  markerSettings: MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);
                                }
                                 //0723注销

                              }*/
                                //0723注销
                              }
                            });
                          });
                        },
                      ),
                      FlatButton(
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              if (offstate4 == true) {
                                offstate4 = false;
                              }
                              offstate3 = true;
                            });
                          },
                          child: Text('统计分析')),
                    ],
                  ),
                  Offstage(
                    offstage: offstate2,
                    child: Row(children: [
                      FlatButton(
                        color: Colors.white,
                        child: Text('温度'),
                        onPressed: () {
                          /*setState(() {
                                  pointStylename='温度';
                                  dataColumn=dataColumnt;
                                  dataRowlist=[];
                                  phaseId=[];
                                  datalist=[];
                                  errorlist=[];
                                  differencelist=[]; 
                                  datalist1=[];
                                  for (int a = 0; a < envByTime.length; a++) {
                                  time = 0;
                                  time =
                                  DateTime.parse(envByTime[a].sampleTime).millisecondsSinceEpoch;
                                  for (int b = 0; b < allPhase.length; b++) {
                                  startTime = 0;
                                  endTime = 0;
                                  startTime =
                                  DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
                                  endTime = DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
                                  if (time < endTime && time > startTime) {
                                    theoryId = 0;
                                    theoryId = allPhase[b].id;
                                    phaseId.add(theoryId);
                                  }
                                  }
                                  }
                                 //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);
                                theorycableForce = [];
                                for (int a = 0; a < theoryData.length; a++) {
                                    for (int b = 0; b < phaseId.length; b++) {
                                       if (theoryData[a].phaseId == phaseId[b]) {
                                          theorycable = 0;
                                          theorycable = theoryData[a].temperature;
                                          theorycableForce.add(theorycable);
                                        }
                                      }
                                }
                                print(theorycableForce);
                                String error1 = '';
                                /*for (int a = 0; a < theorycableForce.length; a++) {
                                /*error = 0;
                                error = (envByTime[a].temperature - theorycableForce[a])/theorycableForce[a];
                                error1 = (error * 100).toStringAsFixed(2);
                                error = double.parse(error1);
                                errorlist.add(error);*/

                                }*/
                                print(errorlist);
                                for (int a = 0; a < theorycableForce.length; a++) {
                                content = DataRow(
                                cells: [
                                _value1,
                                envByTime[a].temperature.toString(),
                                //theorycableForce[a].toString()??'-',
                                //errorlist[a].toString() + '%'??'-'
                                '-',
                                '-',
                                ].map((e) => DataCell(Text(e))).toList());
                                setState(() {
                                datalist.add(content);
                                });
                                }
                                print(datalist);
                                cable=[];
                                for (int a = 0; a < envByTime.length; a++){
                                    cable.add(envByTime[a].temperature);
                                }
                                cable.sort((a, b) => (a).compareTo(b));    //从小到大排列
                                //differencelist.sort((a, b) => (a).compareTo(b));
                                //errorlist.sort((a, b) => (a).compareTo(b));
                                print(cable);
                                datalist1=[];
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    _value1,
                                    '-',
                                    //theorycableForce[a].toString(),
                                    //cableDataByTime[a].cableForce.toString(),
                                    cable[cable.length-1].toString(),
                                    cable[0].toString(),
                                    '-',
                                    '-',
                                    '-',
                                    '-',
                                    /*differencelist[differencelist.length-1].toString(),
                                    differencelist[0].toString(),
                                    errorlist[errorlist.length-1].toString() + '%',
                                    errorlist[0].toString() + '%',*/
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                      datalist1.add(content);
                                    });
                                }
                                });*/
                          //0723注销
                          /*setState(() {
                                pointStylename='温度';
                                dataColumn=dataColumnt;
                                datalist=[];
                                theorycableForce1=[];
                                maxValue=[];
                                minValue=[];
                                maxdiffValue=[];
                                mindiffValue=[];
                                maxerrorValue=[];
                                minerrorValue=[];
                                for(int e=0;e<cedianNumberlist.length;e++){
                                phaseId=[];
                                theorycableForce = [];
                                errorlist=[];
                                differencelist=[];
                                datalist1=[];     //0721新增
                                for (int a = 0; a < cableDataByTimelist[e].length; a++) {
                                    time = 0;
                                    time =
                                          DateTime.parse(cableDataByTimelist[e][a].sampleTime).millisecondsSinceEpoch;
                                for (int b = 0; b < allPhase.length; b++) {
                                    startTime = 0;
                                    endTime = 0;
                                    startTime =
                                            DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
                                    endTime = DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
                                if (time < endTime && time > startTime) {
                                    theoryId = 0;
                                    theoryId = allPhase[b].id;
                                     phaseId.add(theoryId);
                                }
                                }
                                }
                                //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);
    
                                for (int a = 0; a < theoryDatalist[e].length; a++) {
                                    for (int b = 0; b < phaseId.length; b++) {
                                        if (theoryDatalist[e][a].phaseId == phaseId[b]) {
                                            theorycable = 0;
                                            theorycable = theoryDatalist[e][a].temperature;
                                            theorycableForce.add(theorycable);
                                            //theorycableForce1.add(theorycableForce);
                                        }
                                    }
                                }
                                theorycableForce1.add(theorycableForce);
                                print(1);
                                print(theorycableForce);
                                //print(theorycableForce1);
                                String error1 = '';
    
                               /* for (int a = 0; a < theorycableForce.length; a++) {
                                    error = 0;
                                    error = (cableDataByTimelist[e][a].longitudinalOffset - theorycableForce[a]) /
                                    theorycableForce[a];
                                    error1 = (error * 100).toStringAsFixed(2);
                                    error = double.parse(error1);
                                    errorlist.add(error);
                                    difference=cableDataByTimelist[e][a].longitudinalOffset - theorycableForce[a];
                                    differencelist.add(difference);
                                }*/
                                print(2);
                                print(errorlist);
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    cableDataByTimelist[e][a].temperature.toString(),
                                    //theorycableForce[a].toString(),
                                    //errorlist[a].toString() + '%'
                                    '-',
                                    '-',
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                       datalist.add(content);
                                    });
                                }
                                //特征值分析
                                cable=[];
                                for (int a = 0; a < cableDataByTimelist[e].length; a++){
                                    cable.add(cableDataByTimelist[e][a].temperature);
                                }
                                cable.sort((a, b) => (a).compareTo(b));    //从小到大排列
                                differencelist.sort((a, b) => (a).compareTo(b));
                                errorlist.sort((a, b) => (a).compareTo(b));
                                print(cable);
                                print('11');
                                maxValue.add(cable[cable.length-1]);
                                minValue.add(cable[0]);
                                //maxdiffValue.add(differencelist[differencelist.length-1]);
                                //mindiffValue.add(differencelist[0]);
                                //maxerrorValue.add(errorlist[errorlist.length-1]);
                                //minerrorValue.add(errorlist[0]);
                                print(maxValue);
                                print(minValue);
                                //datalist1=[];
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    '-',
                                    //theorycableForce[a].toString(),
                                    //cableDataByTime[a].cableForce.toString(),
                                    cable[cable.length-1].toString(),
                                    cable[0].toString(),
                                    '-',
                                    '-',
                                    '-',
                                    '-',
                                    //differencelist[differencelist.length-1].toString(),
                                    //differencelist[0].toString(),
                                    //errorlist[errorlist.length-1].toString() + '%',
                                    //errorlist[0].toString() + '%',
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                        datalist1.add(content);
                                    });
                                }
                                }
                                });*/
                          //0723注销
                          //0723新增
                          setState(() {
                            dataLine = [];
                            dataLine4 = [];
                            contentCharts = [];
                            //
                            dropdownText = '请选择';
                            dataColumn = dataColumnt;
                            datalist = datalistte;
                            datalist1 = datalisttete;
                            theorycableForce1 = theorycableForcete;
                            dataLine8 = [];
                            maxValue = maxValuete;
                            minValue = minValuete;
                            maxdiffValue = maxdiffValuete;
                            mindiffValue = mindiffValuete;
                            maxerrorValue = maxerrorValuete;
                            minerrorValue = minerrorValuete;
                            for (int b = 0; b < selectNumber.length; b++) {
                              dataLine4 = [];
                              dataLine5 = [];
                              dataLine6 = [];
                              for (int a = 0;
                                  a < cableDataByTimelist[b].length;
                                  a++) {
                                dataLine4.add(SalesData(
                                    cableDataByTimelist[b][a]
                                        .sampleTime
                                        .toString()
                                        .substring(0, 13),
                                    cableDataByTimelist[b][a].temperature));
                              }
                              dataLine5 = dataLine4;
                              //dataLine7.add(dataLine4);
                              contentChart = LineSeries<SalesData, String>(
                                name: '实际' + selectNumber[b],
                                dataSource: dataLine5,
                                xValueMapper: (SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (SalesData sales, _) =>
                                    sales.sales,
                                markerSettings: MarkerSettings(isVisible: true),
                              );
                              contentCharts.add(contentChart);
                            }
                          });
                          //0723新增
                        },
                      ),
                      FlatButton(
                        color: Colors.white,
                        child: Text('湿度'),
                        onPressed: () {
                          /*setState(() {
                                  pointStylename='湿度';
                                  dataColumn=dataColumnhu;
                                  dataRowlist=[];
                                  phaseId=[];
                                  datalist=[];
                                  errorlist=[];
                                  differencelist=[]; 
                                  datalist1=[];
                                  for (int a = 0; a < envByTime.length; a++) {
                                  time = 0;
                                  time =
                                  DateTime.parse(envByTime[a].sampleTime).millisecondsSinceEpoch;
                                  for (int b = 0; b < allPhase.length; b++) {
                                  startTime = 0;
                                  endTime = 0;
                                  startTime =
                                  DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
                                  endTime = DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
                                  if (time < endTime && time > startTime) {
                                    theoryId = 0;
                                    theoryId = allPhase[b].id;
                                    phaseId.add(theoryId);
                                  }
                                  }
                                  }
                                 //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);
                                theorycableForce = [];
                                for (int a = 0; a < theoryData.length; a++) {
                                    for (int b = 0; b < phaseId.length; b++) {
                                       if (theoryData[a].phaseId == phaseId[b]) {
                                          theorycable = 0;
                                          theorycable = theoryData[a].humidity;
                                          theorycableForce.add(theorycable);
                                        }
                                      }
                                }
                                print(theorycableForce);
                                String error1 = '';
                                for (int a = 0; a < theorycableForce.length; a++) {
                                error = 0;
                                error = (envByTime[a].humidity - theorycableForce[a])/theorycableForce[a];
                                error1 = (error * 100).toStringAsFixed(2);
                                error = double.parse(error1);
                                errorlist.add(error);
                                difference=envByTime[a].humidity - theorycableForce[a];
                                differencelist.add(difference);
                                }
                                print(errorlist);
                                for (int a = 0; a < theorycableForce.length; a++) {
                                content = DataRow(
                                cells: [
                                _value1,
                                envByTime[a].humidity.toString(),
                                theorycableForce[a].toString(),
                                errorlist[a].toString() + '%'
                                ].map((e) => DataCell(Text(e))).toList());
                                setState(() {
                                datalist.add(content);
                                });
                                }
                                print(datalist);
                                cable=[];
                                for (int a = 0; a < envByTime.length; a++){
                                    cable.add(envByTime[a].humidity);
                                }
                                cable.sort((a, b) => (a).compareTo(b));    //从小到大排列
                                differencelist.sort((a, b) => (a).compareTo(b));
                                errorlist.sort((a, b) => (a).compareTo(b));
                                print(cable);
                                datalist1=[];
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    _value1,
                                    theorycableForce[a].toString(),
                                    //cableDataByTime[a].cableForce.toString(),
                                    cable[cable.length-1].toString(),
                                    cable[0].toString(),
                                    differencelist[differencelist.length-1].toString(),
                                    differencelist[0].toString(),
                                    errorlist[errorlist.length-1].toString() + '%',
                                    errorlist[0].toString() + '%',
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                      datalist1.add(content);
                                    });
                                }
                                });*/
                          //0723注销
                          /*setState(() {
                                pointStylename='湿度';
                                dataColumn=dataColumnhu;
                                datalist=[];
                                theorycableForce1=[];
                                maxValue=[];
                                minValue=[];
                                maxdiffValue=[];
                                mindiffValue=[];
                                maxerrorValue=[];
                                minerrorValue=[];
                                for(int e=0;e<cedianNumberlist.length;e++){
                                phaseId=[];
                                theorycableForce = [];
                                errorlist=[];
                                differencelist=[];
                                datalist1=[];     //0721新增
                                for (int a = 0; a < cableDataByTimelist[e].length; a++) {
                                    time = 0;
                                    time =
                                          DateTime.parse(cableDataByTimelist[e][a].sampleTime).millisecondsSinceEpoch;
                                for (int b = 0; b < allPhase.length; b++) {
                                    startTime = 0;
                                    endTime = 0;
                                    startTime =
                                            DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
                                    endTime = DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
                                if (time < endTime && time > startTime) {
                                    theoryId = 0;
                                    theoryId = allPhase[b].id;
                                     phaseId.add(theoryId);
                                }
                                }
                                }
                                //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);
    
                                for (int a = 0; a < theoryDatalist[e].length; a++) {
                                    for (int b = 0; b < phaseId.length; b++) {
                                        if (theoryDatalist[e][a].phaseId == phaseId[b]) {
                                            theorycable = 0;
                                            theorycable = theoryDatalist[e][a].humidity;
                                            theorycableForce.add(theorycable);
                                            //theorycableForce1.add(theorycableForce);
                                        }
                                    }
                                }
                                theorycableForce1.add(theorycableForce);
                                print(1);
                                print(theorycableForce);
                                //print(theorycableForce1);
                                String error1 = '';
    
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    error = 0;
                                    error = (cableDataByTimelist[e][a].humidity - theorycableForce[a]) /
                                    theorycableForce[a];
                                    error1 = (error * 100).toStringAsFixed(2);
                                    error = double.parse(error1);
                                    errorlist.add(error);
                                    difference=cableDataByTimelist[e][a].humidity - theorycableForce[a];
                                    differencelist.add(difference);
                                }
                                print(2);
                                print(errorlist);
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    cableDataByTimelist[e][a].humidity.toString(),
                                    theorycableForce[a].toString(),
                                    errorlist[a].toString() + '%'
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                       datalist.add(content);
                                    });
                                }
                                //特征值分析
                                cable=[];
                                for (int a = 0; a < cableDataByTimelist[e].length; a++){
                                    cable.add(cableDataByTimelist[e][a].humidity);
                                }
                                cable.sort((a, b) => (a).compareTo(b));    //从小到大排列
                                differencelist.sort((a, b) => (a).compareTo(b));
                                errorlist.sort((a, b) => (a).compareTo(b));
                                print(cable);
                                print('11');
                                maxValue.add(cable[cable.length-1]);
                                minValue.add(cable[0]);
                                maxdiffValue.add(differencelist[differencelist.length-1]);
                                mindiffValue.add(differencelist[0]);
                                maxerrorValue.add(errorlist[errorlist.length-1]);
                                minerrorValue.add(errorlist[0]);
                                print(maxValue);
                                print(minValue);
                                //datalist1=[];
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    theorycableForce[a].toString(),
                                    //cableDataByTime[a].cableForce.toString(),
                                    cable[cable.length-1].toString(),
                                    cable[0].toString(),
                                    differencelist[differencelist.length-1].toString(),
                                    differencelist[0].toString(),
                                    errorlist[errorlist.length-1].toString() + '%',
                                    errorlist[0].toString() + '%',
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                        datalist1.add(content);
                                    });
                                }
                                }
                                });*/
                          //0723注销
                          //0723新增
                          setState(() {
                            dataLine = [];
                            dataLine4 = [];
                            contentCharts = [];
                            //
                            dropdownText = '请选择';
                            dataColumn = dataColumnhu;
                            datalist = datalisthu;
                            datalist1 = datalisthuhu;
                            theorycableForce1 = theorycableForcehu;
                            dataLine8 = [];
                            maxValue = maxValuehu;
                            minValue = minValuehu;
                            maxdiffValue = maxdiffValuehu;
                            mindiffValue = mindiffValuehu;
                            maxerrorValue = maxerrorValuehu;
                            minerrorValue = minerrorValuehu;
                            for (int b = 0; b < selectNumber.length; b++) {
                              dataLine4 = [];
                              dataLine5 = [];
                              dataLine6 = [];
                              for (int a = 0;
                                  a < cableDataByTimelist[b].length;
                                  a++) {
                                dataLine4.add(SalesData(
                                    cableDataByTimelist[b][a]
                                        .sampleTime
                                        .toString()
                                        .substring(0, 13),
                                    cableDataByTimelist[b][a].humidity));
                              }
                              dataLine5 = dataLine4;
                              //dataLine7.add(dataLine4);
                              contentChart = LineSeries<SalesData, String>(
                                name: '实际' + selectNumber[b],
                                dataSource: dataLine5,
                                xValueMapper: (SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (SalesData sales, _) =>
                                    sales.sales,
                                markerSettings: MarkerSettings(isVisible: true),
                              );
                              contentCharts.add(contentChart);
                              dataLine = [];
                              dataLine4 = [];
                              for (int a = 0;
                                  a < theorycableForce1[b].length;
                                  a++) {
                                dataLine4.add(SalesData(
                                    cableDataByTimelist[b][a]
                                        .sampleTime
                                        .toString()
                                        .substring(0, 13),
                                    theorycableForce1[b][a]));
                              }
                              dataLine6 = dataLine4;
                              dataLine8.add(dataLine4);
                              contentChart = LineSeries<SalesData, String>(
                                name: '理论' + selectNumber[b],
                                dataSource: dataLine6,
                                xValueMapper: (SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (SalesData sales, _) =>
                                    sales.sales,
                                markerSettings: MarkerSettings(isVisible: true),
                              );
                              contentCharts.add(contentChart);
                            }
                          });
                          //0723新增
                        },
                      ),
                    ]),
                  ),
                  Offstage(
                    offstage: offstate1,
                    child: Row(children: [
                      Container(
                        width: 80,
                        child: FlatButton(
                          color: Colors.white,
                          child: Text('位移竖'),
                          onPressed: () {
                            /*setState(() {
                                  pointStylename='位移竖';
                                  dataColumn=dataColumnv;
                                  dataRowlist=[];
                                  phaseId=[];
                                  datalist=[];
                                  errorlist=[];
                                  differencelist=[]; 
                                  datalist1=[];
                                  
                                  for (int a = 0;
                                    a < offsetDataByTime.length;
                                    a++) {
                                  time = 0;
                                  time = DateTime.parse(
                                          offsetDataByTime[a].sampleTime)
                                      .millisecondsSinceEpoch;
                                  for (int b = 0; b < allPhase.length; b++) {
                                    startTime = 0;
                                    endTime = 0;
                                    startTime =
                                        DateTime.parse(allPhase[b].startTime)
                                            .millisecondsSinceEpoch;
                                    endTime =
                                        DateTime.parse(allPhase[b].endTime)
                                            .millisecondsSinceEpoch;
                                    
                                    if (time < endTime && time > startTime) {
                                      theoryId = 0;
                                      theoryId = allPhase[b].id;
                                      phaseId.add(theoryId);
                                    }
                                  }
                                }
                                //theoryData=await webApi.getTheoryData(cedianNumber,sensorType);
                                theorycableForce = [];
                                for (int a = 0; a < theoryData.length; a++) {
                                  for (int b = 0; b < phaseId.length; b++) {
                                    if (theoryData[a].phaseId == phaseId[b]) {
                                      theorycable = 0;
                                      theorycable = theoryData[a].vOffset;
                                      theorycableForce.add(theorycable);
                                    }
                                  }
                                }
                                print(theorycableForce);
                                String error1 = '';
                                errorlist=[];
                                for (int a = 0;
                                    a < theorycableForce.length;
                                    a++) {
                                  error = 0;
                                  error = (offsetDataByTime[a].verticalOffset -
                                      theorycableForce[a])/theorycableForce[a];
                                  error1 = (error * 100).toStringAsFixed(2);
                                  error = double.parse(error1);
                                  errorlist.add(error);
                                  difference=offsetDataByTime[a].verticalOffset - theorycableForce[a];
                                  differencelist.add(difference);
                                }
                                print(errorlist);
                                
                                for (int a = 0;
                                    a < theorycableForce.length;
                                    a++) {
                                      dataRowlist=[ _value1,offsetDataByTime[a].verticalOffset.toString(),theorycableForce[a].toString(),errorlist[a].toString() + '%'];     
                                  content = DataRow(
                                      cells: dataRowlist.map((e) => DataCell(Text(e))).toList());
                                  setState(() {
                                    datalist.add(content);
                                  });
                                }
                                //print(datalist);
                                });
                                //特征值分析
                                cable=[];
                                for (int a = 0; a < offsetDataByTime.length; a++){
                                    cable.add(offsetDataByTime[a].verticalOffset);
                                }
                                cable.sort((a, b) => (a).compareTo(b));    //从小到大排列
                                differencelist.sort((a, b) => (a).compareTo(b));
                                errorlist.sort((a, b) => (a).compareTo(b));
                                print(cable);
                                datalist1=[];
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    _value1,
                                    theorycableForce[a].toString(),
                                    //cableDataByTime[a].cableForce.toString(),
                                    cable[cable.length-1].toString(),
                                    cable[0].toString(),
                                    differencelist[differencelist.length-1].toString(),
                                    differencelist[0].toString(),
                                    errorlist[errorlist.length-1].toString() + '%',
                                    errorlist[0].toString() + '%',
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                      datalist1.add(content);
                                    });
                                }*/
                            //0722增
                            setState(() {
                              dropdownText = '请选择';
                              dataColumn = dataColumnv;
                              datalist = datalists;
                              datalist1 = datalistss;
                              theorycableForce1 = theorycableForces;
                              dataLine = [];
                              dataLine4 = [];
                              contentCharts = [];
                              dataLine8 = [];
                              maxValue = maxValues;
                              minValue = minValues;
                              maxdiffValue = maxdiffValues;
                              mindiffValue = mindiffValues;
                              maxerrorValue = maxerrorValues;
                              minerrorValue = minerrorValues;
                              for (int b = 0; b < selectNumber.length; b++) {
                                dataLine4 = [];
                                dataLine5 = [];
                                dataLine6 = [];
                                for (int a = 0;
                                    a < cableDataByTimelist[b].length;
                                    a++) {
                                  dataLine4.add(SalesData(
                                      cableDataByTimelist[b][a]
                                          .sampleTime
                                          .toString()
                                          .substring(0, 13),
                                      cableDataByTimelist[b][a]
                                          .verticalOffset));
                                }
                                dataLine5 = dataLine4;
                                //dataLine7.add(dataLine4);
                                contentChart = LineSeries<SalesData, String>(
                                  name: '实际' + selectNumber[b],
                                  dataSource: dataLine5,
                                  xValueMapper: (SalesData sales, _) =>
                                      sales.year,
                                  yValueMapper: (SalesData sales, _) =>
                                      sales.sales,
                                  markerSettings:
                                      MarkerSettings(isVisible: true),
                                );
                                contentCharts.add(contentChart);
                                dataLine = [];
                                dataLine4 = [];
                                dataLine8 = [];
                                for (int a = 0;
                                    a < theorycableForce1[b].length;
                                    a++) {
                                  dataLine4.add(SalesData(
                                      cableDataByTimelist[b][a]
                                          .sampleTime
                                          .toString()
                                          .substring(0, 13),
                                      theorycableForce1[b][a]));
                                }
                                dataLine6 = dataLine4;
                                dataLine8.add(dataLine4);
                                contentChart = LineSeries<SalesData, String>(
                                  name: '理论' + selectNumber[b],
                                  dataSource: dataLine6,
                                  xValueMapper: (SalesData sales, _) =>
                                      sales.year,
                                  yValueMapper: (SalesData sales, _) =>
                                      sales.sales,
                                  markerSettings:
                                      MarkerSettings(isVisible: true),
                                );
                                contentCharts.add(contentChart);
                              }
                            });
                            //0722增
                            //0722注销
                            /*setState(() {
                                pointStylename='位移竖';
                                dataColumn=dataColumnv;
                                datalist=[];
                                theorycableForce1=[];
                                maxValue=[];
                                minValue=[];
                                maxdiffValue=[];
                                mindiffValue=[];
                                maxerrorValue=[];
                                minerrorValue=[];
                                datalist1=[];     //0721新增
                                  
                                for(int e=0;e<cedianNumberlist.length;e++){
                                phaseId=[];
                                theorycableForce = [];
                                errorlist=[];
                                differencelist=[];
    
                                for (int a = 0; a < cableDataByTimelist[e].length; a++) {
                                    time = 0;
                                    time =
                                          DateTime.parse(cableDataByTimelist[e][a].sampleTime).millisecondsSinceEpoch;
                                for (int b = 0; b < allPhase.length; b++) {
                                    startTime = 0;
                                    endTime = 0;
                                    startTime =
                                            DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
                                    endTime = DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
                                if (time < endTime && time > startTime) {
                                    theoryId = 0;
                                    theoryId = allPhase[b].id;
                                     phaseId.add(theoryId);
                                }
                                }
                                }
                                //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);
    
                                for (int a = 0; a < theoryDatalist[e].length; a++) {
                                    for (int b = 0; b < phaseId.length; b++) {
                                        if (theoryDatalist[e][a].phaseId == phaseId[b]) {
                                            theorycable = 0;
                                            theorycable = theoryDatalist[e][a].vOffset;
                                            theorycableForce.add(theorycable);
                                            //theorycableForce1.add(theorycableForce);
                                        }
                                    }
                                }
                                theorycableForce1.add(theorycableForce);
                                print(1);
                                print(theorycableForce);
                                //print(theorycableForce1);
                                String error1 = '';
    
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    error = 0;
                                    error = (cableDataByTimelist[e][a].verticalOffset - theorycableForce[a]) /
                                    theorycableForce[a];
                                    error1 = (error * 100).toStringAsFixed(2);
                                    error = double.parse(error1);
                                    errorlist.add(error);
                                    difference=cableDataByTimelist[e][a].verticalOffset - theorycableForce[a];
                                    differencelist.add(difference);
                                }
                                print(2);
                                print(errorlist);
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    cableDataByTimelist[e][a].verticalOffset.toString(),
                                    theorycableForce[a].toString(),
                                    errorlist[a].toString() + '%'
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                       datalist.add(content);
                                    });
                                }
                                //特征值分析
                                cable=[];
                                //theorycableForce=[];
                                for (int a = 0; a < cableDataByTimelist[e].length; a++){
                                    cable.add(cableDataByTimelist[e][a].verticalOffset);
                                }
                                cable.sort((a, b) => (a).compareTo(b));    //从小到大排列
                                differencelist.sort((a, b) => (a).compareTo(b));
                                errorlist.sort((a, b) => (a).compareTo(b));
                                print(cable);
                                print('11');
                                maxValue.add(cable[cable.length-1]);
                                minValue.add(cable[0]);
                                maxdiffValue.add(differencelist[differencelist.length-1]);
                                mindiffValue.add(differencelist[0]);
                                maxerrorValue.add(errorlist[errorlist.length-1]);
                                minerrorValue.add(errorlist[0]);
                                print(maxValue);
                                print(minValue);
                                //datalist1=[];
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    theorycableForce[a].toString(),
                                    //cableDataByTime[a].cableForce.toString(),
                                    cable[cable.length-1].toString(),
                                    cable[0].toString(),
                                    differencelist[differencelist.length-1].toString(),
                                    differencelist[0].toString(),
                                    errorlist[errorlist.length-1].toString() + '%',
                                    errorlist[0].toString() + '%',
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                        datalist1.add(content);
                                    });
                                }
                                }
                                });*/
                            //0722注销
                          },
                        ),
                      ),
                      Container(
                        width: 80,
                        child: FlatButton(
                          color: Colors.white,
                          child: Text('位移横'),
                          onPressed: () {
                            //setState(() {

                            /*dataRowlist=[];
                                  phaseId=[];
                                  datalist=[];
                                  datalist1=[];
                                  for (int a = 0;
                                    a < offsetDataByTime.length;
                                    a++) {
                                  time = 0;
                                  time = DateTime.parse(
                                          offsetDataByTime[a].sampleTime)
                                      .millisecondsSinceEpoch;
                                  for (int b = 0; b < allPhase.length; b++) {
                                    startTime = 0;
                                    endTime = 0;
                                    startTime =
                                        DateTime.parse(allPhase[b].startTime)
                                            .millisecondsSinceEpoch;
                                    endTime =
                                        DateTime.parse(allPhase[b].endTime)
                                            .millisecondsSinceEpoch;
                                    
                                    if (time < endTime && time > startTime) {
                                      theoryId = 0;
                                      theoryId = allPhase[b].id;
                                      phaseId.add(theoryId);
                                    }
                                  }
                                }
                                //theoryData=await webApi.getTheoryData(cedianNumber,sensorType);
                                theorycableForce = [];
                                for (int a = 0; a < theoryData.length; a++) {
                                  for (int b = 0; b < phaseId.length; b++) {
                                    if (theoryData[a].phaseId == phaseId[b]) {
                                      theorycable = 0;
                                      theorycable = theoryData[a].hOffset;
                                      theorycableForce.add(theorycable);
                                    }
                                  }
                                }
                                print(theorycableForce);
                                String error1 = '';
                                errorlist=[];
                                for (int a = 0;
                                    a < theorycableForce.length;
                                    a++) {
                                  error = 0;
                                  error = (offsetDataByTime[a].horizontalOffset -
                                      theorycableForce[a])/theorycableForce[a];
                                  error1 = (error * 100).toStringAsFixed(2);
                                  error = double.parse(error1);
                                  errorlist.add(error);
                                  difference=offsetDataByTime[a].horizontalOffset - theorycableForce[a];
                                  differencelist.add(difference);
                                }
                                print(errorlist);
                                
                                for (int a = 0;
                                    a < theorycableForce.length;
                                    a++) {
                                    dataRowlist=[ _value1,offsetDataByTime[a].horizontalOffset.toString(),theorycableForce[a].toString(),errorlist[a].toString() + '%']; 
                                  content = DataRow(
                                      cells:dataRowlist .map((e) => DataCell(Text(e))).toList());
                                  setState(() {
                                    datalist.add(content);
                                  });
                                }
                                print(datalist);
                                //特征值分析
                                cable=[];
                                for (int a = 0; a < offsetDataByTime.length; a++){
                                    cable.add(offsetDataByTime[a].horizontalOffset);
                                }
                                cable.sort((a, b) => (a).compareTo(b));    //从小到大排列
                                differencelist.sort((a, b) => (a).compareTo(b));
                                errorlist.sort((a, b) => (a).compareTo(b));
                                print(cable);
                                
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    _value1,
                                    theorycableForce[a].toString(),
                                    //cableDataByTime[a].cableForce.toString(),
                                    cable[cable.length-1].toString(),
                                    cable[0].toString(),
                                    differencelist[differencelist.length-1].toString(),
                                    differencelist[0].toString(),
                                    errorlist[errorlist.length-1].toString() + '%',
                                    errorlist[0].toString() + '%',
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                      datalist1.add(content);
                                    });
                                }*/
                            //0722注销
                            /* setState(() {
                                pointStylename='位移横';
                                dataColumn=dataColumnh;
                                datalist=[];
                                theorycableForce1=[];
                                maxValue=[];
                                minValue=[];
                                maxdiffValue=[];
                                mindiffValue=[];
                                maxerrorValue=[];
                                minerrorValue=[];
                                for(int e=0;e<cedianNumberlist.length;e++){
                                phaseId=[];
                                theorycableForce = [];
                                errorlist=[];
                                differencelist=[];
                                datalist1=[];     //0721新增
                                for (int a = 0; a < cableDataByTimelist[e].length; a++) {
                                    time = 0;
                                    time =
                                          DateTime.parse(cableDataByTimelist[e][a].sampleTime).millisecondsSinceEpoch;
                                for (int b = 0; b < allPhase.length; b++) {
                                    startTime = 0;
                                    endTime = 0;
                                    startTime =
                                            DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
                                    endTime = DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
                                if (time < endTime && time > startTime) {
                                    theoryId = 0;
                                    theoryId = allPhase[b].id;
                                     phaseId.add(theoryId);
                                }
                                }
                                }
                                //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);
    
                                for (int a = 0; a < theoryDatalist[e].length; a++) {
                                    for (int b = 0; b < phaseId.length; b++) {
                                        if (theoryDatalist[e][a].phaseId == phaseId[b]) {
                                            theorycable = 0;
                                            theorycable = theoryDatalist[e][a].hOffset;
                                            theorycableForce.add(theorycable);
                                            //theorycableForce1.add(theorycableForce);
                                        }
                                    }
                                }
                                theorycableForce1.add(theorycableForce);
                                print(1);
                                print(theorycableForce);
                                //print(theorycableForce1);
                                String error1 = '';
    
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    error = 0;
                                    error = (cableDataByTimelist[e][a].horizontalOffset - theorycableForce[a]) /
                                    theorycableForce[a];
                                    error1 = (error * 100).toStringAsFixed(2);
                                    error = double.parse(error1);
                                    errorlist.add(error);
                                    difference=cableDataByTimelist[e][a].horizontalOffset - theorycableForce[a];
                                    differencelist.add(difference);
                                }
                                print(2);
                                print(errorlist);
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    cableDataByTimelist[e][a].horizontalOffset.toString(),
                                    theorycableForce[a].toString(),
                                    errorlist[a].toString() + '%'
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                       datalist.add(content);
                                    });
                                }
                                //特征值分析
                                cable=[];
                                for (int a = 0; a < cableDataByTimelist[e].length; a++){
                                    cable.add(cableDataByTimelist[e][a].horizontalOffset);
                                }
                                cable.sort((a, b) => (a).compareTo(b));    //从小到大排列
                                differencelist.sort((a, b) => (a).compareTo(b));
                                errorlist.sort((a, b) => (a).compareTo(b));
                                print(cable);
                                print('11');
                                maxValue.add(cable[cable.length-1]);
                                minValue.add(cable[0]);
                                maxdiffValue.add(differencelist[differencelist.length-1]);
                                mindiffValue.add(differencelist[0]);
                                maxerrorValue.add(errorlist[errorlist.length-1]);
                                minerrorValue.add(errorlist[0]);
                                print(maxValue);
                                print(minValue);
                                //datalist1=[];
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    theorycableForce[a].toString(),
                                    //cableDataByTime[a].cableForce.toString(),
                                    cable[cable.length-1].toString(),
                                    cable[0].toString(),
                                    differencelist[differencelist.length-1].toString(),
                                    differencelist[0].toString(),
                                    errorlist[errorlist.length-1].toString() + '%',
                                    errorlist[0].toString() + '%',
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                        datalist1.add(content);
                                    });
                                }
                                }
                                });*/
                            //0722注销
                            //0722新增
                            setState(() {
                              dropdownText = '请选择';
                              dataColumn = dataColumnh;
                              datalist = datalisth;
                              datalist1 = datalisthh;
                              theorycableForce1 = theorycableForceh;
                              dataLine = [];
                              dataLine4 = [];
                              contentCharts = [];
                              maxValue = maxValueh;
                              minValue = minValueh;
                              maxdiffValue = maxdiffValueh;
                              mindiffValue = mindiffValueh;
                              maxerrorValue = maxerrorValueh;
                              minerrorValue = minerrorValueh;
                              for (int b = 0; b < selectNumber.length; b++) {
                                dataLine4 = [];
                                dataLine5 = [];
                                dataLine6 = [];
                                for (int a = 0;
                                    a < cableDataByTimelist[b].length;
                                    a++) {
                                  dataLine4.add(SalesData(
                                      cableDataByTimelist[b][a]
                                          .sampleTime
                                          .toString()
                                          .substring(0, 13),
                                      cableDataByTimelist[b][a]
                                          .horizontalOffset));
                                }
                                dataLine5 = dataLine4;
                                //dataLine7.add(dataLine4);
                                contentChart = LineSeries<SalesData, String>(
                                  name: '实际' + selectNumber[b],
                                  dataSource: dataLine5,
                                  xValueMapper: (SalesData sales, _) =>
                                      sales.year,
                                  yValueMapper: (SalesData sales, _) =>
                                      sales.sales,
                                  markerSettings:
                                      MarkerSettings(isVisible: true),
                                );
                                contentCharts.add(contentChart);
                                dataLine = [];
                                dataLine4 = [];
                                dataLine8 = [];
                                for (int a = 0;
                                    a < theorycableForce1[b].length;
                                    a++) {
                                  dataLine4.add(SalesData(
                                      cableDataByTimelist[b][a]
                                          .sampleTime
                                          .toString()
                                          .substring(0, 13),
                                      theorycableForce1[b][a]));
                                }
                                dataLine6 = dataLine4;
                                dataLine8.add(dataLine4);
                                contentChart = LineSeries<SalesData, String>(
                                  name: '理论' + selectNumber[b],
                                  dataSource: dataLine6,
                                  xValueMapper: (SalesData sales, _) =>
                                      sales.year,
                                  yValueMapper: (SalesData sales, _) =>
                                      sales.sales,
                                  markerSettings:
                                      MarkerSettings(isVisible: true),
                                );
                                contentCharts.add(contentChart);
                              }
                            });
                            //0722新增
                          },
                        ),
                      ),
                      Container(
                          width: 80,
                          child: FlatButton(
                            color: Colors.white,
                            child: Text('位移纵'),
                            onPressed: () {
                              /*setState(() {
                                  pointStylename='位移纵';
                                  dataColumn=dataColumnl;
                                  dataRowlist=[];
                                  phaseId=[];
                                  datalist=[];
                                  errorlist=[];
                                  differencelist=[]; 
                                  datalist1=[];
                                  for (int a = 0;
                                    a < offsetDataByTime.length;
                                    a++) {
                                  time = 0;
                                  time = DateTime.parse(
                                          offsetDataByTime[a].sampleTime)
                                      .millisecondsSinceEpoch;

                                  for (int b = 0; b < allPhase.length; b++) {
                                    startTime = 0;
                                    endTime = 0;
                                    startTime =
                                        DateTime.parse(allPhase[b].startTime)
                                            .millisecondsSinceEpoch;
                                    endTime =
                                        DateTime.parse(allPhase[b].endTime)
                                            .millisecondsSinceEpoch;
                                    if (time < endTime && time > startTime) {
                                      theoryId = 0;
                                      theoryId = allPhase[b].id;
                                      phaseId.add(theoryId);
                                    }
                                  }
                                }
                                //theoryData=await webApi.getTheoryData(cedianNumber,sensorType);
                                theorycableForce = [];
                                for (int a = 0; a < theoryData.length; a++) {
                                  for (int b = 0; b < phaseId.length; b++) {
                                    if (theoryData[a].phaseId == phaseId[b]) {
                                      theorycable = 0;
                                      theorycable = theoryData[a].lOffset;
                                      theorycableForce.add(theorycable);
                                    }
                                  }
                                }
                                print(theorycableForce);
                                String error1 = '';
                                errorlist=[];
                                for (int a = 0;
                                    a < theorycableForce.length;
                                    a++) {
                                  error = 0;
                                  error = (offsetDataByTime[a].longitudinalOffset -
                                      theorycableForce[a])/theorycableForce[a];
                                  error1 = (error * 100).toStringAsFixed(2);
                                  error = double.parse(error1);
                                  errorlist.add(error);
                                  difference=offsetDataByTime[a].longitudinalOffset - theorycableForce[a];
                                  differencelist.add(difference);
                                }
                                print(errorlist);
                                for (int a = 0;
                                    a < theorycableForce.length;
                                    a++) {
                                    dataRowlist=[ _value1,offsetDataByTime[a].longitudinalOffset.toString(),theorycableForce[a].toString(),errorlist[a].toString() + '%'];
                                  content = DataRow(
                                      cells: dataRowlist.map((e) => DataCell(Text(e))).toList());
                                  setState(() {
                                    datalist.add(content);
                                  });
                                }
                                print(datalist);
                                //特征值分析
                                cable=[];
                                for (int a = 0; a < offsetDataByTime.length; a++){
                                    cable.add(offsetDataByTime[a].longitudinalOffset);
                                }
                                cable.sort((a, b) => (a).compareTo(b));    //从小到大排列
                                differencelist.sort((a, b) => (a).compareTo(b));
                                errorlist.sort((a, b) => (a).compareTo(b));
                                print(cable);
                                datalist1=[];
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    _value1,
                                    theorycableForce[a].toString(),
                                    //cableDataByTime[a].cableForce.toString(),
                                    cable[cable.length-1].toString(),
                                    cable[0].toString(),
                                    differencelist[differencelist.length-1].toString(),
                                    differencelist[0].toString(),
                                    errorlist[errorlist.length-1].toString() + '%',
                                    errorlist[0].toString() + '%',
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                      datalist1.add(content);
                                    });
                                }
                                });*/
                              //0722注销
                              /*setState(() {
                                pointStylename='位移纵';
                                dataColumn=dataColumnl;
                                datalist=[];
                                theorycableForce1=[];
                                maxValue=[];
                                minValue=[];
                                maxdiffValue=[];
                                mindiffValue=[];
                                maxerrorValue=[];
                                minerrorValue=[];
                                for(int e=0;e<cedianNumberlist.length;e++){
                                phaseId=[];
                                theorycableForce = [];
                                errorlist=[];
                                differencelist=[];
                                datalist1=[];     //0721新增
                                for (int a = 0; a < cableDataByTimelist[e].length; a++) {
                                    time = 0;
                                    time =
                                          DateTime.parse(cableDataByTimelist[e][a].sampleTime).millisecondsSinceEpoch;
                                for (int b = 0; b < allPhase.length; b++) {
                                    startTime = 0;
                                    endTime = 0;
                                    startTime =
                                            DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
                                    endTime = DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
                                if (time < endTime && time > startTime) {
                                    theoryId = 0;
                                    theoryId = allPhase[b].id;
                                     phaseId.add(theoryId);
                                }
                                }
                                }
                                //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);
    
                                for (int a = 0; a < theoryDatalist[e].length; a++) {
                                    for (int b = 0; b < phaseId.length; b++) {
                                        if (theoryDatalist[e][a].phaseId == phaseId[b]) {
                                            theorycable = 0;
                                            theorycable = theoryDatalist[e][a].lOffset;
                                            theorycableForce.add(theorycable);
                                            //theorycableForce1.add(theorycableForce);
                                        }
                                    }
                                }
                                theorycableForce1.add(theorycableForce);
                                print(1);
                                print(theorycableForce);
                                //print(theorycableForce1);
                                String error1 = '';
    
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    error = 0;
                                    error = (cableDataByTimelist[e][a].longitudinalOffset - theorycableForce[a]) /
                                    theorycableForce[a];
                                    error1 = (error * 100).toStringAsFixed(2);
                                    error = double.parse(error1);
                                    errorlist.add(error);
                                    difference=cableDataByTimelist[e][a].longitudinalOffset - theorycableForce[a];
                                    differencelist.add(difference);
                                }
                                print(2);
                                print(errorlist);
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    cableDataByTimelist[e][a].longitudinalOffset.toString(),
                                    theorycableForce[a].toString(),
                                    errorlist[a].toString() + '%'
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                       datalist.add(content);
                                    });
                                }
                                //特征值分析
                                cable=[];
                                for (int a = 0; a < cableDataByTimelist[e].length; a++){
                                    cable.add(cableDataByTimelist[e][a].longitudinalOffset);
                                }
                                cable.sort((a, b) => (a).compareTo(b));    //从小到大排列
                                differencelist.sort((a, b) => (a).compareTo(b));
                                errorlist.sort((a, b) => (a).compareTo(b));
                                print(cable);
                                print('11');
                                maxValue.add(cable[cable.length-1]);
                                minValue.add(cable[0]);
                                maxdiffValue.add(differencelist[differencelist.length-1]);
                                mindiffValue.add(differencelist[0]);
                                maxerrorValue.add(errorlist[errorlist.length-1]);
                                minerrorValue.add(errorlist[0]);
                                print(maxValue);
                                print(minValue);
                                //datalist1=[];
                                for (int a = 0; a < theorycableForce.length; a++) {
                                    content = DataRow(
                                    cells: [
                                    //_value1,
                                    selectNumber[e],
                                    theorycableForce[a].toString(),
                                    //cableDataByTime[a].cableForce.toString(),
                                    cable[cable.length-1].toString(),
                                    cable[0].toString(),
                                    differencelist[differencelist.length-1].toString(),
                                    differencelist[0].toString(),
                                    errorlist[errorlist.length-1].toString() + '%',
                                    errorlist[0].toString() + '%',
                                    ].map((e) => DataCell(Text(e))).toList());
                                    setState(() {
                                        datalist1.add(content);
                                    });
                                }
                                }
                                });*/
                              //0722注销
                              //0722新增
                              setState(() {
                                dropdownText = '请选择';
                                dataColumn = dataColumnl;
                                datalist = datalistz;
                                datalist1 = datalistzz;
                                theorycableForce1 = theorycableForcez;
                                dataLine = [];
                                dataLine4 = [];
                                contentCharts = [];
                                maxValue = maxValuez;
                                minValue = minValuez;
                                maxdiffValue = maxdiffValuez;
                                mindiffValue = mindiffValuez;
                                maxerrorValue = maxerrorValuez;
                                minerrorValue = minerrorValuez;
                                for (int b = 0; b < selectNumber.length; b++) {
                                  dataLine4 = [];
                                  dataLine5 = [];
                                  dataLine6 = [];
                                  for (int a = 0;
                                      a < cableDataByTimelist[b].length;
                                      a++) {
                                    dataLine4.add(SalesData(
                                        cableDataByTimelist[b][a]
                                            .sampleTime
                                            .toString()
                                            .substring(0, 13),
                                        cableDataByTimelist[b][a]
                                            .longitudinalOffset));
                                  }
                                  dataLine5 = dataLine4;
                                  //dataLine7.add(dataLine4);
                                  contentChart = LineSeries<SalesData, String>(
                                    name: '实际' + selectNumber[b],
                                    dataSource: dataLine5,
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (SalesData sales, _) =>
                                        sales.sales,
                                    markerSettings:
                                        MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);
                                  dataLine = [];
                                  dataLine4 = [];
                                  for (int a = 0;
                                      a < theorycableForce1[b].length;
                                      a++) {
                                    dataLine4.add(SalesData(
                                        cableDataByTimelist[b][a]
                                            .sampleTime
                                            .toString()
                                            .substring(0, 13),
                                        theorycableForce1[b][a]));
                                  }
                                  dataLine6 = dataLine4;
                                  dataLine8.add(dataLine4);
                                  contentChart = LineSeries<SalesData, String>(
                                    name: '理论' + selectNumber[b],
                                    dataSource: dataLine6,
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (SalesData sales, _) =>
                                        sales.sales,
                                    markerSettings:
                                        MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);
                                }
                              });
                              //0722新增
                            },
                          ))
                    ]),
                  ),
                  //统计分析
                  Offstage(
                      offstage: offstate4,
                      child: Column(children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: DropdownButton(
                                    value: dropdownText,
                                    items: dropdown
                                        .map((e) => DropdownMenuItem(
                                            child: Text(e), value: e))
                                        .toList(),
                                    onChanged: (v) {
                                      setState(() {
                                        dropdownText = v;
                                        if (dropdownText == '最大值') {
                                          dataLine7 = [];
                                          contentdoubleCharts = [];
                                          for (int a = 0;
                                              a < selectNumber.length;
                                              a++) {
                                            dataLine7.add(PointData(
                                                selectNumber[a], maxValue[a]));
                                          }
                                          contentChart =
                                              ColumnSeries<PointData, String>(
                                                  dataSource: dataLine7,
                                                  xValueMapper:
                                                      (PointData sales, _) =>
                                                          sales.point,
                                                  yValueMapper:
                                                      (PointData sales, _) =>
                                                          sales.sales,
                                                  // Enable data label
                                                  dataLabelSettings:
                                                      DataLabelSettings(
                                                          isVisible: true));
                                          contentdoubleCharts.add(contentChart);
                                        } else if (dropdownText == '最小值') {
                                          dataLine7 = [];
                                          contentdoubleCharts = [];
                                          for (int a = 0;
                                              a < selectNumber.length;
                                              a++) {
                                            dataLine7.add(PointData(
                                                selectNumber[a], minValue[a]));
                                          }
                                          contentChart =
                                              ColumnSeries<PointData, String>(
                                                  dataSource: dataLine7,
                                                  xValueMapper:
                                                      (PointData sales, _) =>
                                                          sales.point,
                                                  yValueMapper:
                                                      (PointData sales, _) =>
                                                          sales.sales,
                                                  // Enable data label
                                                  dataLabelSettings:
                                                      DataLabelSettings(
                                                          isVisible: true));
                                          contentdoubleCharts.add(contentChart);
                                        } else if (dropdownText == '最大差值') {
                                          dataLine7 = [];
                                          contentdoubleCharts = [];
                                          for (int a = 0;
                                              a < selectNumber.length;
                                              a++) {
                                            dataLine7.add(PointData(
                                                selectNumber[a],
                                                maxdiffValue[a]));
                                          }
                                          contentChart =
                                              ColumnSeries<PointData, String>(
                                                  dataSource: dataLine7,
                                                  xValueMapper:
                                                      (PointData sales, _) =>
                                                          sales.point,
                                                  yValueMapper:
                                                      (PointData sales, _) =>
                                                          sales.sales,
                                                  // Enable data label
                                                  dataLabelSettings:
                                                      DataLabelSettings(
                                                          isVisible: true));
                                          contentdoubleCharts.add(contentChart);
                                        } else if (dropdownText == '最小差值') {
                                          dataLine7 = [];
                                          contentdoubleCharts = [];
                                          for (int a = 0;
                                              a < selectNumber.length;
                                              a++) {
                                            dataLine7.add(PointData(
                                                selectNumber[a],
                                                mindiffValue[a]));
                                          }
                                          contentChart =
                                              ColumnSeries<PointData, String>(
                                                  dataSource: dataLine7,
                                                  xValueMapper:
                                                      (PointData sales, _) =>
                                                          sales.point,
                                                  yValueMapper:
                                                      (PointData sales, _) =>
                                                          sales.sales,
                                                  // Enable data label
                                                  dataLabelSettings:
                                                      DataLabelSettings(
                                                          isVisible: true));
                                          contentdoubleCharts.add(contentChart);
                                        } else if (dropdownText == '最大误差') {
                                          dataLine7 = [];
                                          contentdoubleCharts = [];
                                          for (int a = 0;
                                              a < selectNumber.length;
                                              a++) {
                                            dataLine7.add(PointData(
                                                selectNumber[a],
                                                maxerrorValue[a]));
                                          }
                                          contentChart =
                                              ColumnSeries<PointData, String>(
                                                  dataSource: dataLine7,
                                                  xValueMapper:
                                                      (PointData sales, _) =>
                                                          sales.point,
                                                  yValueMapper:
                                                      (PointData sales, _) =>
                                                          sales.sales,
                                                  // Enable data label
                                                  dataLabelSettings:
                                                      DataLabelSettings(
                                                          isVisible: true));
                                          contentdoubleCharts.add(contentChart);
                                        } else if (dropdownText == '最小误差') {
                                          dataLine7 = [];
                                          contentdoubleCharts = [];
                                          for (int a = 0;
                                              a < selectNumber.length;
                                              a++) {
                                            dataLine7.add(PointData(
                                                selectNumber[a],
                                                minerrorValue[a]));
                                          }
                                          contentChart =
                                              ColumnSeries<PointData, String>(
                                                  dataSource: dataLine7,
                                                  xValueMapper:
                                                      (PointData sales, _) =>
                                                          sales.point,
                                                  yValueMapper:
                                                      (PointData sales, _) =>
                                                          sales.sales,
                                                  // Enable data label
                                                  dataLabelSettings:
                                                      DataLabelSettings(
                                                          isVisible: true));
                                          contentdoubleCharts.add(contentChart);
                                        } else {
                                          dataLine7 = [];
                                          contentdoubleCharts = [];
                                          /*for(int a=0;a<selectNumber.length;a++){
                                  dataLine7.add(PointData(selectNumber[a], minerrorValue[a]));
                            }*/
                                          contentChart =
                                              ColumnSeries<PointData, String>(
                                                  dataSource: dataLine7,
                                                  xValueMapper:
                                                      (PointData sales, _) =>
                                                          sales.point,
                                                  yValueMapper:
                                                      (PointData sales, _) =>
                                                          sales.sales,
                                                  // Enable data label
                                                  dataLabelSettings:
                                                      DataLabelSettings(
                                                          isVisible: true));
                                          contentdoubleCharts.add(contentChart);
                                        }
                                      });
                                    }))),
                        Container(
                            //margin: EdgeInsets.all(10),
                            /*decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),*/
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                Container(
                                    height: 200,
                                    //child: getLine1(),    //0612改
                                    child: getLine3()),
                              ],
                            )),
                        Container(
                            height: 400,
                            color: Colors.white,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              /*child: ListView(
                                  children: [
                                    DataTable(
                                      columns: dataColumne.map((e) {
                                        return DataColumn(label: Text(e));
                                      }).toList(),
                                      //rows:[DataRow(cells: ['1','1','1','1','1','1','1','1'].map((e) => DataCell(Text(e))).toList())],
                                      rows: datalist1,
                                      //rows: datalisttwo[index],
                                    ),
                                  ],
                                )*/
                              child: DataTable(
                                columns: dataColumne.map((e) {
                                  return DataColumn(label: Text(e));
                                }).toList(),
                                //rows:[DataRow(cells: ['1','1','1','1','1','1','1','1'].map((e) => DataCell(Text(e))).toList())],
                                rows: datalist1,
                                //rows: datalisttwo[index],
                              ),
                            )),
                      ])),
                  //监测曲线
                  Offstage(
                      offstage: offstate3,
                      child: Column(children: [
                        Container(
                            //margin: EdgeInsets.all(10),
                            /*decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),*/
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                Container(
                                    height: 200,
                                    //child: getLine1(),    //0612改
                                    child: getLine2()),
                              ],
                            )),
                        Container(
                            //margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            /*decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),*/
                            height: 400,
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: DataTable(
                                  columns: dataColumn.map((e) {
                                    return DataColumn(label: Text(e));
                                  }).toList(),
                                  //rows:[DataRow(cells: ['1','1','1','1'].map((e) => DataCell(Text(e))).toList())],
                                  rows: datalist,
                                  //rows:datalistone[index]
                                ))),
                      ])),
                ]))
          ],
        ));
  }

  /*getLine1() {
    var seriesLine = [
      charts.Series<Linesales, DateTime>(
        data: dataLine1,
        domainFn: (Linesales lines, _) => lines.jieduan,
        measureFn: (Linesales lines, _) => lines.sale,
        id: "Lines1",
      ),
      charts.Series<Linesales, DateTime>(
        data: dataLine2,
        domainFn: (Linesales lines, _) => lines.jieduan,
        measureFn: (Linesales lines, _) => lines.sale,
        id: "Lines2",
      ),
      
    ];
    //是TimeSeriesChart，而不是LineChart,因为x轴是DataTime类
    //Widget line = charts.LineChart(seriesLine);
    //Widget line = charts.TimeSeriesChart(seriesLine);
    Widget line = GestureDetector(
      //child: charts.LineChart(seriesLine),
      child: charts.TimeSeriesChart(seriesLine),
      onTap: () {
        print('2');
      },
    );
    //line = charts.LineChart(series);
    return line;
  }*/

  getLine2() {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(
          isVisible: true,
          //显示时间轴置顶
          opposedPosition: false,
          //时间轴反转
          isInversed: false,
        ),
        //标题
        //title: ChartTitle(text: '折线图测试'),
        //选中类型
        selectionType: SelectionType.series,
        //时间轴与值轴换位
        isTransposed: false,
        //选中手势
        selectionGesture: ActivationMode.singleTap,
        //图示
        legend: Legend(
            isVisible: true,
            iconHeight: 10,
            iconWidth: 10,
            //切换系列显示
            toggleSeriesVisibility: true,
            //图示显示位置
            position: LegendPosition.bottom,
            overflowMode: LegendItemOverflowMode.wrap,
            //图示左右位置
            alignment: ChartAlignment.center),
        //十字架
        crosshairBehavior: CrosshairBehavior(
          lineType: CrosshairLineType.horizontal, //横向选择指示器
          enable: true,
          shouldAlwaysShow: false, //十字架始终显示(横向选择指示器)
          activationMode: ActivationMode.singleTap,
        ),
        //跟踪球
        trackballBehavior: TrackballBehavior(
          lineType: TrackballLineType.vertical, //纵向选择指示器
          activationMode: ActivationMode.singleTap,
          enable: true,
          tooltipAlignment: ChartAlignment.near, //工具提示位置(顶部)
          shouldAlwaysShow: true, //跟踪球始终显示(纵向选择指示器)
          tooltipDisplayMode:
              TrackballDisplayMode.groupAllPoints, //工具提示模式(全部分组)
        ),
        //打开工具提示
        tooltipBehavior: TooltipBehavior(
          enable: false,
          shared: false,
          activationMode: ActivationMode.singleTap,
        ),
        //SplineSeries为曲线 LineSeries为折线ChartSeries

        series: contentCharts);
  }

  getLine3() {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      // Chart title
      //title: ChartTitle(text: '柱状图'),
      // Enable legend
      legend: Legend(isVisible: true),
      isTransposed: false,
      // Enable tooltip
      tooltipBehavior: TooltipBehavior(enable: true),
      /*series: <ChartSeries<PointData, String>>[
              ColumnSeries<PointData, String>(
                  dataSource: <PointData>[
                    /*PointData('Jan', 35),
                    PointData('Feb', 28),
                    PointData('Mar', 34),
                    PointData('Apr', 32),
                    PointData('May', 40)*/
                  ],
                  xValueMapper: (PointData sales, _) => sales.point,
                  yValueMapper: (PointData sales, _) => sales.sales,
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ]*/
      series: contentdoubleCharts,
    );
  }

  getSensorInfo() async {
    WebApi webApi = WebApi.instance;
    sensorinfo = await webApi.getSensorInfo(oneSubProject.id, sensorType, 5, 0);
    //print(sensorinfo);
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
  }

  getnewSensor() {
    newsensorinfo = [];

    for (int a = 0; a < sensorinfo.length; a++) {
      sensormap = {};
      sensormap['sensorId'] = sensorinfo[a].sensorId;
      sensormap['id'] = sensorinfo[a].id;
      sensormap['edge'] = edgemap['${sensorinfo[a].edge}'];
      //sensormap['offerDir']=offerDir['${sensormap['offerDir']}'];
      sensormap['offerDir'] = offerDir['${sensorinfo[a].offerDir}'];
      sensormap['installStage'] = sensorinfo[a].installStage;
      sensormap['markId'] = sensorinfo[a].markId;
      for (int b = 0; b < allPhase.length; b++) {
        if (sensorinfo[a].installStage == allPhase[b].id) {
          sensormap['name'] = allPhase[b].name;
          print(sensormap['name']);
        }
      }
      //if(stateName=='null')
      newsensorinfo.add(sensormap);
    }
    //print(newsensorinfo);
  }

  getStressDataByTime() async {
    WebApi webApi = WebApi.instance;
    /*stressDataByTime =
        await webApi.getStressDataByTimeSlot(cedianNumber, starttime, endtime);
    //print(cedianNumber);
    //print(stressDataByTime);
    phaseId=[];
    theorycableForce = [];
    errorlist=[];
    differencelist=[];
    datalist=[];
    for (int a = 0; a < stressDataByTime.length; a++) {
      time = 0;
      time =
          DateTime.parse(stressDataByTime[a].sampleTime).millisecondsSinceEpoch;
      for (int b = 0; b < allPhase.length; b++) {
        startTime = 0;
        endTime = 0;
        startTime =
            DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
        endTime = DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
        if (time < endTime && time > startTime) {
          theoryId = 0;
          theoryId = allPhase[b].id;
          phaseId.add(theoryId);
        }
      }
    }
    theoryData = await webApi.getTheoryData(cedianNumber, sensorType);
    theorycableForce = [];
    for (int a = 0; a < theoryData.length; a++) {
      for (int b = 0; b < phaseId.length; b++) {
        if (theoryData[a].phaseId == phaseId[b]) {
          theorycable = 0;
          theorycable = theoryData[a].stress;
          theorycableForce.add(theorycable);
        }
      }
    }
    print(theorycableForce);
    String error1 = '';
    for (int a = 0; a < theorycableForce.length; a++) {
      error = 0;
      error = (stressDataByTime[a].phasesStress - theorycableForce[a])/theorycableForce[a];
      error1 = (error * 100).toStringAsFixed(2);
      error = double.parse(error1);
      errorlist.add(error);
      difference=stressDataByTime[a].phasesStress - theorycableForce[a];
      differencelist.add(difference);
    }
    print(errorlist);
    datalist=[];
    for (int a = 0; a < theorycableForce.length; a++) {
      content = DataRow(
          cells: [
        _value1,
        stressDataByTime[a].phasesStress.toString(),
        theorycableForce[a].toString(),
        errorlist[a].toString() + '%'
      ].map((e) => DataCell(Text(e))).toList());
      setState(() {
        datalist.add(content);
      });
    }
    //特征值分析
    cable=[];
    for (int a = 0; a < stressDataByTime.length; a++){
      cable.add(stressDataByTime[a].phasesStress);
    }
    cable.sort((a, b) => (a).compareTo(b));    //从小到大排列
    differencelist.sort((a, b) => (a).compareTo(b));
    errorlist.sort((a, b) => (a).compareTo(b));
    print(cable);
    //difference=[];
    datalist1=[];
    for (int a = 0; a < theorycableForce.length; a++) {
      content = DataRow(
          cells: [
        _value1,
        theorycableForce[a].toString(),
        //cableDataByTime[a].cableForce.toString(),
        cable[cable.length-1].toString(),
        cable[0].toString(),
        differencelist[differencelist.length-1].toString(),
        differencelist[0].toString(),
        errorlist[errorlist.length-1].toString() + '%',
        errorlist[0].toString() + '%',
      ].map((e) => DataCell(Text(e))).toList());
      setState(() {
        datalist1.add(content);
      });
    }
    //print(datalist);
    if (stressDataByTime.length != 0 && theorycableForce.length != 0) {
      Fluttertoast.showToast(msg: '获取数据成功');
    }*/
    datalist = [];
    theorycableForce1 = [];
    maxValue = [];
    minValue = [];
    maxdiffValue = [];
    mindiffValue = [];
    maxerrorValue = [];
    minerrorValue = [];
    cableDataByTimelist = [];
    theoryDatalist = [];
    for (int e = 0; e < cedianNumberlist.length; e++) {
      stressDataByTime = await webApi.getStressDataByTimeSlot(
          cedianNumberlist[e], starttime, endtime);
      theoryData = await webApi.getTheoryData(cedianNumberlist[e], sensorType);
      cableDataByTimelist.add(stressDataByTime);
      theoryDatalist.add(theoryData);
      //print(cableDataByTimelist);
      phaseId = [];
      theorycableForce = [];
      errorlist = [];
      differencelist = [];

      for (int a = 0; a < stressDataByTime.length; a++) {
        time = 0;
        time = DateTime.parse(stressDataByTime[a].sampleTime)
            .millisecondsSinceEpoch;
        for (int b = 0; b < allPhase.length; b++) {
          startTime = 0;
          endTime = 0;
          if (allPhase[b].startTime != null && allPhase[b].endTime != null) {
            startTime =
                DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
            endTime =
                DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
            if (time < endTime && time > startTime) {
              theoryId = 0;
              theoryId = allPhase[b].id;
              phaseId.add(theoryId);
            }
          }
        }
      }
      //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);

      for (int a = 0; a < theoryData.length; a++) {
        for (int b = 0; b < phaseId.length; b++) {
          if (theoryData[a].phaseId == phaseId[b]) {
            theorycable = 0;
            theorycable = theoryData[a].stress;
            theorycableForce.add(theorycable);
            //theorycableForce1.add(theorycableForce);
          }
        }
      }
      theorycableForce1.add(theorycableForce);
      print(theorycableForce);
      //print(theorycableForce1);
      String error1 = '';

      for (int a = 0; a < theorycableForce.length; a++) {
        error = 0;
        error = (stressDataByTime[a].phasesStress - theorycableForce[a]) /
            theorycableForce[a];
        error1 = (error * 100).toStringAsFixed(2);
        error = double.parse(error1);
        errorlist.add(error);
        difference = stressDataByTime[a].phasesStress - theorycableForce[a];
        differencelist.add(difference);
      }
      print(errorlist);

      for (int a = 0; a < theorycableForce.length; a++) {
        content = DataRow(
            cells: [
          //_value1,
          selectNumber[e],
          stressDataByTime[a].phasesStress.toString(),
          theorycableForce[a].toString(),
          errorlist[a].toString() + '%'
        ].map((e) => DataCell(Text(e))).toList());
        setState(() {
          datalist.add(content);
        });
      }
      //特征值分析
      cable = [];
      for (int a = 0; a < stressDataByTime.length; a++) {
        cable.add(stressDataByTime[a].phasesStress);
      }
      cable.sort((a, b) => (a).compareTo(b)); //从小到大排列
      differencelist.sort((a, b) => (a).compareTo(b));
      errorlist.sort((a, b) => (a).compareTo(b));
      print(cable);
      print('11');
      maxValue.add(cable[cable.length - 1]);
      minValue.add(cable[0]);
      maxdiffValue.add(differencelist[differencelist.length - 1]);
      mindiffValue.add(differencelist[0]);
      maxerrorValue.add(errorlist[errorlist.length - 1]);
      minerrorValue.add(errorlist[0]);
      print(maxValue);
      print(minValue);
      //datalist1=[];
      for (int a = 0; a < theorycableForce.length; a++) {
        content = DataRow(
            cells: [
          //_value1,
          selectNumber[e],
          theorycableForce[a].toString(),
          //cableDataByTime[a].cableForce.toString(),
          cable[cable.length - 1].toString(),
          cable[0].toString(),
          differencelist[differencelist.length - 1].toString(),
          differencelist[0].toString(),
          errorlist[errorlist.length - 1].toString() + '%',
          errorlist[0].toString() + '%',
        ].map((e) => DataCell(Text(e))).toList());
        setState(() {
          datalist1.add(content);
        });
      }
    }
    //0723新增
    dataLine = [];
    dataLine4 = [];
    contentCharts = [];
    for (int b = 0; b < selectNumber.length; b++) {
      dataLine4 = [];
      dataLine5 = [];
      dataLine6 = [];
      for (int a = 0; a < cableDataByTimelist[b].length; a++) {
        dataLine4.add(SalesData(
            cableDataByTimelist[b][a].sampleTime.toString().substring(0, 13),
            cableDataByTimelist[b][a].phasesStress));
      }
      dataLine5 = dataLine4;
      //dataLine7.add(dataLine4);
      contentChart = LineSeries<SalesData, String>(
        name: '实际' + selectNumber[b],
        dataSource: dataLine5,
        xValueMapper: (SalesData sales, _) => sales.year,
        yValueMapper: (SalesData sales, _) => sales.sales,
        markerSettings: MarkerSettings(isVisible: true),
      );
      contentCharts.add(contentChart);
      dataLine = [];
      dataLine4 = [];
      for (int a = 0; a < theorycableForce1[b].length; a++) {
        dataLine4.add(SalesData(
            cableDataByTimelist[b][a].sampleTime.toString().substring(0, 13),
            theorycableForce1[b][a]));
      }
      dataLine6 = dataLine4;
      dataLine8.add(dataLine4);
      contentChart = LineSeries<SalesData, String>(
        name: '理论' + selectNumber[b],
        dataSource: dataLine6,
        xValueMapper: (SalesData sales, _) => sales.year,
        yValueMapper: (SalesData sales, _) => sales.sales,
        markerSettings: MarkerSettings(isVisible: true),
      );
      contentCharts.add(contentChart);
      //0723注销
      /*dataLine4 = [];
                                    dataLine5 = [];
                                    dataLine6 = [];
                                    for (int a = 0;
                                      a < cableDataByTimelist[1].length;
                                      a++) {
                                    dataLine4.add(SalesData(cableDataByTimelist[1][a].sampleTime.toString().substring(0,13),cableDataByTimelist[1][a].cableForce)); 
                                  }
                                  dataLine5 = dataLine4;
                                  //dataLine7.add(dataLine4);
                                  contentChart=LineSeries<SalesData, String>(
                                  name: '实际'+selectNumber[1],
                                  dataSource:dataLine5,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  markerSettings: MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);
                                  dataLine = [];
                                  dataLine4 = [];
                                  for (int a = 0; 
                                      a < theorycableForce1[1].length;
                                      a++) {
                                    dataLine4.add(SalesData(cableDataByTimelist[1][a].sampleTime.toString().substring(0,13),theorycableForce1[1][a]));
                                  }
                                  dataLine6 = dataLine4;
                                  dataLine8.add(dataLine4);
                                  contentChart=LineSeries<SalesData, String>(
                                  name: '理论'+selectNumber[1],
                                  dataSource:dataLine6,
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                                  markerSettings: MarkerSettings(isVisible: true),
                                  );
                                  contentCharts.add(contentChart);*/
    }
    //0723新增
  }

  getOffsetDataByTime() async {
    WebApi webApi = WebApi.instance;
    /*offsetDataByTime =
        await webApi.getOffsetDataByTimeSlot(cedianNumber, starttime, endtime);
    theoryData = await webApi.getTheoryData(cedianNumber, sensorType);
    //print(stressDataByTime);
    if (offsetDataByTime.length != 0 &&
      theoryData.length != 0) {
    Fluttertoast.showToast(msg: '获取数据成功');
    }*/
    for (int e = 0; e < cedianNumberlist.length; e++) {
      offsetDataByTime = await webApi.getOffsetDataByTimeSlot(
          cedianNumberlist[e], starttime, endtime);
      theoryData = await webApi.getTheoryData(cedianNumberlist[e], sensorType);
      cableDataByTimelist.add(offsetDataByTime);
      theoryDatalist.add(theoryData);
    }
    //print(cableDataByTimelist);
    print(theoryDatalist);
    //0723新增
    datalists = [];
    datalisth = [];
    datalistz = [];
    datalistss = [];
    datalisthh = [];
    datalistzz = [];
    datalistone = [];
    datalisttwo = [];

    //位移横
    setState(() {
      pointStylename = '位移横';
      dataColumn = dataColumnh;
      datalist = [];
      theorycableForce1 = [];
      maxValue = [];
      minValue = [];
      maxdiffValue = [];
      mindiffValue = [];
      maxerrorValue = [];
      minerrorValue = [];
      maxValueh = [];
      minValueh = [];
      maxdiffValueh = [];
      mindiffValueh = [];
      maxerrorValueh = [];
      minerrorValueh = [];
      for (int e = 0; e < cedianNumberlist.length; e++) {
        phaseId = [];
        theorycableForce = [];
        errorlist = [];
        differencelist = [];
        datalist1 = []; //0721新增
        theorycableForceh = [];
        for (int a = 0; a < cableDataByTimelist[e].length; a++) {
          time = 0;
          time = DateTime.parse(cableDataByTimelist[e][a].sampleTime)
              .millisecondsSinceEpoch;
          for (int b = 0; b < allPhase.length; b++) {
            startTime = 0;
            endTime = 0;
            if (allPhase[b].startTime != null && allPhase[b].endTime != null) {
              startTime =
                  DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
              endTime =
                  DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
              if (time < endTime && time > startTime) {
                theoryId = 0;
                theoryId = allPhase[b].id;
                phaseId.add(theoryId);
              }
            }
          }
        }
        //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);

        for (int a = 0; a < theoryDatalist[e].length; a++) {
          for (int b = 0; b < phaseId.length; b++) {
            if (theoryDatalist[e][a].phaseId == phaseId[b]) {
              theorycable = 0;
              theorycable = theoryDatalist[e][a].hOffset;
              theorycableForce.add(theorycable);
              //theorycableForce1.add(theorycableForce);
            }
          }
        }
        theorycableForce1.add(theorycableForce);
        theorycableForceh.add(theorycableForce);
        print(1);
        print(theorycableForce);
        //print(theorycableForce1);
        String error1 = '';

        for (int a = 0; a < theorycableForce.length; a++) {
          error = 0;
          error = (cableDataByTimelist[e][a].horizontalOffset -
                  theorycableForce[a]) /
              theorycableForce[a];
          error1 = (error * 100).toStringAsFixed(2);
          error = double.parse(error1);
          errorlist.add(error);
          difference =
              cableDataByTimelist[e][a].horizontalOffset - theorycableForce[a];
          differencelist.add(difference);
        }
        print(2);
        print(errorlist);
        for (int a = 0; a < theorycableForce.length; a++) {
          content = DataRow(
              cells: [
            //_value1,
            selectNumber[e],
            cableDataByTimelist[e][a].horizontalOffset.toString(),
            theorycableForce[a].toString(),
            errorlist[a].toString() + '%'
          ].map((e) => DataCell(Text(e))).toList());
          setState(() {
            datalist.add(content);
            datalisth.add(content);
          });
        }
        //特征值分析
        cable = [];
        for (int a = 0; a < cableDataByTimelist[e].length; a++) {
          cable.add(cableDataByTimelist[e][a].horizontalOffset);
        }
        cable.sort((a, b) => (a).compareTo(b)); //从小到大排列
        differencelist.sort((a, b) => (a).compareTo(b));
        errorlist.sort((a, b) => (a).compareTo(b));
        print(cable);
        print('11');
        maxValue.add(cable[cable.length - 1]);
        minValue.add(cable[0]);
        maxdiffValue.add(differencelist[differencelist.length - 1]);
        mindiffValue.add(differencelist[0]);
        maxerrorValue.add(errorlist[errorlist.length - 1]);
        minerrorValue.add(errorlist[0]);
        maxValueh.add(cable[cable.length - 1]);
        minValueh.add(cable[0]);
        maxdiffValueh.add(differencelist[differencelist.length - 1]);
        mindiffValueh.add(differencelist[0]);
        maxerrorValueh.add(errorlist[errorlist.length - 1]);
        minerrorValueh.add(errorlist[0]);
        print(maxValue);
        print(minValue);
        //datalist1=[];
        for (int a = 0; a < theorycableForce.length; a++) {
          content = DataRow(
              cells: [
            //_value1,
            selectNumber[e],
            theorycableForce[a].toString(),
            //cableDataByTime[a].cableForce.toString(),
            cable[cable.length - 1].toString(),
            cable[0].toString(),
            differencelist[differencelist.length - 1].toString(),
            differencelist[0].toString(),
            errorlist[errorlist.length - 1].toString() + '%',
            errorlist[0].toString() + '%',
          ].map((e) => DataCell(Text(e))).toList());
          setState(() {
            datalist1.add(content);
            datalisthh.add(content);
          });
        }
      }
    });
    //位移纵
    setState(() {
      pointStylename = '位移纵';
      dataColumn = dataColumnl;
      datalist = [];
      theorycableForce1 = [];
      maxValue = [];
      minValue = [];
      maxdiffValue = [];
      mindiffValue = [];
      maxerrorValue = [];
      minerrorValue = [];
      maxValuez = [];
      minValuez = [];
      maxdiffValuez = [];
      mindiffValuez = [];
      maxerrorValuez = [];
      minerrorValuez = [];
      for (int e = 0; e < cedianNumberlist.length; e++) {
        phaseId = [];
        theorycableForce = [];
        errorlist = [];
        differencelist = [];
        datalist1 = []; //0721新增
        theorycableForcez = [];
        for (int a = 0; a < cableDataByTimelist[e].length; a++) {
          time = 0;
          time = DateTime.parse(cableDataByTimelist[e][a].sampleTime)
              .millisecondsSinceEpoch;
          for (int b = 0; b < allPhase.length; b++) {
            startTime = 0;
            endTime = 0;
            if (allPhase[b].startTime != null && allPhase[b].endTime != null) {
              startTime =
                  DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
              endTime =
                  DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
              if (time < endTime && time > startTime) {
                theoryId = 0;
                theoryId = allPhase[b].id;
                phaseId.add(theoryId);
              }
            }
          }
        }
        //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);

        for (int a = 0; a < theoryDatalist[e].length; a++) {
          for (int b = 0; b < phaseId.length; b++) {
            if (theoryDatalist[e][a].phaseId == phaseId[b]) {
              theorycable = 0;
              theorycable = theoryDatalist[e][a].lOffset;
              theorycableForce.add(theorycable);
              //theorycableForce1.add(theorycableForce);
            }
          }
        }
        theorycableForce1.add(theorycableForce);
        theorycableForcez.add(theorycableForce);
        print(1);
        print(theorycableForce);
        //print(theorycableForce1);
        String error1 = '';

        for (int a = 0; a < theorycableForce.length; a++) {
          error = 0;
          error = (cableDataByTimelist[e][a].longitudinalOffset -
                  theorycableForce[a]) /
              theorycableForce[a];
          error1 = (error * 100).toStringAsFixed(2);
          error = double.parse(error1);
          errorlist.add(error);
          difference = cableDataByTimelist[e][a].longitudinalOffset -
              theorycableForce[a];
          differencelist.add(difference);
        }
        print(2);
        print(errorlist);
        for (int a = 0; a < theorycableForce.length; a++) {
          content = DataRow(
              cells: [
            //_value1,
            selectNumber[e],
            cableDataByTimelist[e][a].longitudinalOffset.toString(),
            theorycableForce[a].toString(),
            errorlist[a].toString() + '%'
          ].map((e) => DataCell(Text(e))).toList());
          setState(() {
            datalist.add(content);
            datalistz.add(content);
          });
        }
        //特征值分析
        cable = [];
        for (int a = 0; a < cableDataByTimelist[e].length; a++) {
          cable.add(cableDataByTimelist[e][a].longitudinalOffset);
        }
        cable.sort((a, b) => (a).compareTo(b)); //从小到大排列
        differencelist.sort((a, b) => (a).compareTo(b));
        errorlist.sort((a, b) => (a).compareTo(b));
        print(cable);
        print('11');
        maxValue.add(cable[cable.length - 1]);
        minValue.add(cable[0]);
        maxdiffValue.add(differencelist[differencelist.length - 1]);
        mindiffValue.add(differencelist[0]);
        maxerrorValue.add(errorlist[errorlist.length - 1]);
        minerrorValue.add(errorlist[0]);
        maxValuez.add(cable[cable.length - 1]);
        minValuez.add(cable[0]);
        maxdiffValuez.add(differencelist[differencelist.length - 1]);
        mindiffValuez.add(differencelist[0]);
        maxerrorValuez.add(errorlist[errorlist.length - 1]);
        minerrorValuez.add(errorlist[0]);
        print(maxValue);
        print(minValue);
        //datalist1=[];
        for (int a = 0; a < theorycableForce.length; a++) {
          content = DataRow(
              cells: [
            //_value1,
            selectNumber[e],
            theorycableForce[a].toString(),
            //cableDataByTime[a].cableForce.toString(),
            cable[cable.length - 1].toString(),
            cable[0].toString(),
            differencelist[differencelist.length - 1].toString(),
            differencelist[0].toString(),
            errorlist[errorlist.length - 1].toString() + '%',
            errorlist[0].toString() + '%',
          ].map((e) => DataCell(Text(e))).toList());
          setState(() {
            datalist1.add(content);
            datalistzz.add(content);
          });
        }
      }
      /*datalist=datalists;
                                datalist1=datalistss;
                                dataColumn=dataColumnv;
                                theorycableForce1=theorycableForces;
                                //datalist=[];
                                //theorycableForce1=[];
                                maxValue=[];
                                minValue=[];
                                maxdiffValue=[];
                                mindiffValue=[];
                                maxerrorValue=[];
                                minerrorValue=[];*/
    });

    //位移竖
    setState(() {
      pointStylename = '位移竖';
      dataColumn = dataColumnv;
      datalist = [];
      theorycableForce1 = [];
      maxValue = [];
      minValue = [];
      maxdiffValue = [];
      mindiffValue = [];
      maxerrorValue = [];
      minerrorValue = [];
      maxValues = [];
      minValues = [];
      maxdiffValues = [];
      mindiffValues = [];
      maxerrorValues = [];
      minerrorValues = [];
      datalist1 = []; //0721新增
      theorycableForces = [];
      for (int e = 0; e < cedianNumberlist.length; e++) {
        phaseId = [];
        theorycableForce = [];
        errorlist = [];
        differencelist = [];

        for (int a = 0; a < cableDataByTimelist[e].length; a++) {
          time = 0;
          time = DateTime.parse(cableDataByTimelist[e][a].sampleTime)
              .millisecondsSinceEpoch;
          for (int b = 0; b < allPhase.length; b++) {
            startTime = 0;
            endTime = 0;
            if (allPhase[b].startTime != null && allPhase[b].endTime != null) {
              startTime =
                  DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
              endTime =
                  DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
              if (time < endTime && time > startTime) {
                theoryId = 0;
                theoryId = allPhase[b].id;
                phaseId.add(theoryId);
              }
            }
          }
        }
        //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);

        for (int a = 0; a < theoryDatalist[e].length; a++) {
          for (int b = 0; b < phaseId.length; b++) {
            if (theoryDatalist[e][a].phaseId == phaseId[b]) {
              theorycable = 0;
              theorycable = theoryDatalist[e][a].vOffset;
              theorycableForce.add(theorycable);
              //theorycableForce1.add(theorycableForce);
            }
          }
        }
        theorycableForce1.add(theorycableForce);
        theorycableForces.add(theorycableForce);
        print(1);
        print(theorycableForce);
        //print(theorycableForce1);
        String error1 = '';

        for (int a = 0; a < theorycableForce.length; a++) {
          error = 0;
          error =
              (cableDataByTimelist[e][a].verticalOffset - theorycableForce[a]) /
                  theorycableForce[a];
          error1 = (error * 100).toStringAsFixed(2);
          error = double.parse(error1);
          errorlist.add(error);
          difference =
              cableDataByTimelist[e][a].verticalOffset - theorycableForce[a];
          differencelist.add(difference);
        }
        print(2);
        print(errorlist);
        for (int a = 0; a < theorycableForce.length; a++) {
          content = DataRow(
              cells: [
            //_value1,
            selectNumber[e],
            cableDataByTimelist[e][a].verticalOffset.toString(),
            theorycableForce[a].toString(),
            errorlist[a].toString() + '%'
          ].map((e) => DataCell(Text(e))).toList());
          setState(() {
            datalist.add(content);
            datalists.add(content);
          });
        }
        //特征值分析
        cable = [];
        //theorycableForce=[];
        for (int a = 0; a < cableDataByTimelist[e].length; a++) {
          cable.add(cableDataByTimelist[e][a].verticalOffset);
        }
        cable.sort((a, b) => (a).compareTo(b)); //从小到大排列
        differencelist.sort((a, b) => (a).compareTo(b));
        errorlist.sort((a, b) => (a).compareTo(b));
        print(cable);
        print('11');
        maxValue.add(cable[cable.length - 1]);
        minValue.add(cable[0]);
        maxdiffValue.add(differencelist[differencelist.length - 1]);
        mindiffValue.add(differencelist[0]);
        maxerrorValue.add(errorlist[errorlist.length - 1]);
        minerrorValue.add(errorlist[0]);
        maxValues.add(cable[cable.length - 1]);
        minValues.add(cable[0]);
        maxdiffValues.add(differencelist[differencelist.length - 1]);
        mindiffValues.add(differencelist[0]);
        maxerrorValues.add(errorlist[errorlist.length - 1]);
        minerrorValues.add(errorlist[0]);
        print(maxValue);
        print(minValue);
        //datalist1=[];
        for (int a = 0; a < theorycableForce.length; a++) {
          content = DataRow(
              cells: [
            //_value1,
            selectNumber[e],
            theorycableForce[a].toString(),
            //cableDataByTime[a].cableForce.toString(),
            cable[cable.length - 1].toString(),
            cable[0].toString(),
            differencelist[differencelist.length - 1].toString(),
            differencelist[0].toString(),
            errorlist[errorlist.length - 1].toString() + '%',
            errorlist[0].toString() + '%',
          ].map((e) => DataCell(Text(e))).toList());
          setState(() {
            datalist1.add(content);
            datalistss.add(content);
          });
        }
      }
    });
    setState(() {
      dropdownText = '请选择';
      dataColumn = dataColumnv;
      datalist = datalists;
      datalist1 = datalistss;
      theorycableForce1 = theorycableForces;
      dataLine = [];
      dataLine4 = [];
      contentCharts = [];
      dataLine8 = [];
      maxValue = maxValues;
      minValue = minValues;
      maxdiffValue = maxdiffValues;
      mindiffValue = mindiffValues;
      maxerrorValue = maxerrorValues;
      minerrorValue = minerrorValues;
      for (int b = 0; b < selectNumber.length; b++) {
        dataLine4 = [];
        dataLine5 = [];
        dataLine6 = [];
        for (int a = 0; a < cableDataByTimelist[b].length; a++) {
          dataLine4.add(SalesData(
              cableDataByTimelist[b][a].sampleTime.toString().substring(0, 13),
              cableDataByTimelist[b][a].verticalOffset));
        }
        dataLine5 = dataLine4;
        //dataLine7.add(dataLine4);
        contentChart = LineSeries<SalesData, String>(
          name: '实际' + selectNumber[b],
          dataSource: dataLine5,
          xValueMapper: (SalesData sales, _) => sales.year,
          yValueMapper: (SalesData sales, _) => sales.sales,
          markerSettings: MarkerSettings(isVisible: true),
        );
        contentCharts.add(contentChart);
        dataLine = [];
        dataLine4 = [];
        dataLine8 = [];
        for (int a = 0; a < theorycableForce1[b].length; a++) {
          dataLine4.add(SalesData(
              cableDataByTimelist[b][a].sampleTime.toString().substring(0, 13),
              theorycableForce1[b][a]));
        }
        dataLine6 = dataLine4;
        dataLine8.add(dataLine4);
        contentChart = LineSeries<SalesData, String>(
          name: '理论' + selectNumber[b],
          dataSource: dataLine6,
          xValueMapper: (SalesData sales, _) => sales.year,
          yValueMapper: (SalesData sales, _) => sales.sales,
          markerSettings: MarkerSettings(isVisible: true),
        );
        contentCharts.add(contentChart);
      }
    });
    //0723新增
  }

  getCableDataByTime() async {
    WebApi webApi = WebApi.instance;
    /*cableDataByTime =await webApi.getCableDataByTimeSlot(cedianNumber, starttime, endtime);    
    theoryData = await webApi.getTheoryData(cedianNumber, sensorType);*/
    //print(DateTime.parse(cableDataByTime[0].sampleTime));
    /*phaseId=[];
    theorycableForce = [];
    errorlist=[];
    differencelist=[];*/
    //datalist=[];
    //theorycableForce1=[];
    /*for(int e=0;e<cedianNumber1ist.length;e++){
      
    }*/
    /*cableDataByTime =await webApi.getCableDataByTimeSlot(cedianNumber, starttime, endtime);    
    theoryData = await webApi.getTheoryData(cedianNumber, sensorType);
       
    for (int a = 0; a < cableDataByTime.length; a++) {
      time = 0;
      time =
          DateTime.parse(cableDataByTime[a].sampleTime).millisecondsSinceEpoch;
      for (int b = 0; b < allPhase.length; b++) {
        startTime = 0;
        endTime = 0;
        startTime =
            DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
        endTime = DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
        if (time < endTime && time > startTime) {
          theoryId = 0;
          theoryId = allPhase[b].id;
          phaseId.add(theoryId);
        }
      }
    }
    //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);
    
    for (int a = 0; a < theoryData.length; a++) {
      for (int b = 0; b < phaseId.length; b++) {
        if (theoryData[a].phaseId == phaseId[b]) {
          theorycable = 0;
          theorycable = theoryData[a].cableForce;
          theorycableForce.add(theorycable);
        }
      }
    }
    print(theorycableForce);
    String error1 = '';
    
    for (int a = 0; a < theorycableForce.length; a++) {
      error = 0;
      error = (cableDataByTime[a].cableForce - theorycableForce[a]) /
          theorycableForce[a];
      error1 = (error * 100).toStringAsFixed(2);
      error = double.parse(error1);
      errorlist.add(error);
      difference=cableDataByTime[a].cableForce - theorycableForce[a];
      differencelist.add(difference);
    }
    print(errorlist);
    
    for (int a = 0; a < theorycableForce.length; a++) {
      content = DataRow(
          cells: [
        _value1,
        cableDataByTime[a].cableForce.toString(),
        theorycableForce[a].toString(),
        errorlist[a].toString() + '%'
      ].map((e) => DataCell(Text(e))).toList());
      setState(() {
        datalist.add(content);
      });
    }
    
    //特征值分析
    cable=[];
    for (int a = 0; a < cableDataByTime.length; a++){
      cable.add(cableDataByTime[a].cableForce);
    }
    cable.sort((a, b) => (a).compareTo(b));    //从小到大排列
    differencelist.sort((a, b) => (a).compareTo(b));
    errorlist.sort((a, b) => (a).compareTo(b));
    print(cable);
    //difference=[];
    datalist1=[];
    for (int a = 0; a < theorycableForce.length; a++) {
      content = DataRow(
          cells: [
        _value1,
        theorycableForce[a].toString(),
        //cableDataByTime[a].cableForce.toString(),
        cable[cable.length-1].toString(),
        cable[0].toString(),
        differencelist[differencelist.length-1].toString(),
        differencelist[0].toString(),
        errorlist[errorlist.length-1].toString() + '%',
        errorlist[0].toString() + '%',
      ].map((e) => DataCell(Text(e))).toList());
      setState(() {
        datalist1.add(content);
      });
    }
    //print(datalist);
    if (phaseId.length != 0 && theorycableForce.length != 0) {
      Fluttertoast.showToast(msg: '获取数据成功');
    }*/
    datalist = [];
    datalist1 = [];
    theorycableForce1 = [];
    maxValue = [];
    minValue = [];
    maxdiffValue = [];
    mindiffValue = [];
    maxerrorValue = [];
    minerrorValue = [];
    cableDataByTimelist = [];
    theoryDatalist = [];
    for (int e = 0; e < cedianNumberlist.length; e++) {
      cableDataByTime = await webApi.getCableDataByTimeSlot(
          cedianNumberlist[e], starttime, endtime);
      theoryData = await webApi.getTheoryData(cedianNumberlist[e], sensorType);
      //cableData(cedianNumber1ist[e],starttime,endtime,sensorType);
      //print(cableDataByTime);
      cableDataByTimelist.add(cableDataByTime);
      theoryDatalist.add(theoryData);
      //print(cableDataByTimelist);
      phaseId = [];
      theorycableForce = [];
      errorlist = [];
      differencelist = [];

      for (int a = 0; a < cableDataByTime.length; a++) {
        time = 0;
        time = DateTime.parse(cableDataByTime[a].sampleTime)
            .millisecondsSinceEpoch;
        for (int b = 0; b < allPhase.length; b++) {
          startTime = 0;
          endTime = 0;
          if (allPhase[b].startTime != null && allPhase[b].endTime != null) {
            startTime =
                DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
            endTime =
                DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
            if (time < endTime && time > startTime) {
              theoryId = 0;
              theoryId = allPhase[b].id;
              phaseId.add(theoryId);
            }
          }
        }
      }
      //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);

      for (int a = 0; a < theoryData.length; a++) {
        for (int b = 0; b < phaseId.length; b++) {
          if (theoryData[a].phaseId == phaseId[b]) {
            theorycable = 0;
            theorycable = theoryData[a].cableForce;
            theorycableForce.add(theorycable);
            //theorycableForce1.add(theorycableForce);
          }
        }
      }
      theorycableForce1.add(theorycableForce);
      print(theorycableForce);
      //print(theorycableForce1);
      String error1 = '';

      for (int a = 0; a < theorycableForce.length; a++) {
        error = 0;
        error = (cableDataByTime[a].cableForce - theorycableForce[a]) /
            theorycableForce[a];
        error1 = (error * 100).toStringAsFixed(2);
        error = double.parse(error1);
        errorlist.add(error);
        difference = cableDataByTime[a].cableForce - theorycableForce[a];
        differencelist.add(difference);
      }
      print(errorlist);

      for (int a = 0; a < theorycableForce.length; a++) {
        content = DataRow(
            cells: [
          //_value1,
          selectNumber[e],
          cableDataByTime[a].cableForce.toString(),
          theorycableForce[a].toString(),
          errorlist[a].toString() + '%'
        ].map((e) => DataCell(Text(e))).toList());
        setState(() {
          datalist.add(content);
        });
      }
      //特征值分析
      cable = [];
      for (int a = 0; a < cableDataByTime.length; a++) {
        cable.add(cableDataByTime[a].cableForce);
      }
      cable.sort((a, b) => (a).compareTo(b)); //从小到大排列
      differencelist.sort((a, b) => (a).compareTo(b));
      errorlist.sort((a, b) => (a).compareTo(b));
      print(cable);
      print('11');
      maxValue.add(cable[cable.length - 1]);
      minValue.add(cable[0]);
      maxdiffValue.add(differencelist[differencelist.length - 1]);
      mindiffValue.add(differencelist[0]);
      maxerrorValue.add(errorlist[errorlist.length - 1]);
      minerrorValue.add(errorlist[0]);
      print(maxValue);
      print(minValue);
      //datalist1=[];
      for (int a = 0; a < theorycableForce.length; a++) {
        content = DataRow(
            cells: [
          //_value1,
          selectNumber[e],
          theorycableForce[a].toString(),
          //cableDataByTime[a].cableForce.toString(),
          cable[cable.length - 1].toString(),
          cable[0].toString(),
          differencelist[differencelist.length - 1].toString(),
          differencelist[0].toString(),
          errorlist[errorlist.length - 1].toString() + '%',
          errorlist[0].toString() + '%',
        ].map((e) => DataCell(Text(e))).toList());
        setState(() {
          datalist1.add(content);
        });
      }
    }
    //0723新增
    dataLine = [];
    dataLine4 = [];
    contentCharts = [];
    for (int b = 0; b < selectNumber.length; b++) {
      dataLine4 = [];
      dataLine5 = [];
      dataLine6 = [];
      for (int a = 0; a < cableDataByTimelist[b].length; a++) {
        dataLine4.add(SalesData(
            cableDataByTimelist[b][a].sampleTime.toString().substring(0, 13),
            cableDataByTimelist[b][a].cableForce));
      }
      dataLine5 = dataLine4;
      //dataLine7.add(dataLine4);
      contentChart = LineSeries<SalesData, String>(
        name: '实际' + selectNumber[b],
        dataSource: dataLine5,
        xValueMapper: (SalesData sales, _) => sales.year,
        yValueMapper: (SalesData sales, _) => sales.sales,
        markerSettings: MarkerSettings(isVisible: true),
      );
      contentCharts.add(contentChart);
      dataLine = [];
      dataLine4 = [];
      for (int a = 0; a < theorycableForce1[b].length; a++) {
        dataLine4.add(SalesData(
            cableDataByTimelist[b][a].sampleTime.toString().substring(0, 13),
            theorycableForce1[b][a]));
      }
      dataLine6 = dataLine4;
      dataLine8.add(dataLine4);
      contentChart = LineSeries<SalesData, String>(
        name: '理论' + selectNumber[b],
        dataSource: dataLine6,
        xValueMapper: (SalesData sales, _) => sales.year,
        yValueMapper: (SalesData sales, _) => sales.sales,
        markerSettings: MarkerSettings(isVisible: true),
      );
      contentCharts.add(contentChart);
    }
    //0723新增
  }

  getEnvByTime() async {
    WebApi webApi = WebApi.instance;
    //print(starttime);
    //print(endtime);
    /*envByTime = await webApi.getEnvByTimeSlot(cedianNumber, starttime, endtime);
    //print(stressDataByTime);
    theoryData = await webApi.getTheoryData(cedianNumber, sensorType);
    
    if (envByTime.length != 0 && theoryData.length != 0) {
      Fluttertoast.showToast(msg: '获取数据成功');
    }*/
    for (int e = 0; e < cedianNumberlist.length; e++) {
      envByTime = await webApi.getEnvByTimeSlot(
          cedianNumberlist[e], starttime, endtime);
      theoryData = await webApi.getTheoryData(cedianNumberlist[e], sensorType);
      cableDataByTimelist.add(envByTime);
      theoryDatalist.add(theoryData);
    }
    //0723新增
    setState(() {
      pointStylename = '湿度';
      dataColumn = dataColumnhu;
      datalist = [];
      theorycableForce1 = [];
      maxValue = [];
      minValue = [];
      maxdiffValue = [];
      mindiffValue = [];
      maxerrorValue = [];
      minerrorValue = [];
      datalisthu = [];
      datalisthuhu = [];
      maxValuehu = [];
      minValuehu = [];
      maxdiffValuehu = [];
      mindiffValuehu = [];
      maxerrorValuehu = [];
      minerrorValuehu = [];
      theorycableForcehu = [];
      for (int e = 0; e < cedianNumberlist.length; e++) {
        phaseId = [];
        theorycableForce = [];
        errorlist = [];
        differencelist = [];
        datalist1 = []; //0721新增
        for (int a = 0; a < cableDataByTimelist[e].length; a++) {
          time = 0;
          time = DateTime.parse(cableDataByTimelist[e][a].sampleTime)
              .millisecondsSinceEpoch;
          for (int b = 0; b < allPhase.length; b++) {
            startTime = 0;
            endTime = 0;
            if (allPhase[b].startTime != null && allPhase[b].endTime != null) {
              startTime =
                  DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
              endTime =
                  DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
              if (time < endTime && time > startTime) {
                theoryId = 0;
                theoryId = allPhase[b].id;
                phaseId.add(theoryId);
              }
            }
          }
        }
        //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);

        for (int a = 0; a < theoryDatalist[e].length; a++) {
          for (int b = 0; b < phaseId.length; b++) {
            if (theoryDatalist[e][a].phaseId == phaseId[b]) {
              theorycable = 0;
              theorycable = theoryDatalist[e][a].humidity;
              theorycableForce.add(theorycable);
              //theorycableForce1.add(theorycableForce);
            }
          }
        }
        theorycableForce1.add(theorycableForce);
        theorycableForcehu.add(theorycableForce);
        print(1);
        print(theorycableForce);
        //print(theorycableForce1);
        String error1 = '';

        for (int a = 0; a < theorycableForce.length; a++) {
          error = 0;
          error = (cableDataByTimelist[e][a].humidity - theorycableForce[a]) /
              theorycableForce[a];
          error1 = (error * 100).toStringAsFixed(2);
          error = double.parse(error1);
          errorlist.add(error);
          difference = cableDataByTimelist[e][a].humidity - theorycableForce[a];
          differencelist.add(difference);
        }
        print(2);
        print(errorlist);
        for (int a = 0; a < theorycableForce.length; a++) {
          content = DataRow(
              cells: [
            //_value1,
            selectNumber[e],
            cableDataByTimelist[e][a].humidity.toString(),
            theorycableForce[a].toString(),
            errorlist[a].toString() + '%'
          ].map((e) => DataCell(Text(e))).toList());
          setState(() {
            datalist.add(content);
            datalisthu.add(content);
          });
        }
        //特征值分析
        cable = [];
        for (int a = 0; a < cableDataByTimelist[e].length; a++) {
          cable.add(cableDataByTimelist[e][a].humidity);
        }
        cable.sort((a, b) => (a).compareTo(b)); //从小到大排列
        differencelist.sort((a, b) => (a).compareTo(b));
        errorlist.sort((a, b) => (a).compareTo(b));
        print(cable);
        print('11');
        maxValue.add(cable[cable.length - 1]);
        minValue.add(cable[0]);
        maxdiffValue.add(differencelist[differencelist.length - 1]);
        mindiffValue.add(differencelist[0]);
        maxerrorValue.add(errorlist[errorlist.length - 1]);
        minerrorValue.add(errorlist[0]);
        maxValuehu.add(cable[cable.length - 1]);
        minValuehu.add(cable[0]);
        maxdiffValuehu.add(differencelist[differencelist.length - 1]);
        mindiffValuehu.add(differencelist[0]);
        maxerrorValuehu.add(errorlist[errorlist.length - 1]);
        minerrorValuehu.add(errorlist[0]);
        print(maxValue);
        print(minValue);
        //datalist1=[];
        for (int a = 0; a < theorycableForce.length; a++) {
          content = DataRow(
              cells: [
            //_value1,
            selectNumber[e],
            theorycableForce[a].toString(),
            //cableDataByTime[a].cableForce.toString(),
            cable[cable.length - 1].toString(),
            cable[0].toString(),
            differencelist[differencelist.length - 1].toString(),
            differencelist[0].toString(),
            errorlist[errorlist.length - 1].toString() + '%',
            errorlist[0].toString() + '%',
          ].map((e) => DataCell(Text(e))).toList());
          setState(() {
            datalist1.add(content);
            datalisthuhu.add(content);
          });
        }
      }
    });
    //温度
    setState(() {
      pointStylename = '温度';
      dataColumn = dataColumnt;
      datalist = [];
      theorycableForce1 = [];
      maxValue = [];
      minValue = [];
      maxdiffValue = [];
      mindiffValue = [];
      maxerrorValue = [];
      minerrorValue = [];
      datalistte = [];
      datalisttete = [];
      maxValuete = [];
      minValuete = [];
      maxdiffValuete = [];
      mindiffValuete = [];
      maxerrorValuete = [];
      minerrorValuete = [];
      theorycableForcete = [];
      for (int e = 0; e < cedianNumberlist.length; e++) {
        phaseId = [];
        theorycableForce = [];
        errorlist = [];
        differencelist = [];
        datalist1 = []; //0721新增
        for (int a = 0; a < cableDataByTimelist[e].length; a++) {
          time = 0;
          time = DateTime.parse(cableDataByTimelist[e][a].sampleTime)
              .millisecondsSinceEpoch;
          for (int b = 0; b < allPhase.length; b++) {
            startTime = 0;
            endTime = 0;
            if (allPhase[b].startTime != null && allPhase[b].endTime != null) {
              startTime =
                  DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
              endTime =
                  DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
              if (time < endTime && time > startTime) {
                theoryId = 0;
                theoryId = allPhase[b].id;
                phaseId.add(theoryId);
              }
            }
          }
        }
        //theoryData = await webApi.getTheoryData(cedianNumber, sensorType);

        for (int a = 0; a < theoryDatalist[e].length; a++) {
          for (int b = 0; b < phaseId.length; b++) {
            if (theoryDatalist[e][a].phaseId == phaseId[b]) {
              theorycable = 0;
              theorycable = theoryDatalist[e][a].temperature;
              theorycableForce.add(theorycable);
              //theorycableForce1.add(theorycableForce);
            }
          }
        }
        theorycableForce1.add(theorycableForce);
        theorycableForcete.add(theorycableForce);
        print(1);
        print(theorycableForce);
        //print(theorycableForce1);
        String error1 = '';

        /* for (int a = 0; a < theorycableForce.length; a++) {
                                    error = 0;
                                    error = (cableDataByTimelist[e][a].longitudinalOffset - theorycableForce[a]) /
                                    theorycableForce[a];
                                    error1 = (error * 100).toStringAsFixed(2);
                                    error = double.parse(error1);
                                    errorlist.add(error);
                                    difference=cableDataByTimelist[e][a].longitudinalOffset - theorycableForce[a];
                                    differencelist.add(difference);
                                }*/
        print(2);
        print(errorlist);
        for (int a = 0; a < theorycableForce.length; a++) {
          content = DataRow(
              cells: [
            //_value1,
            selectNumber[e],
            cableDataByTimelist[e][a].temperature.toString(),
            //theorycableForce[a].toString(),
            //errorlist[a].toString() + '%'
            '-',
            '-',
          ].map((e) => DataCell(Text(e))).toList());
          setState(() {
            datalist.add(content);
            datalistte.add(content);
          });
        }
        //特征值分析
        cable = [];
        for (int a = 0; a < cableDataByTimelist[e].length; a++) {
          cable.add(cableDataByTimelist[e][a].temperature);
        }
        cable.sort((a, b) => (a).compareTo(b)); //从小到大排列
        differencelist.sort((a, b) => (a).compareTo(b));
        errorlist.sort((a, b) => (a).compareTo(b));
        print(cable);
        print('11');
        maxValue.add(cable[cable.length - 1]);
        minValue.add(cable[0]);
        //maxdiffValue.add(differencelist[differencelist.length-1]);
        //mindiffValue.add(differencelist[0]);
        //maxerrorValue.add(errorlist[errorlist.length-1]);
        //minerrorValue.add(errorlist[0]);
        maxValuete.add(cable[cable.length - 1]);
        minValuete.add(cable[0]);
        print(maxValue);
        print(minValue);
        //datalist1=[];
        for (int a = 0; a < theorycableForce.length; a++) {
          content = DataRow(
              cells: [
            //_value1,
            selectNumber[e],
            '-',
            //theorycableForce[a].toString(),
            //cableDataByTime[a].cableForce.toString(),
            cable[cable.length - 1].toString(),
            cable[0].toString(),
            '-',
            '-',
            '-',
            '-',
            //differencelist[differencelist.length-1].toString(),
            //differencelist[0].toString(),
            //errorlist[errorlist.length-1].toString() + '%',
            //errorlist[0].toString() + '%',
          ].map((e) => DataCell(Text(e))).toList());
          setState(() {
            datalist1.add(content);
            datalisttete.add(content);
          });
        }
      }
    });
    setState(() {
      dataLine = [];
      dataLine4 = [];
      contentCharts = [];
      //
      dropdownText = '请选择';
      dataColumn = dataColumnt;
      datalist = datalistte;
      datalist1 = datalisttete;
      theorycableForce1 = theorycableForcete;
      dataLine8 = [];
      maxValue = maxValuete;
      minValue = minValuete;
      maxdiffValue = maxdiffValuete;
      mindiffValue = mindiffValuete;
      maxerrorValue = maxerrorValuete;
      minerrorValue = minerrorValuete;
      for (int b = 0; b < selectNumber.length; b++) {
        dataLine4 = [];
        dataLine5 = [];
        dataLine6 = [];
        for (int a = 0; a < cableDataByTimelist[b].length; a++) {
          dataLine4.add(SalesData(
              cableDataByTimelist[b][a].sampleTime.toString().substring(0, 13),
              cableDataByTimelist[b][a].temperature));
        }
        dataLine5 = dataLine4;
        //dataLine7.add(dataLine4);
        contentChart = LineSeries<SalesData, String>(
          name: '实际' + selectNumber[b],
          dataSource: dataLine5,
          xValueMapper: (SalesData sales, _) => sales.year,
          yValueMapper: (SalesData sales, _) => sales.sales,
          markerSettings: MarkerSettings(isVisible: true),
        );
        contentCharts.add(contentChart);
      }
    });
    //0723新增
  }

  getAllPhase() async {
    WebApi webApi = WebApi.instance;
    allPhase = await webApi.getAllPhase(oneSubProject.id);
    //print(allPhase);
    //print(DateTime.parse(allPhase[0].startTime));
    //print(DateTime.parse(allPhase[0].endTime));
  }

  getTheoryData() async {
    WebApi webApi = WebApi.instance;
    theoryData = await webApi.getTheoryData(cedianNumber, sensorType);
    /*theorycableForce=[];
    for(int a=0;a<theoryData.length;a++){
      for(int b=0;b<phaseId.length;b++){
        if(theoryData[a].phaseId==phaseId[b]){
          theorycable=0;
          theorycable=theoryData[a].cableForce;
          theorycableForce.add(theorycable);
        }
      }
    }
    print(theorycableForce);*/
    /*for(int a=0;a<cableDataByTime.length;a++){
      for(int b=0;b<allPhase.length;b++){

      }
    }*/
    //print(theorycableForce);
    /*for(int a=0;a<cableDataByTime.length;a++){
      time=0;
      time=DateTime.parse(cableDataByTime[a].sampleTime).millisecondsSinceEpoch;
      for(int b=0;b<allPhase.length;b++){
        startTime=0;
        endTime=0;
        startTime=DateTime.parse(allPhase[b].startTime).millisecondsSinceEpoch;
        endTime=DateTime.parse(allPhase[b].endTime).millisecondsSinceEpoch;
        if(time<endTime&&time>startTime){
          theoryId=0;
          theoryId=allPhase[b].id;
          phaseId.add(theoryId);
        }
        
      }
    }
    print(phaseId);*/
  }

  showAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Container(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: showChecktile())),
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      setState(() {
                        if (sensorType == 2) {
                          getStressDataByTime();
                        } else if (sensorType == 3) {
                          getOffsetDataByTime();
                        } else if (sensorType == 4) {
                          getCableDataByTime();
                        } else if (sensorType == 5) {
                          getEnvByTime();
                        }
                      });

                      Navigator.of(context).pop();
                    },
                    child: Text('确定')),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('取消')),
              ],
            );
          });
        });
  }

  /*List<Widget> showCheck(List checkBool) {
    checklist = [];
    for (int a = 1; a < bianhao.length; a++) {
      check = Container(
        child: CheckboxListTile(
          title: Text(bianhao[a]),
          onChanged: (v) {
            setState(() {
              checkbool = !checkBool[a];
              checkBool.removeAt(a);
              checkBool.insert(a, checkbool);
              print(checkBool);
              //exerciseChooser();
              /*if(checkBool[a]==true){
              print('选择');
            }*/
            });
          },
          value: checkBool[a],
        ),
      );
      /*child: Checkbox(
          value: checkbool, 
          onChanged: (v){
          setState(() {
            checkbool=!checkbool;
            if(checkbool==true){
              print('选择');
            }
          });
        }
          ),*/

      checklist.add(check);
    }
    return checklist;
  }*/

  showChecktile() {
    checklist = [];
    //selectNumber=[];
    for (int a = 1; a < bianhao.length; a++) {
      check = Container(child: StatefulBuilder(builder: (context, setState) {
        return CheckboxListTile(
          title: Text(bianhao[a]),
          onChanged: (v) {
            setState(() {
              /*checkbool = !checkBool[a];
              checkBool.removeAt(a);
              checkBool.insert(a, checkbool);*/
              checkBool[a] = !checkBool[a];
              if (v == true) {
                //print(bianhao[a]);

                selectNumber.add(bianhao[a]);
                for (int b = 0; b < sensorinfo.length; b++) {
                  if (sensorinfo[b].sensorId == bianhao[a]) {
                    cedianNumberlist.add(sensorinfo[b].markId);
                    //theoryNumberlist.add(sensorinfo[b].id);
                    //theoryIdlist.add(sensorinfo[b].installStage);
                    //print(cedianNumber);

                  }
                }
              } else {
                selectNumber.remove(bianhao[a]);
                for (int b = 0; b < sensorinfo.length; b++) {
                  if (sensorinfo[b].sensorId == bianhao[a]) {
                    cedianNumberlist.remove(sensorinfo[b].markId);
                    //theoryNumberlist.remove(sensorinfo[b].id);
                    //theoryIdlist.remove(sensorinfo[b].installStage);
                    //print(cedianNumber);
                  }
                }
              }
              print(cedianNumberlist);
              //print(theoryNumberlist);
              //print(theoryIdlist);
              /*for (int b = 0; b < sensorinfo.length; b++) {
                if (sensorinfo[b].sensorId == bianhao[a]) {
                  cedianNumber = sensorinfo[b].markId;
                  theoryNumber = sensorinfo[b].id;
                  theoryId = sensorinfo[b].installStage;
                  print(cedianNumber);
                }
              }*/
              print(selectNumber);
              //_value1 = bianhao[a];

              //print(cedianNumber);
            });
          },
          value: checkBool[a],
        );
      }));
      checklist.add(check);
      //return checklist;
    }
    /*for (int a = 1; a < bianhao.length; a++){
      check=Container(
        child: RadioListTile(
          //title: Row(children:[SizedBox(width:200),Text(bianhao[a])]),
          title: Text(bianhao[a]),
          value:bianhao[a] , 
          groupValue: groupValue, 
          onChanged:(v){
            setState(() {
              groupValue=v;
              for (int b = 0; b < sensorinfo.length; b++) {
                if (sensorinfo[b].sensorId == bianhao[a]) {
                  cedianNumber = sensorinfo[b].markId;
                  //theoryNumber = sensorinfo[b].id;
                  //theoryId = sensorinfo[b].installStage;
                  print(cedianNumber);
                }
              }
              _value1 = bianhao[a];
            });
            print(groupValue);  //sl-1
            
          }
          ),
      );
      checklist.add(check);
    }*/
    return checklist;
  }
}

class Linesales {
  //int jieduan;
  DateTime jieduan;
  double sale;
  Linesales(this.jieduan, this.sale);
}

class Linesalese {
  //int jieduan;
  String jieduan;
  double sale;
  Linesalese(this.jieduan, this.sale);
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class PointData {
  PointData(this.point, this.sales);

  final String point;
  final double sales;
}

class MyDataTableSource extends DataTableSource {
  MyDataTableSource(this.data, this.sensorType);

  //final List<User> data;
  List data = [];
  int sensorType;
  List newsensorinfo = [];
  String edge = '';
  String offerDir = '';
  //List cedianNumberlist=[];
  //List selectNumber=[];
  bool selected = false;
  @override
  DataRow getRow(int index) {
    if (sensorType == 2) {
      if (index >= data.length) {
        return null;
      }
      return DataRow.byIndex(
        index: index,
        selected: data[index].selected,
        onSelectChanged: (selected) {
          data[index].selected = selected;
          notifyListeners();
          if (selected == true) {
            cedianNumberlist.add(data[index].markId);
            selectNumber.add(data[index].sensorId);
          } else {
            cedianNumberlist.remove(data[index].markId);
            selectNumber.remove(data[index].sensorId);
          }
        },
        cells: [
          /* DataCell(Text('${data[index]['sensorId']}')),
          DataCell(Text('${data[index]['name']}')),
          DataCell(Text('${data[index]['edge']}')),*/
          DataCell(Text('${data[index].sensorId}')),
          DataCell(Text('${data[index].name}')),
          DataCell(Text('${data[index].edge}')),
        ],
      );
    } else if (sensorType == 3) {
      if (index >= data.length) {
        return null;
      }
      return DataRow.byIndex(
        index: index,
        selected: data[index].selected,
        onSelectChanged: (selected) {
          data[index].selected = selected;
          if (selected == true) {
            cedianNumberlist.add(data[index].markId);
            selectNumber.add(data[index].sensorId);
          } else {
            cedianNumberlist.remove(data[index].markId);
            selectNumber.remove(data[index].sensorId);
          }
          print(cedianNumberlist);
          print(selectNumber);
          notifyListeners();
        },
        cells: [
          /*DataCell(Text('${data[index]['sensorId']}')),
          DataCell(Text('${data[index]['name']}')),
          DataCell(Text('${data[index]['offerDir']}')),*/
          DataCell(Text('${data[index].sensorId}')),
          DataCell(Text('${data[index].name}')),
          DataCell(Text('${data[index].offerDir}')),
        ],
      );
    } else if (sensorType == 4) {
      if (index >= data.length) {
        return null;
      }
      return DataRow.byIndex(
        index: index,
        cells: [
          /* DataCell(Text('${data[index]['sensorId']}')),
          DataCell(Text('${data[index]['name']}')),*/
          DataCell(Text('${data[index].sensorId}')),
          DataCell(Text('${data[index].name}')),
        ],
        selected: data[index].selected,
        onSelectChanged: (selected) {
          data[index].selected = selected;
          if (selected == true) {
            cedianNumberlist.add(data[index].markId);
            selectNumber.add(data[index].sensorId);
          } else {
            cedianNumberlist.remove(data[index].markId);
            selectNumber.remove(data[index].sensorId);
          }
          print(cedianNumberlist);
          print(selectNumber);
          notifyListeners();
        },
      );
    } else if (sensorType == 5) {
      if (index >= data.length) {
        return null;
      }
      return DataRow.byIndex(
        index: index,
        selected: data[index].selected,
        onSelectChanged: (selected) {
          data[index].selected = selected;
          if (selected == true) {
            cedianNumberlist.add(data[index].markId);
            selectNumber.add(data[index].sensorId);
          } else {
            cedianNumberlist.remove(data[index].markId);
            selectNumber.remove(data[index].sensorId);
          }
          notifyListeners();
        },
        cells: [
          /*DataCell(Text('${data[index]['sensorId']}')),
          DataCell(Text('${data[index]['name']}')),*/
          DataCell(Text('${data[index].sensorId}')),
          DataCell(Text('${data[index].name}')),
        ],
      );
    }
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
  User(this.sensorId, this.name, this.offerDir, this.edge, this.markId,
      {this.selected = false});

  final String name;
  final String sensorId;
  final String edge;
  final String offerDir;
  final int markId;
  bool selected;
}
