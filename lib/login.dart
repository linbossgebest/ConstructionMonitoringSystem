import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io'; //本地文件使用
import 'dart:async'; //异步操作
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:newjiankong/model/getrolebyId.dart';
/*import 'model/login.dart';
import 'model/login-role.dart';*/
import 'model/rolebyId.dart';
import 'model/rolebyId-role.dart';
import 'model/generalProject.dart';
import 'model/generalProject-role.dart';
import 'model/generalProjectInfo.dart';
import 'model/generalProjectInfo-role.dart';
import 'model/subProject.dart';
import 'model/subProject-role.dart';
import 'model/sensorInfo.dart';
import 'model/sensorInfo-role.dart';
import 'model/sensorCountByType.dart';
import 'model/sensorCountByType-role.dart';
import 'model/stressDataByTime.dart';
import 'model/stressDataByTime-role.dart';
import 'model/offsetDataByTime.dart';
import 'model/offsetDataByTime-role.dart';
import 'model/cableDataByTime.dart';
import 'model/cableDataByTime-role.dart';
import 'model/envByTime.dart';
import 'model/envByTime-role.dart';
import 'model/allPhase.dart';
import 'model/allPhase-role.dart';
import 'model/theoryData.dart';
import 'model/theoryData-role.dart';
import 'model/managementByOrgaId.dart';
import 'model/managementByOrgaId-role.dart';
import 'denglu.dart';
import 'model/management.dart';
import 'model/management-role.dart';
import 'model/orderData.dart';
import 'model/orderData-role.dart';

import 'newmodel/login.dart';
import 'newmodel/login-role.dart';
//import 'package:flutter_easyloading/flutter_easyloading.dart';

/*class WebApiUtils {

  factory WebApiUtils()=>_getInstance();
  static WebApiUtils get instance => _getInstance();
  static WebApiUtils _instance;

  WebApiUtils._internal() {
    //this._url = "http://222.72.129.158:11700";
    //this._url = "http://192.168.6.15:1700";
    //_url = "http://222.72.129.158:11700";
    this._url = "http://222.72.129.158:11700";
    Map<String, dynamic> headers = {"accessToken": ""};
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: _url, responseType: ResponseType.plain, headers: headers);
    _dio = Dio(baseOptions);
  }

  static WebApiUtils _getInstance() {
    if (_instance == null) {
      _instance = new WebApiUtils._internal();
    }

    return _instance;
  }

  //static Dio _dio;     //加了static
  //static String _url;  //加了static
  //新增
   Dio _dio;
   String _url;
  String token='';
  String getUrl() {
    return _url;
  }

  /*Future<String> fileUpload() async {

    try {

      //String localPath="/storage/emulated/0/Pictures/pingnansanqiao.png";
      String localPath="/storage/emulated/0/Pictures/监控手机端开发文档.docx";
      //Dio dio =Dio();
    Map<String,dynamic> map=Map();

    //map['auth']="12345";
    map['marking']="12345";
    map['file']=await MultipartFile.fromFile(localPath,filename:"11.png");
    //map['file']="569";
    FormData formData=FormData.fromMap(map);
    Response response=await _dio.post("/upload/flutterUpload",data:formData);
    //Response response=await _dio.post("/upload/flutterUpload",data:map);
    var data=response.data;
    if (response.statusCode == 200) {
      print('上传成功');
      Fluttertoast.showToast(msg: "上传成功");
    }else{
      print('上传失败');
      Fluttertoast.showToast(msg: "上传失败");
    }

    } on DioError catch (err) {

    }

  }*/
  Future<String> fileUpload(String localPath) async {

    try {

      //String localPath="/storage/emulated/0/Pictures/pingnansanqiao.png";
      //String localPath="/storage/emulated/0/Pictures/监控手机端开发文档.docx";
      //Dio dio =Dio();
      String filename='';
      int a=localPath.lastIndexOf('/');
      int b=localPath.length;
      filename=localPath.substring(a+1,b);
      print(filename);
    Map<String,dynamic> map=Map();

    //map['auth']="12345";
    map['marking']="12345";
    //map['file']=await MultipartFile.fromFile(localPath,filename:"11.png");   //0624改
    map['file']=await MultipartFile.fromFile(localPath,filename:filename);
    //map['file']="569";
    FormData formData=FormData.fromMap(map);
    Response response=await _dio.post("/upload/flutterUpload",data:formData);
    //Response response=await _dio.post("/upload/flutterUpload",data:map);
    var data=response.data;
    if (response.statusCode == 200) {
      print('上传成功');
      Fluttertoast.showToast(msg: "上传成功");
    }else{
      print('上传失败');
      Fluttertoast.showToast(msg: "上传失败");
    }

    } on DioError catch (err) {

    }

  }

}*/

