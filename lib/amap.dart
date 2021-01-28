import 'package:flutter/material.dart';

//import 'package:amap_location/amap_location.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
//import 'package:amap_all_fluttify/amap_all_fluttify.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:amap_location_fluttify/amap_location_fluttify.dart';
//import 'package:decorated_flutter/decorated_flutter.dart';

//高德地图获取地理位置
/*class LocationPage extends StatefulWidget {
  LocationPage({Key key}) : super(key : key);
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> with SingleTickerProviderStateMixin{
  double longitude = 0.0;
  double latitude = 0.0;

  @override
  void initState() {
    super.initState();
    //checkPersmission();
    //this._getLocation();
  }

  _getLocation () async {
    //启动一下
    await AMapLocationClient.startup(new AMapLocationOption(desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyBest));
    //获取地理位置（直接定位）
    var result = await AMapLocationClient.getLocation(true);
    setState(() {
      this.longitude = result.longitude;   //经度
      this.latitude = result.latitude;   //纬度
    });
  }

  @override
  void dispose() {
    //停止监听定位、销毁定位
    AMapLocationClient.stopLocation();
    AMapLocationClient.shutdown();
    super.dispose();
  }

  AmapController _controller;
  String city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("获取位置信息"),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(
              child: Text("获取位置"),
              onPressed: (){
                _getLocation();
              },
            ),
          ),
          Text("经度：${this.longitude}"),
          Text("纬度：${this.latitude}"),
          //显示地图
          Container(
            width: double.infinity,
            //height: ScreenAdapter.height(300.0),

            height: 200,
            child: Stack(
              children: <Widget>[
                AmapView(
                  mapType: MapType.Standard,
                  showZoomControl: false,
                  zoomLevel: 15,
                  centerCoordinate: LatLng(this.latitude,this.longitude),
                  onMapCreated: (controller) async{
                    await controller.showMyLocation(MyLocationOption(show: true));
                  },
                ),
              ],
            ),
          )
        ],
      ),
      //body: AmapView(*/
/*AmapView(

      //showsUserLocation: true,
     // 地图类型
     mapType: MapType.Standard,
     // 是否显示缩放控件
     showZoomControl: true,
     // 是否显示指南针控件
     showCompass: true,
     // 是否显示比例尺控件
     showScaleControl: true,
     // 是否使能缩放手势
     zoomGesturesEnabled: true,
     // 是否使能滚动手势
     scrollGesturesEnabled: true,
     // 是否使能旋转手势
     rotateGestureEnabled: true,
     // 是否使能倾斜手势
     tiltGestureEnabled: true,
     // 缩放级别
     zoomLevel: 10,
     // 中心点坐标
     centerCoordinate: LatLng(121, 31),
     // 标记
     markers: <MarkerOption>[

     ],
     autoRelease:true,
     // 标识点击回调
//      onMarkerClick: (Marker marker) {},
//      // 地图点击回调
//      onMapClick: (LatLng coord) {},
//      // 地图拖动回调
//      onMapDrag: (MapDrag drag) {},
     // 地图创建完成回调
     onMapCreated: (controller) async {
       _controller = controller;
       // requestPermission是权限请求方法, 需要你自己实现
       // 如果不知道怎么处理, 可以参考example工程的实现, example过程依赖了`permission_handler`插件.
       await _controller.requireAlwaysAuth();
       await _controller.setZoomLevel(17.0);
       await controller.showMyLocation(MyLocationOption(show: true));
     },

   );

    );
  }
   checkPersmission() async {
    // 申请权限
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.location]);
    // 申请结果
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.location);
    if (permission == PermissionStatus.granted) {
      //_getLocation();

    } else {
      bool isOpened = await PermissionHandler().openAppSettings();//打开应用设置
    }
  }

}*/

class LocationPage extends StatefulWidget {
  LocationPage({Key key, this.latitude, this.longitude}) : super(key: key);
  double latitude;
  double longitude;
  @override
  _LocationPageState createState() =>
      _LocationPageState(this.latitude, this.longitude);
}

class _LocationPageState extends State<LocationPage> {
  double longitude;
  double latitude;
  String address = '';
  AmapController _controller;
  TextEditingController textcontroller;
  _LocationPageState(this.latitude, this.longitude);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getlocation();
    print(latitude);
    print(longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(6),
            color: Colors.white),
        height: 250,
        child: Container(
          child: AmapView(
            centerCoordinate: LatLng(latitude, longitude),
            markers: [MarkerOption(latLng: LatLng(latitude, longitude))],
            onMapCreated: (controller) async {
              _controller = controller;
              if (await requestPermission()) {
                ///true定位，false默认北京
                await controller.showMyLocation(MyLocationOption(show: true));

                ///设置地图缩放大学
                await controller.setZoomLevel(10);
              }
            },
          ),
        ));
  }

  getlocation() async {
    final permissions = await PermissionHandler()
        .requestPermissions([PermissionGroup.location]);
    if (permissions[PermissionGroup.location] == PermissionStatus.granted) {
      final location = await AmapLocation.instance.fetchLocation();

      setState(() {
        longitude = location.latLng.longitude; //经度
        latitude = location.latLng.latitude;
        address = location.address;
        print(location);
      });
    } else {
      print('需要定位权限!');
    }

    /*location.latLng.then((val){
           //setState(() => _locationInfo +=  "纬度：${getLat_LngStr(val.latitude)}\n经度：${getLat_LngStr(val.longitude)}");
           setState(() {
             longitude = val.longitude;
             latitude = val.latitude;
           });
         });*/
  }

  Future<bool> requestPermission() async {
    final permissions = await PermissionHandler()
        .requestPermissions([PermissionGroup.location]);

    if (permissions[PermissionGroup.location] == PermissionStatus.granted) {
      return true;
    } else {
      //toast('需要定位权限!');
      return false;
    }
  }
}
