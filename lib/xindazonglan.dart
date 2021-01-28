import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'xinshujuluru.dart';
//import 'xinxiangmujiemian.dart';
import 'login.dart';
import 'xinzonglan.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:io'; //本地文件使用
import 'dart:async'; //异步操作
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'provider.dart';

/*class Xindazonglan extends StatefulWidget {
  Xindazonglan(
      {Key key,
      this.id,
      this.allproject,
      this.subprojectallphaselist,
      this.datetime,
      this.role})
      : super(key: key);
  int id;
  List allproject;
  List subprojectallphaselist = [];
  var datetime;
  List role = [];
  @override
  _XindazonglanState createState() => _XindazonglanState(this.id,
      this.allproject, this.subprojectallphaselist, this.datetime, this.role);
}

class _XindazonglanState extends State<Xindazonglan> {
  //List<GestureDetector> list=[];
  List<Widget> list = [];
  var hezi;
  List projectName = ['平南三桥', '通吕河桥', '平南三桥', '平南三桥', '平南三桥', '平南三桥'];
  List projectCondition = ['施工中', '施工中', '施工中', '施工中', '施工中', '施工中'];
  List allproject = [];
  List allprojectInfo = [];
  int projectid;
  int totalnumber;
  @override
  _XindazonglanState(this.id, this.allproject, this.subprojectallphaselist,
      this.datetime, this.role);
  int id;
  List getsubproject = [];
  String url =
      '/storage/emulated/0/Android/data/com.example.newjiankong/files/logo.png';
  List subprojectallphaselist = [];
  var datetime;
  List workProject = [];
  int workNumber = 0;
  int worknumber = 0;
  List role = [];
  ScrollController _control;
  bool _isShowTop = false;
  void initState() {
    // TODO: implement initState
    super.initState();
    /*print(subprojectallphaselist[0][0].length);
    print(subprojectallphaselist[1][0].length);
    print(subprojectallphaselist[2][0].length);
    print(subprojectallphaselist[2][1].length);
    print(subprojectallphaselist[3][0].length);*/

    //getprojectwork();
    //print(MediaQuery.of(context).size.height.toString());
    _control = ScrollController();
    //监听滚动
    _control.addListener(() {
      if (_control.offset >= 500) {
        setState(() {
          _isShowTop = true;
        });
      } else {
        setState(() {
          _isShowTop = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('项目管理'),
      ),
      body: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(237, 237, 237, 1)),
          child: Column(children: [
            Expanded(
                child: ListView(
              controller: _control,
              children: xianshi(),
            ))
          ])),
      floatingActionButton: _isShowTop
          ? FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _control.animateTo(0,
                    duration: Duration(milliseconds: 1000), curve: Curves.ease);
              },
            )
          : null,
    );
  }

  xianshi() {
    var content = Container(
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 20,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(children: [
          Text('总项目数：'),
          Text(allproject.length.toString()),
        ]),
        //SizedBox(width: 30,),
        Row(children: [
          Text('已完成数：'),
          //Text((allproject.length - workNumber).toString()),
          Text(''),
        ]),
        //SizedBox(width: 30,),
        Row(children: [
          Text('正在施工数：'),
          //Text(workNumber.toString()),
          Text(''),
        ])
        //SizedBox(width: 30,),
      ]),
    );
    for (int a = 0; a < allproject.length; a++) {
      hezi = GestureDetector(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              width: 300,
              //height:200,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    //width:MediaQuery.of(context).size.width-60,
                    //width: 200,
                    //height:100,
                    /*child:Image.asset('images/qiaoliang.jpg',
             fit: BoxFit.contain,
             width: 300,
             height: 100,),*/
                    child: Image.network(
                      allproject[a]['symbol'],
                      fit: BoxFit.fill,
                    ),
                  ),

                  //SizedBox(height:10),
                  Container(
                      //height: 60,
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          Row(children: [
                            Text('项目名称：'),
                            //Text(allproject[1][a])
                            Text(allproject[a]['name'])
                          ]),
                          //SizedBox(height:10),
                          /*Row(
             children:[
               Text('当前工况：'),
               Text(projectCondition[a])
             ]
           ),*/
                        ],
                      )),
                ],
              )),
          onTap: () {
            /*projectid = allproject[a].id;
            print(projectid);
            getGeneralProjectinfo();*/
          });

      list.add(hezi);
    }
    list.insert(0, content);
    return list;
  }

  /*getroleById()async{
       WebApi webApi =  WebApi.instance;
        //int roleId = await webApi.login(_name, _password);
        List list= await webApi.getrolebyId(id);
        print(list);
  }*/

  /*getGeneralProject()async{
    WebApi webApi =  WebApi.instance;
        //int roleId = await webApi.login(_name, _password);
        //List list= await webApi.getGeneralProject();
        allproject=await webApi.getGeneralProject();
       // print(list);
  }*/

  getGeneralProjectinfo() async {
    WebApi webApi = WebApi.instance;
    allprojectInfo = await webApi.getGeneralProjectInfo(projectid);

    getsubproject = await webApi.getSubProject(projectid);

    //downloadFile();
    //print(allprojectInfo);
    if (allprojectInfo.length > 0) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //return Xinxiangmu(projectName: projectName[a],);
        return Xinzonglan(
            projectInfo: allprojectInfo,
            getSubProject: getsubproject,
            url: url,
            role: role);
      }));
    }
  }

  Future<String> _findLocalPath() async {
    // 因为Apple没有外置存储，所以第一步我们需要先对所在平台进行判断
    // 如果是android，使用getExternalStorageDirectory
    // 如果是iOS，使用getApplicationSupportDirectory
    final directory = Theme.of(context).platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();
    //path=directory.path;
    print(directory.path);
    Fluttertoast.showToast(msg: directory.path);
    return directory.path;
  }

  downloadFile() async {
    Dio dio = Dio();
//    dio.options.baseUrl = "https://123.sogou.com";
    //设置连接超时时间
    dio.options.connectTimeout = 10000;
    //设置数据接收超时时间
    dio.options.receiveTimeout = 10000;
//    await dio.download(
//        "https://raw.githubusercontent.com/xuelongqy/flutter_easyrefresh/master/art/pkg/EasyRefresh.apk",
//        "/storage/emulated/0/AAAAAA.apk");
    //String _localPath = path + '/Download';
    String savePath = await _findLocalPath();
    String name = 'logo.png';
    String _localPath = savePath + '/' + name;
    print(_localPath);
    Response response = await dio.download(
        "http://192.168.6.166:8101/GeneralProjDatum/AE132255F5E0102A691205F83FE7DD87D77C.png",
        _localPath);
    //"http://192.168.6.166:8101/666/logo.png", "/storage/emulated/0/logo.png");
    //"https://123.sogou.com/", "/storage/emulated/0/xx.html");
    //"http://img1.imgtn.bdimg.com/it/u=1999762826,3928299957&fm=26&gp=0.jpg", "/storage/emulated/0/qiaoliang.jpg");
    if (response.statusCode == 200) {
      print('下载请求成功');
      Fluttertoast.showToast(msg: "下载成功");
    } else {
      print('下载请求失败');
      Fluttertoast.showToast(msg: "下载失败");
    }
    setState(() {
      url = savePath + '/' + name;
      print(url);
    });
  }

  //0702
  getprojectwork() {
    /*for(int a=0;a<allPhase.length;a++){
       if(DateTime.parse(allPhase[a].startTime).millisecondsSinceEpoch<datetime.millisecondsSinceEpoch && DateTime.parse(allPhase[a].endTime).millisecondsSinceEpoch>datetime.millisecondsSinceEpoch){
         /*stageContent.add(allPhase[a].name);
         stageContent.add(allPhase[a].startTime);
         stageContent.add(allPhase[a].endTime);*/
         int b=allPhase[a].startTime.toString().indexOf('T');
         String starttime=allPhase[a].startTime.toString().substring(0,b);
         String endtime=allPhase[a].endTime.toString().substring(0,b);
         var content=DataRow(cells: [allPhase[a].name,starttime,endtime,].map((e) => DataCell(Text(e))).toList());
         stageContent.add(content);
       }
      }*/
    List workNumberlist = [];
    for (int a = 0; a < subprojectallphaselist.length; a++) {
      worknumber = 0;
      workNumberlist = [];
      if (subprojectallphaselist[a].length != 0) {
        for (int b = 0; b < subprojectallphaselist[a].length; b++) {
          if (subprojectallphaselist[a][b].length != 0) {
            worknumber = 0;
            for (int c = 0; c < subprojectallphaselist[a][b].length; c++) {
              if (subprojectallphaselist[a][b][c].endTime != null) {
                if (DateTime.parse(subprojectallphaselist[a][b][c].endTime)
                        .millisecondsSinceEpoch >
                    datetime.millisecondsSinceEpoch) {
                  worknumber = worknumber + 1;
                  //workNumberlist.add(worknumber);
                  break;
                  //workProject[a]=1;
                }
                /*else{
              worknumber=0;
              workNumberlist.add(worknumber);
            }*/
              }
            }
            workNumberlist.add(worknumber);
          }
        }
        //workProject.add(workNumber);
        workProject.add(workNumberlist);
      }
      /*for (int b = 0; b < subprojectallphaselist[a].length; b++) {
        if (subprojectallphaselist[a][b].length != 0) {
          worknumber = 0;
          for (int c = 0; c < subprojectallphaselist[a][b].length; c++) {
            if (DateTime.parse(subprojectallphaselist[a][b][c].endTime)
                    .millisecondsSinceEpoch >
                datetime.millisecondsSinceEpoch) {
              worknumber = worknumber + 1;
              //workNumberlist.add(worknumber);
              break;
              //workProject[a]=1;
            }
            /*else{
              worknumber=0;
              workNumberlist.add(worknumber);
            }*/

          }
          workNumberlist.add(worknumber);
        }
      }
      //workProject.add(workNumber);
      workProject.add(workNumberlist);*/
    }
    //print(workProject);
    for (int a = 0; a < workProject.length; a++) {
      for (int b = 0; b < workProject[a].length; b++) {
        if (workProject[a][b] == 1) {
          workNumber = workNumber + 1;
          break;
        }
      }
      /*if(workProject[a]==0){
        workNumber=workNumber+1;
      }*/

    }
    print(workNumber);
  }
}*/