/*Response<String> response;
Map<String, dynamic> responseDataMap;*/

class WebApi {
  //BuildContext context;
  factory WebApi() => _getInstance();
  static WebApi get instance => _getInstance();
  static WebApi _instance;
  var logincontent;
  WebApi._internal() {
    this._url = "http://222.72.129.158:1700";
    //this._url = "http://192.168.6.168:8866"; //1228改
    //this._url = "http://192.168.6.168:1700"; //新的
    //this._url = "http://222.72.129.158:11700";//原来
    //this._url = "http://192.168.6.15:1700";
    //_url = "http://222.72.129.158:11700";
    //this._url = "http://192.168.6.15:1700";
    Map<String, dynamic> headers = {"accessToken": ""};
    /*Map<String, dynamic> headers = {
      "Authorization": "Bearer" + logincontent["access_token"]
    };*/
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: _url, responseType: ResponseType.plain, headers: headers);
    _dio = Dio(baseOptions);
  }

  static WebApi _getInstance() {
    if (_instance == null) {
      _instance = new WebApi._internal();
    }

    return _instance;
  }

  //static Dio _dio;     //加了static
  //static String _url;  //加了static
  //新增
  Dio _dio;
  String _url;
  String token = '';
  String getUrl() {
    return _url;
  }

  //取验证码
  Future<List> getcode(String random) async {
    List list = [];
    try {
      /*Response response =
          await _dio.post("/api-uaa/validata/code/" + random, data: "{}");*/
      Response response = await _dio.get(
        "/api-uaa/validata/code/" + random,
      );
      list.add(response.data);
    } on DioError catch (err) {
      print(err);
    }
    return list;
  }

  //上传文件
  Future<String> fileUpload(String localPath) async {
    try {
      //String localPath="/storage/emulated/0/Pictures/pingnansanqiao.png";
      //String localPath="/storage/emulated/0/Pictures/监控手机端开发文档.docx";
      //Dio dio =Dio();
      String filename = '';
      int a = localPath.lastIndexOf('/');
      int b = localPath.length;
      filename = localPath.substring(a + 1, b);
      print(filename);
      Map<String, dynamic> map = Map();

      //map['auth']="12345";
      map['marking'] = "12345";
      //map['file']=await MultipartFile.fromFile(localPath,filename:"11.png");   //0624改
      map['file'] = await MultipartFile.fromFile(localPath, filename: filename);
      //map['file']="569";
      FormData formData = FormData.fromMap(map);
      Response response =
          await _dio.post("/upload/flutterUpload", data: formData);
      //Response response=await _dio.post("/upload/flutterUpload",data:map);
      var data = response.data;
      if (response.statusCode == 200) {
        print('上传成功');
        Fluttertoast.showToast(msg: "上传成功");
      } else {
        print('上传失败');
        Fluttertoast.showToast(msg: "上传失败");
      }
    } on DioError catch (err) {
      print(err);
    }
  }

  /*Future<List> login(String name, String password) async {
    int roleId = -1;
    String mark = '';
    List list = [];
    UserInfo userInfo = new UserInfo(name, password);
    String userInfoJson = jsonEncode(userInfo);

    try {
      Response<String> response =
          await _dio.post("/project/login", data: userInfoJson);

      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["content"];
      //Role role = Role.fromMap(contentMap);
      // String content = getContent(response.data);    //有错误
      if (contentMap.isNotEmpty) {
        Role role = Role.fromMap(contentMap);
        if (role.isLegal()) {
          _dio.options.headers["accessToken"] = role.mark;
          token = role.mark;
          roleId = role.roleId;
          mark = role.mark;
        }
        list.add(roleId);
        list.add(mark);
        //Map content1=jsonDecode(content);
        //print(jiexi.fromJson(content1).roleid);
      }
    } on DioError catch (err) {
      //err.response.statusCode
      //err.response.statusMessage
      //TODO:错误提示
    }

    //return roleId;
    return list;
  }*/

  //登录新
  Future<List> newlogin(String username, String password, String deviceId,
      String validCode, String flag) async {
    int roleId = -1;
    String mark = '';
    List list = [];
    //UserInfo userInfo = new UserInfo(username, password, deviceId, validCode,);
    //String userInfoJson = jsonEncode(userInfo);
    Map<String, dynamic> map = Map();
    map['username'] = username;
    map['password'] = password;
    map['deviceId'] = deviceId;
    map['validCode'] = validCode;
    map['flag'] = flag;
    FormData formData = FormData.fromMap(map);

    try {
        print("登录：");
      Response<String> response = 
          await _dio.post("/api-uaa/oauth/user/token", data: formData);

print(response.data);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      //dynamic contentMap = responseDataMap["content"];
      // dynamic contentMap = responseDataMap["datas"];
      logincontent = responseDataMap["datas"];
     print(responseDataMap["datas"]);

      //print("登录返回信息："+logincontent);
      //Role role = Role.fromMap(contentMap);
      // String content = getContent(response.data);    //有错误
      list.add(responseDataMap);
      /*if (contentMap.isNotEmpty) {
        //newrole.Role role = newrole.Role.fromMap(contentMap);
        //Role role = Role.fromMap(contentMap);

        //list.add(role);
        //Map content1=jsonDecode(content);
        //print(jiexi.fromJson(content1).roleid);
        
      }*/
    } on DioError catch (err) {
      //err.response.statusCode
      //err.response.statusMessage
      //TODO:错误提示
    }

    //return roleId;
    return list;
  }

  Future<List> getrolebyId(int id) async {
    int moduleAuthority;
    int projectAuthority;
    int organizationId;
    List list = [];
    RolebyId userInfo = new RolebyId(id);
    String userInfoJson = jsonEncode(userInfo);

    try {
      Response<String> response =
          await _dio.post("/project/getRoleById", data: userInfoJson);

      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["content"];
      if (contentMap.isNotEmpty) {
        RolebyIdRole role = RolebyIdRole.fromMap(contentMap);
        // _dio.options.headers["accessToken"] = role.mark;
        //token=role.mark;
        moduleAuthority = role.moduleAuthority;
        projectAuthority = role.projectAuthority;
        organizationId = role.organizationId;

        list.add(moduleAuthority);
        list.add(projectAuthority);
        list.add(organizationId);
      } else {
        moduleAuthority = -1;
        projectAuthority = -1;
        organizationId = -1;
        list.add(moduleAuthority);
        list.add(projectAuthority);
        list.add(organizationId);
      }
    } on DioError catch (err) {}
    return list;
  }

  //获取全部项目
  Future<List> getGeneralProject() async {
    /*List<int> id=[];
    List<String> name=[];
    //List<String> symbol=[];
    List<bool> readonly=[];
    //List list=[];
    //List<List> list1=[id,name,symbol,readonly];
    List<List> list1=[id,name,readonly];*/

    List list = [];
    try {
      Response<String> response =
          await _dio.post("/project/getGeneralProject", data: "{}");
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["content"];
      //List<GetGeneralProjectRole> list=getGeneralProjectList(contentMap);
      int n = contentMap.length;
      for (int a = 0; a < n; a++) {
        GeneralProjectRole role = GeneralProjectRole.fromMap(contentMap[a]);
        list.add(role);
      }
      /*if (contentMap.isNotEmpty) {
        for(int a=0;a<n;a++){
        /*id.add(list[a].id);
        name.add(list[a].name);
        //symbol.add(list[a].symbol);
        readonly.add(list[a].readonly); */
        id.add(contentMap[a]['id']);
        name.add(contentMap[a]['name']);
        readonly.add(contentMap[a]['readonly']);
        }

      }*/

    } on DioError catch (err) {}
    return list;
  }

  //获取全部项目新
  Future<List> getNewGeneralProject() async {
    List list = [];
    Map<String, dynamic> headers = {
      "Authorization": "Bearer" + " " + logincontent['access_token']
    };
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: _url, responseType: ResponseType.plain, headers: headers);
    _dio = Dio(baseOptions);
    try {
      Response<String> response = await _dio.post(
        "/api-monitor/project/getGeneralProject",
        data: "{}",
      );
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["datas"];
      //List<GetGeneralProjectRole> list=getGeneralProjectList(contentMap);
      int n = contentMap.length;
      /*for (int a = 0; a < n; a++) {
        //GeneralProjectRole role = GeneralProjectRole.fromMap(contentMap[a]);
        list.add(contentMap);
      }*/
      list.add(contentMap);
      /*for (int a = 0; a < n; a++) {
        GeneralProjectRole role = GeneralProjectRole.fromMap(contentMap[a]);
        list.add(role);
      }*/
      /*if (contentMap.isNotEmpty) {
        for(int a=0;a<n;a++){
        /*id.add(list[a].id);
        name.add(list[a].name);
        //symbol.add(list[a].symbol);
        readonly.add(list[a].readonly); */
        id.add(contentMap[a]['id']);
        name.add(contentMap[a]['name']);
        readonly.add(contentMap[a]['readonly']);
        }

      }*/

    } on DioError catch (err) {}
    return list;
  }

  /*getState(BuildContext context){

        Fluttertoast.showToast(msg: '账号已在其他平台登录,请重新登陆');
        Navigator.of(context).push(
           MaterialPageRoute(builder: (context){
           return Denglu();
         })
         );

  }*/
  //获取单个项目
  Future<List> getGeneralProjectInfo(int id) async {
    List list = [];
    String name = '';
    String location = '';
    String company = '';
    String service = '';
    String description = '';
    String createTime = '';
    GeneralProjectInfo userInfo = new GeneralProjectInfo(id);
    String userInfoJson = jsonEncode(userInfo);

    try {
      Response<String> response =
          await _dio.post("/project/getGeneralProjectInfo", data: userInfoJson);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["content"];
      dynamic state = responseDataMap["state"];
      if (state == 100102) {
        Fluttertoast.showToast(msg: '账号已在其他平台登录,请重新登陆');
      }
      if (contentMap.isNotEmpty) {
        GeneralProjectInfoRole role =
            GeneralProjectInfoRole.fromMap(contentMap);
        //_dio.options.headers["accessToken"] = role.mark;
        //token=role.mark;
        name = role.name;
        location = role.location;
        company = role.company;
        service = role.service;
        description = role.description;
        createTime = role.createTime;
        list.add(name);
        list.add(location);
        list.add(company);
        list.add(service);
        list.add(description);
        list.add(createTime);
        //list.add(role);

      }
    } on DioError catch (err) {}

    return list;
  }

  //获取单个项目新
  Future<List> getNewGeneralProjectInfo(int id) async {
    List list = [];
    Map<String, dynamic> headers = {
      "Authorization": "Bearer" + " " + logincontent['access_token']
    };
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: _url, responseType: ResponseType.plain, headers: headers);
    _dio = Dio(baseOptions);
    Map<String, dynamic> map = Map();
    map['projectId'] = id;
    FormData formData = FormData.fromMap(map);
    try {
      Response<String> response = await _dio
          .post("/api-monitor/project/getGeneralProjectInfo", data: formData);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["datas"];
      list.add(contentMap);
      //dynamic state = responseDataMap["state"];
      /*if (state == 100102) {
        Fluttertoast.showToast(msg: '账号已在其他平台登录,请重新登陆');
      }
      if (contentMap.isNotEmpty) {
        GeneralProjectInfoRole role =
            GeneralProjectInfoRole.fromMap(contentMap);
        //_dio.options.headers["accessToken"] = role.mark;
        //token=role.mark;
        name = role.name;
        location = role.location;
        company = role.company;
        service = role.service;
        description = role.description;
        createTime = role.createTime;
        list.add(name);
        list.add(location);
        list.add(company);
        list.add(service);
        list.add(description);
        list.add(createTime);
        //list.add(role);

      }*/
    } on DioError catch (err) {}

    return list;
  }

  //获取单个项目中桥梁新
  Future<List> getNewProjectBridgeInfo(int id) async {
    List list = [];
    Map<String, dynamic> headers = {
      "Authorization": "Bearer" + " " + logincontent['access_token']
    };
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: _url, responseType: ResponseType.plain, headers: headers);
    _dio = Dio(baseOptions);
    Map<String, dynamic> map = Map();
    map['projectId'] = id;
    FormData formData = FormData.fromMap(map);
    try {
      Response<String> response =
          await _dio.post("/api-monitor/project/getSubProject", data: formData);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["datas"];
      list.add(contentMap);
    } on DioError catch (err) {}

    return list;
  }

