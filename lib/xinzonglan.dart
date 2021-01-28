import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'xinshujuluru.dart';
//import 'xinxiangmujiemian.dart';
import 'login.dart';
//新增
import 'package:path_provider/path_provider.dart';
import 'dart:io'; //本地文件使用
import 'dart:async'; //异步操作
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'newpage.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
/*class Xinzonglan extends StatefulWidget {
  Xinzonglan(
      {Key key, this.projectInfo, this.getSubProject, this.url, this.role})
      : super(key: key);
  List projectInfo = [];
  List getSubProject = [];
  String url = '';
  List role = [];
  @override
  _XinzonglanState createState() => _XinzonglanState(
      this.projectInfo, this.getSubProject, this.url, this.role);
}

class _XinzonglanState extends State<Xinzonglan> {
  List<Widget> list = [];
  var hezi;
  List projectName = ['平南三桥', '通吕河桥', '平南三桥', '平南三桥', '平南三桥', '平南三桥'];
  List projectCondition = ['施工中', '施工中', '施工中', '施工中', '施工中', '施工中'];
  @override
  _XinzonglanState(this.projectInfo, this.getSubProject, this.url, this.role);
  List projectInfo = [];
  List getSubProject = [];
  String url = '';
  String subProjectName = '';
  //int subProjectIndex;
  List pointCount = [];
  var oneProjectId;
  int sensorCount;
  var oneProjectName;
  List wordFiles = [];
  List allPhase = [];
  List role = [];
  List managementByOrgaId = [];
  List orderData = [];
  ScrollController _control;
  bool _isShowTop = false;
  //String urll='/storage/emulated/0/Android/data/com.example.newjiankong/files/logo.png';
  void initState() {
    // TODO: implement initState
    super.initState();
    //print(id);
    //getroleById();
    //print(projectInfo);
    //print(getSubProject);
    _control = ScrollController();
    //监听滚动
    _control.addListener(() {
      if (_control.offset >= 400) {
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
        title: Text(projectInfo[0] ?? ''),
      ),
      body: Container(
          decoration: BoxDecoration(
              /*image: DecorationImage(
             image: NetworkImage('http://img3.redocn.com/tupian/20140816/qianlansejianbiantaobaozhutubeijing_2738921_small.jpg'),
             fit: BoxFit.cover
             )*/
              color: Color.fromRGBO(237, 237, 237, 1)),
          child: Column(children: [
            Expanded(
                child: ListView(
              controller: _control,
              children: xianshi(),
            )),
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
    var content = GestureDetector(
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          margin: EdgeInsets.all(10),
          //width: 300,
          //height:400,
          width: MediaQuery.of(context).size.width - 20,
          child: Column(
            children: <Widget>[
              /*Container(
             margin: EdgeInsets.all(5),
             width:MediaQuery.of(context).size.width-60,
             //width: 200,
             height:100,
             /*child:Image.asset('images/qiaoliang.jpg',
             fit: BoxFit.contain,
             width: 300,
             height: 100,),*/
             child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1587533348612&di=e32581837f7141b59923ba1dc3519ecd&imgtype=0&src=http%3A%2F%2Fwww.juimg.com%2Ftuku%2Fyulantu%2F140107%2F328159-14010H0432146.jpg',
             fit: BoxFit.fill,),
           ),*/
              Text('总项目信息'),
              SizedBox(height: 10),
              Container(
                  //height: 300,
                  margin: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Row(children: [
                        Text('项目名称：'),
                        Text(projectInfo[0] ?? '')
                        //Text(projectInfo[name]??'')
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Text('项目所在地：'),
                        Text(projectInfo[1] ?? '')
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Text('建设单位：'),
                        Text(projectInfo[2] ?? '')
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Text('服务内容：'),
                        Text(projectInfo[3] ?? '')
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Text('项目描述：'),
                        Text(projectInfo[4] ?? '')
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Text('创建时间：'),
                        Text(projectInfo[5] ?? '')
                      ]),
                    ],
                  ))
            ],
          )),
    );
    var content1 = Center(child: Text('各子项目桥梁'));
    for (int a = 0; a < getSubProject.length; a++) {
      subProjectName = '';
      oneProjectId = getSubProject[a].id;
      oneProjectName = getSubProject[a];
      int subProjectIndex = getSubProject[a].name.indexOf('.');
      if (subProjectIndex == -1) {
        subProjectName = getSubProject[a].name;
      } else {
        subProjectName = getSubProject[a].name.substring(0, subProjectIndex);
      }
      //print(subProjectName);
      hezi = GestureDetector(
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white),
              //color: Colors.blue,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              width: 300,
              //height:200,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width - 60,
                    //width: 200,
                    //height:100,
                    /*child:Image.asset('images/qiaoliang.jpg',
             fit: BoxFit.contain,
             width: 300,
             height: 100,),*/
                    //child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1587533348612&di=e32581837f7141b59923ba1dc3519ecd&imgtype=0&src=http%3A%2F%2Fwww.juimg.com%2Ftuku%2Fyulantu%2F140107%2F328159-14010H0432146.jpg',
                    //child:Image.file(File(url),  //0715改
                    //child: Image.network('http://192.168.6.166:8101/GeneralProjDatum/AE132255F5E0102A691205F83FE7DD87D77C.png',
                    child: Image.network(
                      'http://222.72.129.158:18101/GeneralProjDatum/AE132255F5E0102A691205F83FE7DD87D77C.png',
                      //child: Image.asset('images/pingnansanqiao.png',
                      fit: BoxFit.fill,
                    ),
                  ),

                  //SizedBox(height:5),
                  Container(
                      //height: 60,
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          Row(children: [
                            Text('项目名称：'),
                            //Text(projectName[a])
                            //Text(getSubProject[a].name)
                            Text(subProjectName)
                          ]),
                          //SizedBox(height:10),
                          /*Row(
             children:[
               Text('当前工况：'),
               Text(projectCondition[a])
             ]
           ),*/
                        ],
                      ))
                ],
              )),
          onTap: () {
            int subProjectIndex = getSubProject[a].name.indexOf('.');
            subProjectName =
                getSubProject[a].name.substring(0, subProjectIndex);
            oneProjectId = getSubProject[a].id;
            oneProjectName = getSubProject[a];
            print(subProjectName);
            getSensorCountByType();

            /*Navigator.of(context).push(
         MaterialPageRoute(builder: (context){
           //return Xinxiangmu(projectName: projectName[a],getSubProject: getSubProject,);
           return Xinxiangmu(projectName: subProjectName,oneSubProject: getSubProject[a],);
         })
         
         );*/
          });

      list.add(hezi);
    }
    list.insert(0, content);
    list.insert(1, content1);
    return list;
  }

  getSensorCountByType() async {
    pointCount = [];
    WebApi webApi = WebApi.instance;
    for (int a = 2; a <= 5; a++) {
      sensorCount = await webApi.getSensorCountByType(oneProjectId, a);
      pointCount.add(sensorCount);
    }
    print(pointCount);
    //0630
    allPhase = await webApi.getAllPhase(oneProjectId);
    //0702
    //managementByOrgaId=await webApi.getManagementByOrgaId(oneProjectId, 1000, 0, role[2], true);
    managementByOrgaId = await webApi.getManagement(oneProjectId, 1000, 0);
    var datetime = DateTime.now();
    //0930
    List sensorinfo = [];
    List sensorinfotwo = [];
    List sensorinfothree = [];
    List sensorinfofour = [];
    List sensorinfofive = [];
    sensorinfotwo = [];
    sensorinfothree = [];
    sensorinfofour = [];
    sensorinfofive = [];
    sensorinfotwo = await webApi.getSensorInfo(oneProjectName.id, 2, 5, 0);
    sensorinfothree = await webApi.getSensorInfo(oneProjectName.id, 3, 5, 0);
    sensorinfofour = await webApi.getSensorInfo(oneProjectName.id, 4, 5, 0);
    sensorinfofive = await webApi.getSensorInfo(oneProjectName.id, 5, 5, 0);
    //allPhase = await webApi.getAllPhase(oneSubProject.id);

    sensorinfo.addAll(sensorinfotwo);
    sensorinfo.addAll(sensorinfothree);
    sensorinfo.addAll(sensorinfofour);
    sensorinfo.addAll(sensorinfofive);
    //print(sensorinfo);
    //_findLocalPath();  0624改
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      //return Xinxiangmu(projectName: projectName[a],getSubProject: getSubProject,);
      //return Xinxiangmu(projectName: subProjectName,oneSubProject: oneProjectName,pointCount: pointCount,);
      //0624新增
      //var directory1 = Directory('/sdcard/Pictures');
      /*var directory1 = Directory('/storage/emulated/0/Pictures');
            wordFiles = directory1.listSync();*/
      wordFiles = []; //0730
      //print(wordFiles);

      return Newpage(
          projectName: subProjectName,
          pointCount: pointCount,
          oneSubProject: oneProjectName,
          wordFiles: wordFiles,
          datetime: datetime,
          allPhase: allPhase,
          managementByOrgaId: managementByOrgaId,
          url: url,
          projectInfo: projectInfo,
          sensorinfo: sensorinfo);
    }));
  }

  /*Future<String> _findLocalPath() async {
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
  }*/
  /*downloadFile() async {
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
    String savePath=await _findLocalPath();
    String name='logo.png';
    String _localPath = savePath +'/' +name;
    Response response = await dio.download(
          "http://192.168.6.166:8101/GeneralProjDatum/AE132255F5E0102A691205F83FE7DD87D77C.png", _localPath);
        //"http://192.168.6.166:8101/666/logo.png", "/storage/emulated/0/logo.png");
        //"https://123.sogou.com/", "/storage/emulated/0/xx.html");
        //"http://img1.imgtn.bdimg.com/it/u=1999762826,3928299957&fm=26&gp=0.jpg", "/storage/emulated/0/qiaoliang.jpg");
    if (response.statusCode == 200) {
      print('下载请求成功');
      Fluttertoast.showToast(msg: "下载成功");
    }else{
      print('下载请求失败');
      Fluttertoast.showToast(msg: "下载失败");
    }
    setState(() {
      url=savePath+'/'+name;
      print(url);
    });
  }*/

  Future<String> _findLocalPath() async {
    // 因为Apple没有外置存储，所以第一步我们需要先对所在平台进行判断
    // 如果是android，使用getExternalStorageDirectory
    // 如果是iOS，使用getApplicationSupportDirectory
    final directory = Theme.of(context).platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();
    String path = directory.path;
    //print(directory.path);
    print(path);
    Fluttertoast.showToast(msg: path);
    //return directory.path;

    var directory1 = Directory(path);
    wordFiles = directory1.listSync();
    print(wordFiles);
  }
}*/