class Xindazonglan extends StatefulWidget {
  Xindazonglan({Key key, this.allproject, this.subprojectallphaselist})
      : super(key: key);
  List allproject = [];
  List subprojectallphaselist = [];
  @override
  _XindazonglanState createState() =>
      _XindazonglanState(this.allproject, this.subprojectallphaselist);
}

class _XindazonglanState extends State<Xindazonglan> {
  _XindazonglanState(this.allproject, this.subprojectallphaselist);
  ScrollController _control;
  bool _isShowTop = false;
  List<Widget> list = [];
  var hezi;
  List allproject = [];
  List subprojectallphaselist = [];
  int projectid;
  List allprojectInfo = [];
  String imgurl = '';
  var datetime;
  List workProject = [];
  int workNumber = 0;
  int worknumber = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _control = ScrollController();
    //监听滚动
    _control.addListener(() {
      if (_control.offset >= 500) {
        setState(() {
          _isShowTop = true;
        });
      } else {
        setState(() {
          _isShowTop = false;
        });
      }
    });
    //print(allproject.length);
    //print(allproject[0].length);
    allproject = Provider.of<Counter>(context, listen: false).allproject;
    subprojectallphaselist =
        Provider.of<Counter>(context, listen: false).subprojectallphaselist;
    datetime = DateTime.now();
    getprojectwork();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            title: Text('项目管理'),
          ),
          preferredSize: Size.fromHeight(30)),
      body: Container(
           decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("lib/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            Expanded(
                child: ListView(
              controller: _control,
              children: xianshi(),
            ))
          ])),
      floatingActionButton: _isShowTop
          ? FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _control.animateTo(0,
                    duration: Duration(milliseconds: 1000), curve: Curves.ease);
              },
            )
          : null,
    );
  }

  xianshi() {
    var content = Container(
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        //height: 20,
        child: Container(
          margin: EdgeInsets.all(2),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Row(children: [
              Text('总项目数：'),
              Text(allproject.length.toString()),
            ]),
            //SizedBox(width: 30,),
            Row(children: [
              Text('已完成数：'),
              Text((allproject[0].length - workNumber).toString()),
              //Text(''),
            ]),
            //SizedBox(width: 30,),
            Row(children: [
              Text('正在施工数：'),
              Text(workNumber.toString()),
              //Text(''),
            ])
            //SizedBox(width: 30,),
          ]),
        ));
    for (int a = 0; a < allproject[0].length; a++) {
      hezi = GestureDetector(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              width: 300,
              //height:200,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    //width:MediaQuery.of(context).size.width-60,
                    //width: 200,
                    //height:100,
                    /*child:Image.asset('images/qiaoliang.jpg',
             fit: BoxFit.contain,
             width: 300,
             height: 100,),*/
                    child: Image.network(
                      allproject[0][a]['symbol'],
                      fit: BoxFit.fill,
                    ),
                  ),

                  //SizedBox(height:10),
                  Container(
                      //height: 60,
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          Row(children: [
                            Text('项目名称：'),
                            //Text(allproject[1][a])
                            Text(allproject[0][a]['name'])
                          ]),
                          //SizedBox(height:10),
                          /*Row(
             children:[
               Text('当前工况：'),
               Text(projectCondition[a])
             ]
           ),*/
                        ],
                      )),
                ],
              )),
          onTap: () {
            projectid = allproject[0][a]['id'];
            imgurl = allproject[0][a]['symbol'];
            //print(projectid);
            print(imgurl);
            getNewGeneralProjectinfo();
          });

      list.add(hezi);
    }
    list.insert(0, content);
    return list;
  }

  getNewGeneralProjectinfo() async {
    WebApi webApi = WebApi.instance;
    allprojectInfo = await webApi.getNewGeneralProjectInfo(projectid);
    var bridgeinfo = await webApi.getNewProjectBridgeInfo(projectid);
    //getsubproject = await webApi.getSubProject(projectid);

    //downloadFile();
    //print(allprojectInfo);
    Provider.of<Counter>(context, listen: false).getprojectInfo(allprojectInfo);
    Provider.of<Counter>(context, listen: false).getbridgeInfo(bridgeinfo);
    Provider.of<Counter>(context, listen: false).getimgurl(imgurl);
    if (allprojectInfo.length > 0) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //return Xinxiangmu(projectName: projectName[a],);
        return Xinzonglan(
            /*projectInfo: allprojectInfo,
          bridgeInfo: bridgeinfo,
          imgurl: imgurl,*/
            );
      }));
    }
  }

  getprojectwork() {
    List workNumberlist = [];
    for (int a = 0; a < subprojectallphaselist.length; a++) {
      worknumber = 0;
      workNumberlist = [];
      if (subprojectallphaselist[a].length != 0) {
        for (int b = 0; b < subprojectallphaselist[a].length; b++) {
          if (subprojectallphaselist[a][b].length != 0) {
            worknumber = 0;
            for (int c = 0; c < subprojectallphaselist[a][b].length; c++) {
              if (subprojectallphaselist[a][b][c]['endTime'] != null) {
                if (DateTime.parse(subprojectallphaselist[a][b][c]['endTime'])
                        .millisecondsSinceEpoch >
                    datetime.millisecondsSinceEpoch) {
                  worknumber = worknumber + 1;

                  break;
                }
              }
            }
            workNumberlist.add(worknumber);
          }
        }

        workProject.add(workNumberlist);
      }
    }

    for (int a = 0; a < workProject.length; a++) {
      for (int b = 0; b < workProject[a].length; b++) {
        if (workProject[a][b] == 1) {
          workNumber = workNumber + 1;
          break;
        }
      }
    }
    print(workNumber);
  }
}