//获取单个桥梁构建ID旧
  Future<List> getSubProject(int generalProjectId) async {
    /*List<int> id=[];
    List<String> name=[];
    List<int> projectState=[];
    List<bool> readonly=[];
    //List list=[];
    //List<List> list1=[id,name,symbol,readonly];
    List<List> list1=[id,name,projectState,readonly];*/
    List list = [];
    SubProject userInfo = new SubProject(generalProjectId);
    String userInfoJson = jsonEncode(userInfo);

    try {
      Response<String> response =
          await _dio.post("/project/getSubProject", data: userInfoJson);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["content"];
      dynamic state = responseDataMap["state"];
      if (state == 100102) {
        Fluttertoast.showToast(msg: '账号已在其他平台登录,请重新登陆');
      }
      //List<GetGeneralProjectRole> list=getGeneralProjectList(contentMap);
      int n = contentMap.length;
      for (int a = 0; a < n; a++) {
        SubProjectRole role = SubProjectRole.fromMap(contentMap[a]);
        list.add(role);
      }
      /*if (contentMap.isNotEmpty) {
        for(int a=0;a<n;a++){
        id.add(contentMap[a]['id']);
        name.add(contentMap[a]['name']);
        projectState.add(contentMap[a]['projectState']);
        readonly.add(contentMap[a]['readonly']);
        }

      }*/

    } on DioError catch (err) {}
    return list;
  }

