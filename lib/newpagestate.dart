/*import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';*/

/*class Newpagestate extends StatefulWidget {
  Newpagestate({Key key,this.wordFiles}) : super(key: key);
  List wordFiles=[];
  @override
  _NewpagestateState createState() => _NewpagestateState(this.wordFiles);
}

class _NewpagestateState extends State<Newpagestate> {
  List files = [];
  List wordFiles=[];
  List newWordFiles=[];
  _NewpagestateState(this.wordFiles);
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int a=0;a<wordFiles.length;a++){
       int b=wordFiles[a].toString().indexOf('/');
       int c=wordFiles[a].toString().length-1;
       newWordFiles.add(wordFiles[a].toString().substring(b,c));
    }
    print(newWordFiles);
  
  }
  @override
  Widget build(BuildContext context) {
    return Column(
       children: <Widget>[
         Center(
           child:Text('报表资料')
         ),
        SizedBox(height:10),    
        Expanded(
          child: Container(
          child:ListView.builder(
          //controller: controller,
          itemCount: newWordFiles.length,
          itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: Colors.grey),
              borderRadius: BorderRadius.circular(5)
             ),
            child:ListTile(
            leading: Icon(Icons.filter),
            title: Text(newWordFiles[index].toString()),
            onTap: (){
              Fluttertoast.showToast(msg: newWordFiles[index].toString());
            },
          )
          );
          },
        ),
        )
          )
       ],
    );
  }

  Future<String> _findLocalPath() async {
    // 因为Apple没有外置存储，所以第一步我们需要先对所在平台进行判断
    // 如果是android，使用getExternalStorageDirectory
    // 如果是iOS，使用getApplicationSupportDirectory
    final directory = Theme.of(context).platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();
        String path=directory.path;
        //print(directory.path);
        print(path);
        Fluttertoast.showToast(msg: path);
    //return directory.path;
        
     var directory1 = Directory(path);
     files = directory1.listSync();
     print(files);
  }
  
}*/

