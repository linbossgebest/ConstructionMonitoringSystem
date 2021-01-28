
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'login.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class Camera extends StatefulWidget {
  Camera({Key key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  var _imgPath;
  VideoPlayerController _controller;
  Future _initializeVideoPlayerFuture;
  int count=5;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network('https://www.runoob.com/try/demo_source/mov_bbb.mp4');  
    //_controller=VideoPlayerController.file(File('/storage/emulated/0/Pictures/文史.mp4'));
   //_controller = VideoPlayerController.network('https://edu.csdn.net/course/play/6861?spm=1002.2001.3001.4140');
    //_controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title:Text('相机')),
       body: Column(
         children: <Widget>[
           _ImageView(_imgPath),
           RaisedButton(
             child: Text('拍照'),
             onPressed:(){
               requestPermission();
               _takePhoto();
             }
             ),
           RaisedButton(
             child: Text('选择相册'),
             onPressed:(){
               _openGallery();
             }
             ),
             Text(_imgPath.toString()),
            RaisedButton(
              child: Text('上传照片'),
              onPressed:(){
                upload(context);
              } 
              ),
              RaisedButton(
                child:Text('视频播放'),
                onPressed: (){
                  setState(() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      // If the video is paused, play it.
      _controller.play();
    }
  });
                }
                ),
              Row(
                children:[
                  RaisedButton(
                    child: Text('一次定时'),
                    onPressed: (){
                      var timeout = const Duration(seconds: 5);
                      Timer(timeout, (){
                        count=0;
                       print('afterTimer='+DateTime.now().toString());
                      });
                    },
                    /*onPressed: count0?
                    (){var timeout = const Duration(seconds: 5);
                      Timer(timeout, (){
                        count=0;
                       print('afterTimer='+DateTime.now().toString());
                      });}:null*/
                    ),
                  RaisedButton(
                    child: Text('多次定时'),
                    onPressed: count<5&&count>0?null:(){
                      Timer.periodic(Duration(seconds: 1), (timer) { 
                        setState(() {
                          count--;
                        if(count<0){
                          count=5;
                          timer.cancel();
                          timer = null;
                        }
                        });
                        
                      });
                    }
                    ),
                    Text(count.toString())
                ]
              ),
              Container(
                height: 300,
                child:FutureBuilder(
  future: _initializeVideoPlayerFuture,
  builder: (context, snapshot) {
    print(snapshot.connectionState);
    if (snapshot.hasError) print(snapshot.error);
    if (snapshot.connectionState == ConnectionState.done) {
      return AspectRatio(
        // aspectRatio: 16 / 9,
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  },
)
              )
              
         ],
       ),
    );
  }
  //图片控件
   Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return Center(
        child: Text("请选择图片或拍照"),
      );
    } else {
      return Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Image.file(
        imgPath,
      ),
      );
    }
  }

  //拍照
  _takePhoto() async {
     //var imagee=new ImagePicker();

    //var image = await imagee.getImage(source: ImageSource.camera);
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _imgPath = image;
    });
    
  }

  //相册
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
    print(_imgPath);
  }

  Future<void> upload(BuildContext context) async {
         
        int a=_imgPath.toString().indexOf('/');
        String content=_imgPath.toString().substring(a,_imgPath.toString().length-1);
        print(content);
         WebApi webApi =  WebApi.instance;
         await webApi.fileUpload(content);    
  }

  Future requestPermission() async {

  // 申请权限

  Map<PermissionGroup, PermissionStatus> permissions =

      await PermissionHandler().requestPermissions([PermissionGroup.storage]);
     // PermissionHandler().requestPermissions([PermissionGroup.storage]);

  // 申请结果

  PermissionStatus permission =

      await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);

  if (permission == PermissionStatus.granted) {

    Fluttertoast.showToast(msg: "权限申请通过");

  } else {

    Fluttertoast.showToast(msg: "未打开相关权限");

  }
  print(permission);
  print(PermissionStatus.granted);
  print(permissions);
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
        //Fluttertoast.showToast(msg: directory.path);
    return directory.path;
  }

}

