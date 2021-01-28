import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:newjiankong/pdf.dart';
//import 'caozuo.dart';
//import 'zhuce.dart';
//import 'xinzonglan.dart'; 1
//import 'tubiaoceshi.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'dart:io'; //本地文件使用
import 'dart:async'; //异步操作
import 'login.dart';
//import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'erweima.dart';
import 'infodialog.dart';
import 'xindazonglan.dart';
//import 'upload.dart';
import 'pdfone.dart';
import 'camera.dart';
import 'amap.dart';
import 'package:flutter/services.dart' show SystemChannels;
import 'provider.dart';
import 'page.dart';
import 'pageone.dart';

class Denglu extends StatefulWidget {
  Denglu({Key key}) : super(key: key);

  @override
  _DengluState createState() => _DengluState();
}

class _DengluState extends State<Denglu> {
  String path = '';
  /*String _name = 'testZZZZ';
  String _password = 'w12345678';*/
  String _name = 'test';
  String _password = '123456';
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  List allproject = [];
  var wordFiles;
  List subproject = [];
  List subprojectallphaselist = [];
  List allphase = [];
  List allphaselist = [];
  List role = [];
  bool passwordVisible = true;
  String code = '';
  List img = [''];
  String url = '';
  String validCode = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = TextEditingController.fromValue(TextEditingValue(text: _name));
    password =
        TextEditingController.fromValue(TextEditingValue(text: _password));
    code = Random().nextInt(8388608).toString();
    url = 'http://222.72.129.158:1700/api-uaa/validata/code/' + code;
    //var a = Random(10000000000);
    //print(code);
    //takecode(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          //隐藏键盘
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        },
        child: Scaffold(
            appBar: AppBar(title: Text('登录界面')),
            resizeToAvoidBottomPadding: false, //输入框抵住键盘 内容不随键盘滚动
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("lib/images/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('施工监控系统', style: TextStyle(fontSize: 30)),
                  SizedBox(height: 60),
                  /*Container(
             width: 50,
             height: 50,
             child:ClipOval(
               //child:Image.asset('images/qiaoliang.jpg',
               //fit: BoxFit.cover,)
             )
           ),*/
                  /*Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children:[
               /*Container(
                 width:50,
                 child:Text('用户名',
                 textAlign: TextAlign.left,),
               ),
               SizedBox(width: 20,),*/
               Container(
                 width: 150,
                 child:TextField(
                   //controller: TextEditingController(text:'testZZZZ'),
                   controller: name,
                   decoration: InputDecoration(
                     icon:Icon(Icons.people)
                   ),
                   onChanged: (text) {
                //_name = text;
                //print(_name);
              },
                 )
               )
             ]
           ),*/
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextField(
                      //controller: TextEditingController(text:'testZZZZ'),
                      controller: name,
                      decoration: InputDecoration(
                        hintText: '请输入用户名',
                        icon: Icon(Icons.people),
                        //border: InputBorder.none
                      ),
                      onChanged: (text) {
                        //_name = text;
                        //print(_name);
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextField(
                      //controller: TextEditingController(text:'w12345678'),
                      controller: password,
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                          hintText: '请输入密码',
                          icon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          )),
                      onChanged: (text) {
                        //_password= text;
                        //print(_password);
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Row(
                        children: [
                          Flexible(
                              flex: 2,
                              child: Container(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: '请输入验证码',
                                    icon: Icon(Icons.keyboard),
                                  ),
                                  onChanged: (v) {
                                    setState(() {
                                      validCode = v;
                                    });
                                  },
                                ),
                              )),
                          Flexible(
                              flex: 1,
                              child: Container(
                                  child: GestureDetector(
                                child: Image.network(url),
                                onTap: () {
                                  setState(() {
                                    code = Random().nextInt(8388608).toString();
                                    url =
                                        'http://222.72.129.158:1700/api-uaa/validata/code/' +
                                            code;
                                  });
                                },
                              )))
                          /*flex: 1,
                        child: Container(child: Text('aa')))*/
                        ],
                      )),
                  /*Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children:[
               /*Container(
                 width:50,
                 child:Text('密码',
                 textAlign: TextAlign.left,),
               ),
               SizedBox(width: 20,),*/
               Container(
                 width: 150,
                 child:TextField(
                   //controller: TextEditingController(text:'w12345678'),
                   controller: password,
                   obscureText:true,
                   decoration: InputDecoration(
                     icon: Icon(Icons.lock)
                   ),
                   onChanged: (text) {
                //_password= text;
                //print(_password);
              },
                 )
               )
             ]
           ),*/
                  SizedBox(height: 50),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RaisedButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text('登录'),
                        onPressed: () {
                          //_tryLogin(context);
                          print(validCode);
                          _newtryLogin(context);
                          /*Navigator.of(context).push(
                 MaterialPageRoute(builder: (context){
                   //return Caozuo();
                   //return Xinzonglan();

                 })
               );*/
                        }),
                  ),
                  /*Container(
              child: RaisedButton(
                  child: Text('查看'),
                  onPressed: () {
                    look();
                  }),
            ),*/
                  /*Container(
              child: Image(image: img[0]),
            ),*/
                  /*RaisedButton(
              child: Text('地图'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return LocationPage();
                  //return LocationPageone();
                }));
              }),*/
                  SizedBox(height: 60),
                  /*RaisedButton(
             child:Text('照相'),
             onPressed:(){
               Navigator.of(context).push(
                 MaterialPageRoute(builder: (context){
                   return Camera();
                 })
               );
             }
             )*/

                  /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
             children:[
                ClipRRect(
             child:RaisedButton(
               color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
               child: Text('登录'),
             onPressed: (){
               _tryLogin(context);
               /*Navigator.of(context).push(
                 MaterialPageRoute(builder: (context){
                   //return Caozuo();
                   //return Xinzonglan();

                 })
               );*/
             }
             ),
             borderRadius:BorderRadius.circular(10)
           ),

           SizedBox(width:10),
           /*ClipRRect(
             child:RaisedButton(
               color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
               child: Text('注册'),
             onPressed: (){
               Navigator.of(context).push(
                 MaterialPageRoute(builder: (context){
                   return RegisterWidget();
                 })
               );
             }
             ),
             borderRadius:BorderRadius.circular(20)
           )*/
             ]
           ),*/
                  /*RaisedButton(
            child:Text('pdf'),
            onPressed:(){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context){
                  return Pdf();
                })
              );
            }
            ),
            RaisedButton(
            child:Text('pdfone'),
            onPressed:(){
              setState(() {
                var directory1 = Directory('/sdcard/Pictures');
                wordFiles = directory1.listSync();
                print(wordFiles);
              });
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context){
                  return Pdfone(wordFiles:wordFiles);
                })
              );
            }
            ),*/
                  /*RaisedButton(
            child:Text('图表'),
            onPressed:(){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context){
                  return Tubiao();
                })
              );
            }
            ),
          RaisedButton(
            child: Text('下载'),
            onPressed:(){
              downloadFile();

            } ,
            ),
          RaisedButton(
            child: Text('获取地址'),
            onPressed:(){
                _findLocalPath();

            } ,
            ),
           RaisedButton(
            child: Text('上传地址'),
            onPressed:(){
                //fileUpload();
                upload(context);
            } ,
            ),
            RaisedButton(
            child: Text('申请权限'),
            onPressed:(){
                requestPermission();
                //_checkPermission();
            } ,
            ),
            RaisedButton(
            child: Text('二维码'),
            onPressed:(){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context){
                    return Erweima();
                  })
                  );
            } ,
            ),*/
                ],
              ),
            )));
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

  look() {
    //String savePath = await _findLocalPath();
    //String name = 'logo.png';
    //String _localPath = '/sdcard/emulated/0/Pictures' + '/' + 'one.pdf';
    //String _localPath = savePath + '/' + '位移测点数据 (7).xlsx';
    String _localPath =
        '/storage/emulated/0/Android/data/com.example.ditu/files' +
            '/' +
            '位移测点数据 (7).xlsx';
    //String _localPath = '/sdcard/Pictures' + '/' + 'one.pdf';
    //print(_localPath);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      /*return FileReaderPage(
          //filePath: _localPath,
          );*/
      return HomePage();
    }));
    /*Response response = await dio.download(
        "http://222.72.129.158:18101/666/logo.png", _localPath);*/
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
    Response response = await dio.download(
        "http://222.72.129.158:18101/666/logo.png", _localPath);
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
  }
  /*downloadFile1()async{
    WebApiUtils webApi =  WebApiUtils.instance;
    String mark= await webApi.downloadFile("http://192.168.6.166:8101/666/logo.png", "/storage/emulated/o/Pictures");
  }*/
  //上传

  //String localPath="/storage/emulated/o/Pictures/pingnansanqiao.png";
  String localPath = "/storage/emulated/0/Pictures/pingnansanqiao.png";
  //String netUploadUrl="http://192.168.6.166:8101/666";
  //String netUploadUrl="http://222.72.129.158:18101/666";
  //String netUploadUrl="192.168.6.15";
  String netUploadUrl = "http://192.168.6.15:1700/upload/flutterUpload";
  void fileUpload() async {
    Dio dio = Dio();
    //Map<String,dynamic> map=Map();
    //map['auth']="12345";
    /*map['marking']="12345";
    //map['file']=await MultipartFile.fromFile(localPath,filename:"11.png");
    map['file']="569";
    FormData formData=FormData.fromMap(map);*/
    Map<String, dynamic> map = Map();
    map['marking'] = "12345";
    map['file'] = "569";
    //Response response=await dio.post(netUploadUrl,data:formData);
    Response response = await dio.post(netUploadUrl, data: map);
    var data = response.data;
    if (response.statusCode == 200) {
      print('上传成功');
      Fluttertoast.showToast(msg: "上传成功");
    } else {
      print('上传失败');
      Fluttertoast.showToast(msg: "上传失败");
    }
  }

  //post请求发送formdata
  void postFunction() async {
    String url = "";
    Dio dio = Dio();
    Map<String, dynamic> map = Map();
    map['userName'] = "小明";
    map["userAge"] = 44;
    FormData formData = FormData.fromMap(map);
    Response response = await dio.post(url, data: formData);
    var data = response.data;
  }

  //post请求发送json
  void postFunction1() async {
    String url = "";
    Dio dio = Dio();
    Map<String, dynamic> map = Map();
    map['userName'] = "小明";
    map["userAge"] = 44;
    //FormData formData=FormData.fromMap(map);
    Response response = await dio.post(url, data: map);
    var data = response.data;
  }

  //申请权限
  Future requestPermission() async {
    // 申请权限

    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    // PermissionHandler().requestPermissions([PermissionGroup.storage]);

    // 申请结果

    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);

    if (permission == PermissionStatus.granted) {
      Fluttertoast.showToast(msg: "权限申请通过");
    } else {
      Fluttertoast.showToast(msg: "未打开相关权限");
    }
    print(permission);
    print(PermissionStatus.granted);
    print(permissions);
  }