import 'package:flutter/material.dart';
import 'package:flutter_filereader/flutter_filereader.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import 'package:flutter/foundation.dart';
import 'provider.dart';
/*class Newpagestate extends StatefulWidget {
  Newpagestate({Key key,this.wordFiles,this.managementByOrgaId}) : super(key: key);
  List wordFiles=[];
  List managementByOrgaId=[];
  @override
  _NewpagestateState createState() => _NewpagestateState(this.wordFiles,this.managementByOrgaId);
}

class _NewpagestateState extends State<Newpagestate> {
  List files = [];
  List wordFiles=[];
  List newWordFiles=[];
  List newWordFiles1=[];
  List managementByOrgaId=[];
  _NewpagestateState(this.wordFiles,this.managementByOrgaId);
  var filesName;
  String pathPDF = "";
  String localPath="";
  String filename='';
  var orderData;
  int selectIndex;
  String wordurl='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //0624
    for(int a=0;a<wordFiles.length;a++){
       int b=wordFiles[a].toString().indexOf('/');
       int c=wordFiles[a].toString().length-1;
       newWordFiles.add(wordFiles[a].toString().substring(b,c));
        b=wordFiles[a].toString().lastIndexOf('/');
        c=wordFiles[a].toString().length-1;
       newWordFiles1.add(wordFiles[a].toString().substring(b+1,c));
    }
    //print(newWordFiles);
    //print(newWordFiles1);
    /*createFileOfPdfUrl().then((f) {
      setState(() {
        pathPDF = f.path;
        print(pathPDF);
      });
    });*/
  }
  @override
  Widget build(BuildContext context) {
    return Container(
           decoration:BoxDecoration(
             color:Color.fromRGBO(237, 237, 237, 1)
           ),
         child: Column(
       children: <Widget>[
         Center(
           child:Text('文件资料')
         ),
        SizedBox(height:10),    
        Expanded(
          child: Container(
          width: MediaQuery.of(context).size.width,
          child:ListView.builder(
          //controller: controller,
          //itemCount: newWordFiles.length,
          itemCount: managementByOrgaId.length,
          itemBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white
             ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Container(
                  /*child: ListTile(
            leading: Icon(Icons.filter),
            title: Text(newWordFiles[index].toString()),
            onTap: (){
              //Fluttertoast.showToast(msg: newWordFiles[index].toString());
              setState(() {
                filesName=newWordFiles[index].toString();
              });
              Fluttertoast.showToast(msg: filesName);
              printFile();
              createFileOfPdfUrl().then((f) {
             setState(() {
             pathPDF = f.path;
             print(pathPDF);
             });
             });
            },
          ),*/
              child: Row(
                children: <Widget>[
                  Icon(Icons.filter),
                  //Text(newWordFiles1[index].toString()),
                  Container(width:MediaQuery.of(context).size.width/2,child:Text(managementByOrgaId[index].orderFileName,maxLines: 5,softWrap: true,))
                ],
              ),
                ),
              Container(
                child: Row(
                  children:[
                    /*FlatButton(
                      child:Text('上传'),
                      onPressed: (){
                        setState(() {
                          filesName=newWordFiles[index].toString();
                          Fluttertoast.showToast(msg: filesName);
                        });
                        upload(context);
                      },
                      ),*/
                    FlatButton(
                      child:Text('查看'),
                      onPressed: (){
                        /*createFileOfPdfUrl().then((f) {
                           setState(() {
                            pathPDF = f.path;
                            print(pathPDF);
                            });
                          });*/

                          getOrderData(index);
                          
                          /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PDFScreen(pathPDF)),
          );*/
                        /*setState(() {
                          
                filesName=newWordFiles[index].toString();
              });
              Fluttertoast.showToast(msg: filesName);
              print(filesName);
              printFile();*/
              /*createFileOfPdfUrl().then((f) {
             setState(() {
             pathPDF = f.path;
             print(pathPDF);
             Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PDFScreen(pathPDF)),
          );
             });
             });*/
              /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PDFScreen(pathPDF)),
          );*/
                      },
                      ),
                  ]
                ),
              )
              ]
            )
          );
          },
        ),
        )
          ),
          
       ],
    ),
    );
    
  }
  //阅读本地文件
  void printFile() async {

    //print("assets/sdcard/Pictures/flutter.pdf");
    print('12'+filesName);
    var filebd = await rootBundle.load(filesName);
    print(filebd.runtimeType);
    createFileOfPdfUrl().then((f) {
             setState(() {
             pathPDF = f.path;
             print(pathPDF);
             Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PDFScreen(pathPDF)),
          );
             });
             });
  }

  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }


  /*Future<File> createFileOfPdfUrl() async {
    int b=filesName.toString().lastIndexOf('/');
    int c=filesName.toString().length;
    filename =filesName.toString().substring(b+1,c);
    print('11'+filename);
    var bytes = await rootBundle.load(filesName);

    String dir = (await getApplicationDocumentsDirectory()).path;
    writeToFile(bytes,'$dir/$filename');
    File file = new File('$dir/$filename');
    return file;
  }*/   //0709
  //阅读在线文件
  Future<File> createFileOfPdfUrl() async {
    //final url = "http://222.72.129.158:18101/pdftest/项目管理需求说明.pdf"; //http://222.72.129.158:18101/A1031AC3420287B72376A4BAB7A544F87776/项目管理需求说明.pdf
    final url=wordurl;
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }
  //上传文件
  Future<void> upload(BuildContext context) async {
    
        //WebApiUtils webApi =  WebApiUtils.instance; 
         WebApi webApi =  WebApi.instance;
         await webApi.fileUpload(filesName);    
  }

  getOrderData(int index) async{
   WebApi webApi =  WebApi.instance;
   orderData=await webApi.getOrderData(managementByOrgaId[index].orderDataId);
  wordurl='http://'+orderData.ip+':'+orderData.port+'/'+orderData.fileMark+'/'+orderData.name;
  print(wordurl);
  int a=orderData.name.toString().lastIndexOf('.');
  String wordStyle=orderData.name.toString().substring(a+1);
  //print(wordStyle);
  if(wordStyle=='pdf'){
     createFileOfPdfUrl().then((f) {
      setState(() {
        pathPDF = f.path;
        print(pathPDF);
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PDFScreen(pathPDF)),
          );
      });
    });
  }else{
    Fluttertoast.showToast(msg: '暂时只支持PDF文件查看');
  }
  
  }
  
}
class PDFScreen extends StatelessWidget {
  String pathPDF = "";
  String filename='';
  PDFScreen(this.pathPDF);
  
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text('Document'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        path: pathPDF);
  }
}*/

class Newpagestate extends StatefulWidget {
  Newpagestate({
    Key key,
  }) : super(key: key);
  List wordFiles = [];
  @override
  _NewpagestateState createState() => _NewpagestateState();
}