class Xinzonglan extends StatefulWidget {
  Xinzonglan({Key key, this.projectInfo, this.bridgeInfo, this.imgurl})
      : super(key: key);
  List projectInfo = [];
  List bridgeInfo = [];
  String imgurl = '';
  @override
  _XinzonglanState createState() =>
      _XinzonglanState(this.projectInfo, this.bridgeInfo, this.imgurl);
}

class _XinzonglanState extends State<Xinzonglan> {
  _XinzonglanState(this.projectInfo, this.bridgeInfo, this.imgurl);
  bool _isShowTop = false;
  List projectInfo = [];
  ScrollController _control;
  String imgurl = '';
  List<Widget> list = [];
  List bridgeInfo = [];
  int bridgeId;
  var hezi;
  int oneProjectId;
  String oneProjectName = '';
  List oneProjectArtifacts = [];
  List projectPoint = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _control = ScrollController();
    //监听滚动
    _control.addListener(() {
      if (_control.offset >= 400) {
        setState(() {
          _isShowTop = true;
        });
      } else {
        setState(() {
          _isShowTop = false;
        });
      }
    });
    projectInfo = Provider.of<Counter>(context, listen: false).projectInfo;
    bridgeInfo = Provider.of<Counter>(context, listen: false).bridgeInfo;
    imgurl = Provider.of<Counter>(context, listen: false).imgurl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            title: Text(projectInfo[0]['name'] ?? ''),
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
            )),
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
    list = [];
    var content = GestureDetector(
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          margin: EdgeInsets.all(10),
          //width: 300,
          //height:400,
          width: MediaQuery.of(context).size.width - 20,
          child: Column(
            children: <Widget>[
              Text('总项目信息'),
              SizedBox(height: 10),
              Container(
                  //height: 300,
                  margin: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Row(children: [
                        Text('项目名称：'),
                        Text(projectInfo[0]['name'] ?? '')
                        //Text(projectInfo[name]??'')
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Text('项目所在地：'),
                        Text(projectInfo[0]['location'] ?? '')
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Text('建设单位：'),
                        Text(projectInfo[0]['company'] ?? '')
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Text('服务内容：'),
                        Text(projectInfo[0]['service'] ?? '')
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Text('项目描述：'),
                        Text(projectInfo[0]['description'] ?? '')
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Text('创建时间：'),
                        Text(projectInfo[0]['time'] ?? '')
                      ]),
                    ],
                  ))
            ],
          )),
    );
    var content1 = Center(child: Text('各子项目桥梁'));
    for (int a = 0; a < bridgeInfo[0].length; a++) {
      //subProjectName = '';
      //oneProjectId = getSubProject[a].id;
      //oneProjectName = getSubProject[a];
      //int subProjectIndex = getSubProject[a].name.indexOf('.');
      /*if (subProjectIndex == -1) {
        subProjectName = getSubProject[a].name;
      } else {
        subProjectName = getSubProject[a].name.substring(0, subProjectIndex);
      }*/
      //print(subProjectName);
      hezi = GestureDetector(
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white),
              //color: Colors.blue,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              width: 300,
              //height:200,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    //width: MediaQuery.of(context).size.width - 60,
                    child: Image.network(
                      imgurl,
                      fit: BoxFit.fill,
                    ),
                  ),

                  //SizedBox(height:5),
                  Container(
                      //height: 60,
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          Row(children: [
                            Text('桥梁名称：'),
                            Text(bridgeInfo[0][a]['name'])
                          ]),
                        ],
                      ))
                ],
              )),
          onTap: () {
            /*int subProjectIndex = bridgeInfo[0][a].name.indexOf('.');
            subProjectName =
                getSubProject[a].name.substring(0, subProjectIndex);*/
            oneProjectId = bridgeInfo[0][a]['id'];
            oneProjectName = bridgeInfo[0][a]['name'];
            //print(subProjectName);
            //getSensorCountByType();
            getNewSubProject(oneProjectId);
            /*Navigator.of(context).push(
         MaterialPageRoute(builder: (context){
           //return Xinxiangmu(projectName: projectName[a],getSubProject: getSubProject,);
           return Xinxiangmu(projectName: subProjectName,oneSubProject: getSubProject[a],);
         })
         
         );*/
          });

      list.add(hezi);
    }
    list.insert(0, content);
    list.insert(1, content1);
    return list;
  }

  getNewSubProject(int id) async {
    WebApi webApi = WebApi.instance;
    //oneProjectArtifacts = await webApi.getNewSubProject(id);getNewSensorInfo
    //projectPoint = await webApi.getNewSensorInfo(id,);
    /*print(imgurl);
    print(imgurl.runtimeType);*/
    var pointone = await webApi.getNewSensorInfo(id, 2);
    var pointtwo = await webApi.getNewSensorInfo(id, 3);
    var pointthree = await webApi.getNewSensorInfo(id, 4);
    var pointfour = await webApi.getNewSensorInfo(id, 5);
    projectPoint.add(pointone);
    projectPoint.add(pointtwo);
    projectPoint.add(pointthree);
    projectPoint.add(pointfour);
    List sensorone = [];
    List sensortwo = [];
    List sensorthree = [];
    List sensorfour = [];
    List sensor = [];
    for (int a = 0; a < projectPoint.length; a++) {
      for (int b = 0; b < projectPoint[a].length; b++) {
        sensorone =
            await webApi.getNewSensorInfoByMarkId(projectPoint[a][b]['id']);
        sensor.addAll(sensorone);
      }
    }
    //print(sensor.length);
    //print(sensor[0]);
    var allphase = await webApi.getNewAllPhase(id);
    var wordFiles = await webApi.getNewPageFiles();

    Provider.of<Counter>(context, listen: false).getwordFiles(wordFiles);
    Provider.of<Counter>(context, listen: false)
        .getoneProjectName(oneProjectName);
    Provider.of<Counter>(context, listen: false).getsubprojectId(id);
    Provider.of<Counter>(context, listen: false).getprojectPoint(projectPoint);
    Provider.of<Counter>(context, listen: false).getallphase(allphase);
    Provider.of<Counter>(context, listen: false).getsensor(sensor);

    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Newpage(
          /*imgurl: imgurl,
        oneProjectName: oneProjectName,
        subprojectId: id,
        projectPoint: projectPoint,
        allphase: allphase,
        wordFiles: wordFiles,
        sensor: sensor,*/
          );
    }));
  }
}