// 申请权限
  Future<bool> _checkPermission() async {
    // 先对所在平台进行判断
    if (Theme.of(context).platform == TargetPlatform.android) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        Map<PermissionGroup, PermissionStatus> permissions =
            await PermissionHandler()
                .requestPermissions([PermissionGroup.storage]);
        if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
          //print("true");
          Fluttertoast.showToast(msg: "权限申请通过");
          return true;
        }
      } else {
        //print("true");
        Fluttertoast.showToast(msg: "权限申请通过");
        return true;
      }
    } else {
      //print("true");
      Fluttertoast.showToast(msg: "权限申请通过");
      return true;
    }
    //print("true");
    Fluttertoast.showToast(msg: "权限申请被拒绝");
    return false;
  }

//上传文件
/*Future<void> upload(BuildContext context) async {

        WebApiUtils webApi =  WebApiUtils.instance;

         await webApi.fileUpload();
  }*/
//登录旧
  /*Future<void> _tryLogin(BuildContext context) async {
    WebApi webApi = WebApi.instance;
    if (_name.isNotEmpty) {
      if (_password.isNotEmpty) {
        WebApi webApi = WebApi.instance;
        //int roleId = await webApi.login(_name, _password);
        List list = await webApi.login(_name, _password);
        //print(list);
        allproject = await webApi.getGeneralProject();
        subprojectallphaselist = [];
        for (int a = 0; a < allproject.length; a++) {
          subproject = await webApi.getSubProject(allproject[a].id);
          //subprojectlist.add(subproject);
          allphaselist = [];
          for (int b = 0; b < subproject.length; b++) {
            allphase = await webApi.getAllPhase(subproject[b].id);
            allphaselist.add(allphase);
          }
          subprojectallphaselist.add(allphaselist);
        }
        //role = await webApi.getrolebyId(list[0]);
        var datetime = DateTime.now();

        if (list[1] != '') {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return Xindazonglan(
                id: list[0],
                allproject: allproject,
                subprojectallphaselist: subprojectallphaselist,
                datetime: datetime,
                role: role);
          }));
        } else {
          //TODO:登陆失败逻辑处理
          await InfoDialog.showWaring(context, "信息", "登陆失败，请重新尝试...");
        }
      } else {
        //TODO:参数检查提醒界面
        await InfoDialog.showWaring(context, "警告", "密码不能为空!");
      }
    } else {
      //TODO:参数检查提醒界面
      await InfoDialog.showWaring(context, "警告", "账号不能为空!");
    }
  }*/

  //登录新
  Future<void> _newtryLogin(BuildContext context) async {
    //List allphaselist = [];
    WebApi webApi = WebApi.instance;
    if (_name.isNotEmpty) {
      if (_password.isNotEmpty) {
        WebApi webApi = WebApi.instance;
        //int roleId = await webApi.login(_name, _password);
        List list =
            await webApi.newlogin(_name, _password, code, validCode, 'app');
        //print(list);
        //role = await webApi.getrolebyId(list[0]);
        allproject = await webApi.getNewGeneralProject();
        var datetime = DateTime.now();
        /*for (int a = 0; a < allproject[0].length; a++) {
          //var content = await webApi.getAllPhase(allproject[0][a]['id']);

          allphaselist.add(content);
        }*/
        for (int a = 0; a < allproject[0].length; a++) {
          subproject =
              await webApi.getNewProjectBridgeInfo(allproject[0][a]['id']);
          //subprojectlist.add(subproject);
          allphaselist = [];
          for (int b = 0; b < subproject[0].length; b++) {
            allphase = await webApi.getNewAllPhase(subproject[0][b]['id']);
            allphaselist.add(allphase);
          }
          subprojectallphaselist.add(allphaselist);
        }
        Provider.of<Counter>(context, listen: false).getallproject(allproject);
        Provider.of<Counter>(context, listen: false)
            .getsubprojectallphaselist(subprojectallphaselist);

        if (list[0]['code'] == 0) {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return Xindazonglan(
                /*allproject: allproject,
                subprojectallphaselist: subprojectallphaselist*/
                );
          }));
          //print('登录成功');
        } else {
          //TODO:登陆失败逻辑处理
          await InfoDialog.showWaring(context, "信息", "登陆失败，请重新尝试...");
        }
      } else {
        //TODO:参数检查提醒界面
        await InfoDialog.showWaring(context, "警告", "密码不能为空!");
      }
    } else {
      //TODO:参数检查提醒界面
      await InfoDialog.showWaring(context, "警告", "账号不能为空!");
    }
  }

  //1105
  takecode(BuildContext context) async {
    WebApi webApi = WebApi.instance;
    img = await webApi.getcode(code);

    //print(ima);
  }

  getGeneralProject() async {
    WebApi webApi = WebApi.instance;
    //int roleId = await webApi.login(_name, _password);
    //List list= await webApi.getGeneralProject();
    allproject = await webApi.getGeneralProject();
    // print(list);
  }

  //0624新增
  Future<String> _findLocalPath1() async {
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
}

/*class PermissionUtil{
     static requestPermiss(callback) async {
         // 请求权限
         Map<PermissionGroup, PermissionStatus> permissions =
         await PermissionHandler()
             .requestPermissions([PermissionGroup.storage]);
         if(permissions[PermissionGroup.storage] == PermissionStatus.storage){
             callback();
         }else{
             print("无存储权限");
         }
         // //校验权限
         // if(permissions[PermissionGroup.camera] != PermissionStatus.camera){
         //   print("无照相权限");
         // }
         // if(permissions[PermissionGroup.location] != PermissionStatus.location){
         //   print("无定位权限");
         // }
     }
     static getStoragePermission(){
         var permission =  PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
         PermissionHandler().requestPermissions(<PermissionGroup>[
             // storage权限
             PermissionGroup.storage,
             // 照相权限
             PermissionGroup.camera,
             // 定位权限
             PermissionGroup.location,
         ]);
     }
 }*/

// import 'package:flutter/material.dart';

// class Denglu extends StatefulWidget {
//   @override
//   _DengluState createState() => _DengluState();
// }

// class _DengluState extends State<Denglu> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('登录界面'),
//       ),
//     );
//   }
// }
