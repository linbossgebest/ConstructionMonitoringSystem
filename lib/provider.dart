import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  /*String content = 'flutter12';
  int number = 0;*/
  //List wordlist = [];
  List allproject = [];
  List subprojectallphaselist = [];
  List projectInfo = [];
  List bridgeInfo = [];
  String imgurl = '';
  String oneProjectName = '';
  int subprojectId;
  List projectPoint = [];
  List allphase = [];
  List wordFiles = [];
  List sensor = [];
  //List allPhase = [];
  //List sensorinfo = [];

  getwordFiles(List list) {
    wordFiles = list;
    notifyListeners();
  }

  getallproject(List list) {
    allproject = list;
    notifyListeners();
  }

  getsubprojectallphaselist(List list) {
    subprojectallphaselist = list;
    notifyListeners();
  }

  getprojectInfo(List list) {
    projectInfo = list;
    notifyListeners();
  }

  getbridgeInfo(List list) {
    bridgeInfo = list;
    notifyListeners();
  }

  getimgurl(String list) {
    imgurl = list;
    notifyListeners();
  }

  getoneProjectName(String list) {
    oneProjectName = list;
    notifyListeners();
  }

  getsubprojectId(int list) {
    subprojectId = list;
    notifyListeners();
  }

  getprojectPoint(List list) {
    projectPoint = list;
    notifyListeners();
  }

  getallphase(List list) {
    allphase = list;
    notifyListeners();
  }

  getsensor(List list) {
    sensor = list;
    notifyListeners();
  }

  /*getallPhase(List list) {
    allPhase = list;
    notifyListeners();
  }*/

  /*getsensorinfo(List list) {
    sensorinfo = list;
    notifyListeners();
  }*/

  /*add() {
    number++;
    notifyListeners();
  }*/
}