class _NewpagestateState extends State<Newpagestate> {
  _NewpagestateState();
  List wordFiles = [];
  List record = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      wordFiles = Provider.of<Counter>(context, listen: false).wordFiles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(237, 237, 237, 1)),
      child: Column(
        children: <Widget>[
          Center(child: Text('文件资料')),
          SizedBox(height: 10),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              //controller: controller,
              //itemCount: newWordFiles.length,
              itemCount: wordFiles.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            /*child: ListTile(
            leading: Icon(Icons.filter),
            title: Text(newWordFiles[index].toString()),
            onTap: (){
              //Fluttertoast.showToast(msg: newWordFiles[index].toString());
              setState(() {
                filesName=newWordFiles[index].toString();
              });
              Fluttertoast.showToast(msg: filesName);
              printFile();
              createFileOfPdfUrl().then((f) {
             setState(() {
             pathPDF = f.path;
             print(pathPDF);
             });
             });
            },
          ),*/
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.filter),
                                //Text(newWordFiles1[index].toString()),
                                Container(
                                  width: 100,
                                  child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        wordFiles[index]['fileName'],
                                        maxLines: 5,
                                        softWrap: true,
                                      )),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(children: [
                              /*FlatButton(
                      child:Text('上传'),
                      onPressed: (){
                        setState(() {
                          filesName=newWordFiles[index].toString();
                          Fluttertoast.showToast(msg: filesName);
                        });
                        upload(context);
                      },
                      ),*/
                              SizedBox(
                                width: 60,
                                 height: 32,
                                child: FlatButton(
                                  child: Text('下载', style: TextStyle(fontSize: 12),),
                                  onPressed: () {
                                    downloadFile(wordFiles[index]['fileUrl'],
                                        wordFiles[index]['fileName']);
                                  },
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                 height: 32,
                                child: FlatButton(
                                  child: Text('查看', style: TextStyle(fontSize: 12),),
                                  onPressed: () {
                                    /*createFileOfPdfUrl().then((f) {
                           setState(() {
                            pathPDF = f.path;
                            print(pathPDF);
                            });
                          });*/

                                    //getOrderData(index);

                                    /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PDFScreen(pathPDF)),
          );*/
                                    /*setState(() {
                          
                filesName=newWordFiles[index].toString();
              });
              Fluttertoast.showToast(msg: filesName);
              print(filesName);
              printFile();*/
                                    /*createFileOfPdfUrl().then((f) {
             setState(() {
             pathPDF = f.path;
             print(pathPDF);
             Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PDFScreen(pathPDF)),
          );
             });
             });*/
                                    /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PDFScreen(pathPDF)),
          );*/
                                  },
                                ),
                              ),
                              Container(
                                // width: 40,
                                child: FlatButton(
                                    onPressed: () {
                                      getrecord(wordFiles[index]['id'],
                                          wordFiles[index]['fileName']);
                                    },
                                    child: Text('下载记录', style: TextStyle(fontSize: 12),)),
                              ),
                            ]),
                          )
                        ]));
              },
            ),
          )),
          /*RaisedButton(
              child: Text('打印'),
              onPressed: () {
                print(Provider.of<Counter>(context, listen: false).wordlist);
              })*/
        ],
      ),
    );
  }

  getrecord(int id, String name) async {
    WebApi webApi = WebApi.instance;
    record = await webApi.getNewRecoed(id, name);
    print(record);
    showMyMaterialDialog(context);
  }

  void showMyMaterialDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return MessageDialog(
            record: record,
          );
        });
  }

  downloadFile(url, fileName) async {
    Dio dio = Dio();
//    dio.options.baseUrl = "https://123.sogou.com";
    //设置连接超时时间
    dio.options.connectTimeout = 60000;
    //设置数据接收超时时间
    dio.options.receiveTimeout = 60000;
//    await dio.download(
//        "https://raw.githubusercontent.com/xuelongqy/flutter_easyrefresh/master/art/pkg/EasyRefresh.apk",
//        "/storage/emulated/0/AAAAAA.apk");
    String savePath = await _findLocalPath();
    //String name = 'logo.png';
    String _localPath = savePath + '/' + fileName;
    print(url);
    print(fileName);
    print(_localPath);
    /*Response response = await dio.download(
        "http://222.72.129.158:18101/666/logo.png", _localPath);*/
    Response response = await dio.download(url, _localPath);
    if (response.statusCode == 200) {
      print('下载请求成功');
      Fluttertoast.showToast(msg: "下载成功");
    } else {
      print("下载失败");
      Fluttertoast.showToast(msg: "下载失败");
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
    //print(directory.path);
    //Fluttertoast.showToast(msg: directory.path);
    return directory.path;
  }
}

class MessageDialog extends Dialog {
  MessageDialog({
    Key key,
    this.record,
  }) : super(key: key);
  List record = [];
  var content;
  List<DataRow> list = [];

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Container(
                  child: Column(
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                          columns: ['下载用户', '下载时间']
                              .map((e) => DataColumn(label: Text(e)))
                              .toList(),
                          rows: getrow()),
                    ),
                  ),
                  Container(
                    width: 100,
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text('确定')),
                  )
                ],
              )),
            ),
          )),
    );
  }

  getrow() {
    list = [];
    for (int a = 0; a < record.length; a++) {
      content = DataRow(cells: [
        DataCell(Text(record[a]['dlUsername'])),
        DataCell(Text(record[a]['downTime'])),
      ]);
      list.add(content);
    }
    return list;
  }
}