//获取单个桥梁构件ID新
  Future<List> getNewSubProject(int id) async {
    List list = [];
    Map<String, dynamic> headers = {
      "Authorization": "Bearer" + " " + logincontent['access_token']
    };
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: _url, responseType: ResponseType.plain, headers: headers);
    _dio = Dio(baseOptions);
    Map<String, dynamic> map = Map();
    map['subprojectId'] = id;
    FormData formData = FormData.fromMap(map);
    try {
      Response<String> response = await _dio
          .post("/api-monitor/project/loadSubProperty", data: formData);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["datas"];
      list.add(contentMap);
    } on DioError catch (err) {}

    return list;
  }

  //查询构件测点新
  Future<List> getNewSensorInfo(int subprojectId, int featureType) async {
    List list = [];
    Map<String, dynamic> headers = {
      "Authorization": "Bearer" + " " + logincontent['access_token']
    };
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: _url, responseType: ResponseType.plain, headers: headers);
    _dio = Dio(baseOptions);
    Map<String, dynamic> map = Map();
    map['subprojectId'] = subprojectId;
    map['featureType'] = featureType;
    FormData formData = FormData.fromMap(map);

    try {
      Response<String> response = await _dio
          .post("/api-monitor/mark/getMarkInfoByType", data: formData);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      //Map<String, dynamic> responseDataMap = response.data;
      dynamic contentMap = responseDataMap["datas"];
      int n = contentMap.length;
      for (int a = 0; a < n; a++) {
        //SensorInfoRole role = SensorInfoRole.fromMap(contentMap[a]);

        list.add(contentMap[a]);
      }
      //list.add(contentMap);
    } on DioError catch (err) {}
    return list;
  }

  //查询每个测点信息
  Future<List> getNewSensorInfoByMarkId(int markId) async {
    List list = [];
    Map<String, dynamic> headers = {
      "Authorization": "Bearer" + " " + logincontent['access_token']
    };
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: _url, responseType: ResponseType.plain, headers: headers);
    _dio = Dio(baseOptions);
    Map<String, dynamic> map = Map();
    map['markId'] = markId;
    FormData formData = FormData.fromMap(map);

    try {
      Response<String> response = await _dio
          .post("/api-monitor/sensor/getSensorInfoByMarkId", data: formData);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      //Map<String, dynamic> responseDataMap = response.data;
      dynamic contentMap = responseDataMap["datas"];
      int n = contentMap.length;
      list.add(contentMap);
      /*for (int a = 0; a < n; a++) {
        //SensorInfoRole role = SensorInfoRole.fromMap(contentMap[a]);

        list.add(contentMap[a]);
      }*/
      //list.add(contentMap);
    } on DioError catch (err) {}
    return list;
  }

  Future<List> getSensorInfo(
      int subprojectId, int sensorType, int rowCount, int pageIndex) async {
    List list = [];
    SensorInfo userInfo =
        new SensorInfo(subprojectId, sensorType, rowCount, pageIndex);
    String userInfoJson = jsonEncode(userInfo);

    try {
      Response<String> response =
          await _dio.post("/project/getSensorInfo", data: userInfoJson);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["content"];
      //List<GetGeneralProjectRole> list=getGeneralProjectList(contentMap);
      //Role role = Role.fromMap(contentMap);
      dynamic state = responseDataMap["state"];
      if (state == 100102) {
        Fluttertoast.showToast(msg: '账号已在其他平台登录,请重新登陆');
      }
      int n = contentMap.length;
      for (int a = 0; a < n; a++) {
        SensorInfoRole role = SensorInfoRole.fromMap(contentMap[a]);
        list.add(role);
      }
    } on DioError catch (err) {}
    return list;
  }

  Future<int> getSensorCountByType(int subprojectId, int sensorType) async {
    int count;
    SensorCountByType userInfo =
        new SensorCountByType(subprojectId, sensorType);
    String userInfoJson = jsonEncode(userInfo);

    try {
      Response<String> response =
          await _dio.post("/project/getSensorCountByType", data: userInfoJson);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["content"];
      //int n=contentMap.length;
      dynamic state = responseDataMap["state"];
      if (state == 100102) {
        Fluttertoast.showToast(msg: '账号已在其他平台登录,请重新登陆');
      }
      SensorCountByTypeRole role = SensorCountByTypeRole.fromMap(contentMap);
      count = role.sensorCount;
    } on DioError catch (err) {}
    return count;
  }

  //查询每个测点应力新
  Future<List> getNewStressDataByTimeSlot(
      int markId, String timeStart, String timeEnd) async {
    List list = [];
    Map<String, dynamic> headers = {
      "Authorization": "Bearer" + " " + logincontent['access_token']
    };
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: _url, responseType: ResponseType.plain, headers: headers);
    _dio = Dio(baseOptions);
    Map<String, dynamic> map = Map();
    map['markIds'] = markId;
    map['timeStart'] = timeStart;
    map['timeEnd'] = timeEnd;
    FormData formData = FormData.fromMap(map);

    try {
      Response<String> response = await _dio
          .post("/api-monitor/phase/getStressDataByTimeSlot", data: formData);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      //Map<String, dynamic> responseDataMap = response.data;
      dynamic contentMap = responseDataMap["datas"];
      int n = contentMap.length;
      list.add(contentMap);
      /*for (int a = 0; a < n; a++) {
        //SensorInfoRole role = SensorInfoRole.fromMap(contentMap[a]);

        list.add(contentMap[a]);
      }*/
      //list.add(contentMap);
    } on DioError catch (err) {}
    return list;
  }

  //查询每个测点变形新
  Future<List> getNewOffsetDataByTimeSlot(
      int markId, String timeStart, String timeEnd) async {
    List list = [];
    Map<String, dynamic> headers = {
      "Authorization": "Bearer" + " " + logincontent['access_token']
    };
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: _url, responseType: ResponseType.plain, headers: headers);
    _dio = Dio(baseOptions);
    Map<String, dynamic> map = Map();
    map['markIds'] = markId;
    map['timeStart'] = timeStart;
    map['timeEnd'] = timeEnd;
    FormData formData = FormData.fromMap(map);

    try {
      Response<String> response = await _dio
          .post("/api-monitor/phase/getOffsetDataByTimeSlot", data: formData);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      //Map<String, dynamic> responseDataMap = response.data;
      dynamic contentMap = responseDataMap["datas"];
      int n = contentMap.length;
      list.add(contentMap);
      /*for (int a = 0; a < n; a++) {
        //SensorInfoRole role = SensorInfoRole.fromMap(contentMap[a]);

        list.add(contentMap[a]);
      }*/
      //list.add(contentMap);
    } on DioError catch (err) {}
    return list;
  }

  //查询每个测点索力新
  Future<List> getNewCableDataByTimeSlot(
      int markId, String timeStart, String timeEnd) async {
    List list = [];
    Map<String, dynamic> headers = {
      "Authorization": "Bearer" + " " + logincontent['access_token']
    };
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: _url, responseType: ResponseType.plain, headers: headers);
    _dio = Dio(baseOptions);
    Map<String, dynamic> map = Map();
    map['markIds'] = markId;
    map['timeStart'] = timeStart;
    map['timeEnd'] = timeEnd;
    FormData formData = FormData.fromMap(map);

    try {
      Response<String> response = await _dio
          .post("/api-monitor/phase/getCableDataByTimeSlot", data: formData);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      //Map<String, dynamic> responseDataMap = response.data;
      dynamic contentMap = responseDataMap["datas"];
      int n = contentMap.length;
      list.add(contentMap);
      /*for (int a = 0; a < n; a++) {
        //SensorInfoRole role = SensorInfoRole.fromMap(contentMap[a]);

        list.add(contentMap[a]);
      }*/
      //list.add(contentMap);
    } on DioError catch (err) {}
    return list;
  }

  //查询每个测点环境新
  Future<List> getNewEnvByTimeSlot(
      int markId, String timeStart, String timeEnd) async {
    List list = [];
    Map<String, dynamic> headers = {
      "Authorization": "Bearer" + " " + logincontent['access_token']
    };
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: _url, responseType: ResponseType.plain, headers: headers);
    _dio = Dio(baseOptions);
    Map<String, dynamic> map = Map();
    map['markIds'] = markId;
    map['timeStart'] = timeStart;
    map['timeEnd'] = timeEnd;
    FormData formData = FormData.fromMap(map);

    try {
      Response<String> response = await _dio
          .post("/api-monitor/phase/getEnvByTimeSlot", data: formData);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      //Map<String, dynamic> responseDataMap = response.data;
      dynamic contentMap = responseDataMap["datas"];
      int n = contentMap.length;
      list.add(contentMap);
      /*for (int a = 0; a < n; a++) {
        //SensorInfoRole role = SensorInfoRole.fromMap(contentMap[a]);

        list.add(contentMap[a]);
      }*/
      //list.add(contentMap);
    } on DioError catch (err) {}
    return list;
  }

  Future<List> getStressDataByTimeSlot(
      int markId, int timeStart, int timeEnd) async {
    List list = [];
    StressDataByTime userInfo =
        new StressDataByTime(markId, timeStart, timeEnd);
    String userInfoJson = jsonEncode(userInfo);

    try {
      Response<String> response = await _dio
          .post("/project/getStressDataByTimeSlot", data: userInfoJson);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["content"];
      dynamic state = responseDataMap["state"];
      if (state == 100102) {
        Fluttertoast.showToast(msg: '账号已在其他平台登录,请重新登陆');
      }
      int n = contentMap.length;
      for (int a = 0; a < n; a++) {
        StressDataByTimeRole role = StressDataByTimeRole.fromMap(contentMap[a]);
        list.add(role);
      }
    } on DioError catch (err) {}
    return list;
  }

  Future<List> getOffsetDataByTimeSlot(
      int markId, int timeStart, int timeEnd) async {
    List list = [];
    OffsetDataByTime userInfo =
        new OffsetDataByTime(markId, timeStart, timeEnd);
    String userInfoJson = jsonEncode(userInfo);

    try {
      Response<String> response = await _dio
          .post("/project/getOffsetDataByTimeSlot", data: userInfoJson);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["content"];
      dynamic state = responseDataMap["state"];
      if (state == 100102) {
        Fluttertoast.showToast(msg: '账号已在其他平台登录,请重新登陆');
      }
      int n = contentMap.length;
      for (int a = 0; a < n; a++) {
        OffsetDataByTimeRole role = OffsetDataByTimeRole.fromMap(contentMap[a]);
        list.add(role);
      }
    } on DioError catch (err) {}
    return list;
  }

  Future<List> getCableDataByTimeSlot(
      int markId, int timeStart, int timeEnd) async {
    List list = [];
    CableDataByTime userInfo = new CableDataByTime(markId, timeStart, timeEnd);
    String userInfoJson = jsonEncode(userInfo);

    try {
      Response<String> response = await _dio
          .post("/project/getCableDataByTimeSlot", data: userInfoJson);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["content"];
      dynamic state = responseDataMap["state"];
      if (state == 100102) {
        Fluttertoast.showToast(msg: '账号已在其他平台登录,请重新登陆');
      }
      int n = contentMap.length;
      for (int a = 0; a < n; a++) {
        CableDataByTimeRole role = CableDataByTimeRole.fromMap(contentMap[a]);
        list.add(role);
      }
    } on DioError catch (err) {}
    return list;
  }

  Future<List> getEnvByTimeSlot(int markId, int timeStart, int timeEnd) async {
    List list = [];
    EnvByTime userInfo = new EnvByTime(markId, timeStart, timeEnd);
    String userInfoJson = jsonEncode(userInfo);

    try {
      Response<String> response =
          await _dio.post("/project/getEnvByTimeSlot", data: userInfoJson);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["content"];
      dynamic state = responseDataMap["state"];
      if (state == 100102) {
        Fluttertoast.showToast(msg: '账号已在其他平台登录,请重新登陆');
      }
      int n = contentMap.length;
      for (int a = 0; a < n; a++) {
        EnvByTimeRole role = EnvByTimeRole.fromMap(contentMap[a]);
        list.add(role);
      }
    } on DioError catch (err) {}
    return list;
  }

  //获取工况新
  Future<List> getNewAllPhase(int subprojectId) async {
    List list = [];
    Map<String, dynamic> headers = {
      "Authorization": "Bearer" + " " + logincontent['access_token']
    };
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: _url, responseType: ResponseType.plain, headers: headers);
    _dio = Dio(baseOptions);
    Map<String, dynamic> map = Map();
    map['subprojectId'] = subprojectId;
    FormData formData = FormData.fromMap(map);

    try {
      Response<String> response =
          await _dio.post("/api-monitor/element/getAllPhase", data: formData);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      //Map<String, dynamic> responseDataMap = response.data;
      dynamic contentMap = responseDataMap["datas"];
      int n = contentMap.length;
      for (int a = 0; a < n; a++) {
        list.add(contentMap[a]);
      }
      //list.add(contentMap);
    } on DioError catch (err) {}
    return list;
  }

  //获取工况旧
  Future<List> getAllPhase(int subprojectId) async {
    List list = [];
    //List list=new List();
    AllPhase userInfo = new AllPhase(subprojectId);
    String userInfoJson = jsonEncode(userInfo);

    try {
      Response<String> response =
          await _dio.post("/project/getAllPhase", data: userInfoJson);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["content"];
      dynamic state = responseDataMap["state"];
      if (state == 100102) {
        Fluttertoast.showToast(msg: '账号已在其他平台登录,请重新登陆');
      }
      int n = contentMap.length;
      for (int a = 0; a < n; a++) {
        AllPhaseRole role = AllPhaseRole.fromMap(contentMap[a]);
        //list.add(role);
        if (role != '') {
          list.add(role);
        }
      }
    } on DioError catch (err) {}
    return list;
  }

  Future<List> getTheoryData(int sensorId, int sensorType) async {
    List list = [];
    //List list=new List();
    TheoryData userInfo = new TheoryData(sensorId, sensorType);
    String userInfoJson = jsonEncode(userInfo);

    try {
      Response<String> response =
          await _dio.post("/project/getTheoryData", data: userInfoJson);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["content"];
      dynamic state = responseDataMap["state"];
      if (state == 100102) {
        Fluttertoast.showToast(msg: '账号已在其他平台登录,请重新登陆');
      }
      int n = contentMap.length;
      for (int a = 0; a < n; a++) {
        TheoryDataRole role = TheoryDataRole.fromMap(contentMap[a]);
        //list.add(role);
        if (role != '') {
          list.add(role);
        }
      }
    } on DioError catch (err) {}
    return list;
  }

  Future<List> getManagementByOrgaId(int subprojectId, int rowCount,
      int pageIndex, int organizationId, bool isFirst) async {
    List list = [];
    //List list=new List();
    ManagementByOrgaId userInfo = new ManagementByOrgaId(
        subprojectId, rowCount, pageIndex, organizationId, isFirst);
    String userInfoJson = jsonEncode(userInfo);

    try {
      Response<String> response =
          await _dio.post("/project/getManagementByOrgaId", data: userInfoJson);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["content"];
      dynamic state = responseDataMap["state"];
      if (state == 100102) {
        Fluttertoast.showToast(msg: '账号已在其他平台登录,请重新登陆');
      }
      int n = contentMap.length;
      for (int a = 0; a < n; a++) {
        ManagementByOrgaIdRole role =
            ManagementByOrgaIdRole.fromMap(contentMap[a]);
        //list.add(role);
        if (role != '') {
          list.add(role);
        }
      }
    } on DioError catch (err) {}
    return list;
  }

  Future<List> getManagement(
      int subprojectId, int rowCount, int pageIndex) async {
    List list = [];
    //List list=new List();
    Management userInfo = new Management(subprojectId, rowCount, pageIndex);
    String userInfoJson = jsonEncode(userInfo);

    try {
      Response<String> response =
          await _dio.post("/project/getManagement", data: userInfoJson);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["content"];
      dynamic state = responseDataMap["state"];
      if (state == 100102) {
        Fluttertoast.showToast(msg: '账号已在其他平台登录,请重新登陆');
      }
      int n = contentMap.length;
      for (int a = 0; a < n; a++) {
        ManagementRole role = ManagementRole.fromMap(contentMap[a]);
        //list.add(role);
        if (role != '') {
          list.add(role);
        }
      }
    } on DioError catch (err) {}
    return list;
  }

  Future getOrderData(int orderDataId) async {
    List list = [];
    //List list=new List();
    OrderData userInfo = new OrderData(orderDataId);
    String userInfoJson = jsonEncode(userInfo);

    try {
      Response<String> response =
          await _dio.post("/project/getOrderData", data: userInfoJson);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      dynamic contentMap = responseDataMap["content"];
      dynamic state = responseDataMap["state"];
      if (state == 100102) {
        Fluttertoast.showToast(msg: '账号已在其他平台登录,请重新登陆');
      }
      //int n=contentMap.length;

      OrderDataRole role = OrderDataRole.fromMap(contentMap);
      //list.add(role);
      /*if(role!=''){
          list.add(role);
        }*/

      return role;
    } on DioError catch (err) {}
  }

  //获取文件
  Future<List> getNewPageFiles() async {
    List list = [];
    Map<String, dynamic> headers = {
      "Authorization": "Bearer" + " " + logincontent['access_token']
    };
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: _url, responseType: ResponseType.plain, headers: headers);
    _dio = Dio(baseOptions);
    Map<String, dynamic> map = Map();
    //map['subprojectId'] = subprojectId;
    FormData formData = FormData.fromMap(map);

    try {
      Response<String> response =
          await _dio.post("/api-monitor/file/getAllFile", data: formData);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      //Map<String, dynamic> responseDataMap = response.data;
      dynamic contentMap = responseDataMap["data"];
      int n = contentMap.length;
      for (int a = 0; a < n; a++) {
        list.add(contentMap[a]);
      }
      //list.add(contentMap);
    } on DioError catch (err) {}
    return list;
  }

  //获取文件下载记录
  Future<List> getNewRecoed(int id, String name) async {
    List list = [];
    Map<String, dynamic> headers = {
      "Authorization": "Bearer" + " " + logincontent['access_token']
    };
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: _url, responseType: ResponseType.plain, headers: headers);
    _dio = Dio(baseOptions);
    Map<String, dynamic> map = Map();
    map['fileId'] = id;
    map['fileName'] = name;
    FormData formData = FormData.fromMap(map);

    try {
      Response<String> response =
          await _dio.post("/api-monitor/file/getFileDownLoad", data: formData);
      Map<String, dynamic> responseDataMap = jsonDecode(response.data);
      //Map<String, dynamic> responseDataMap = response.data;
      dynamic contentMap = responseDataMap["data"];
      int n = contentMap.length;
      for (int a = 0; a < n; a++) {
        list.add(contentMap[a]);
      }
      //list.add(contentMap);
    } on DioError catch (err) {}
    return list;
  }
}
