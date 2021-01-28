import 'package:ditu/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'newpagewordone.dart';
import 'newpagewordtwo.dart';
import 'newpagewordthree.dart';
import 'login.dart';

/*class Newpageword extends StatefulWidget {
  Newpageword({Key key,this.oneSubProject,this.managementByOrgaId}) : super(key: key);
  var oneSubProject;
  List managementByOrgaId=[];
  @override
  _NewpagewordState createState() => _NewpagewordState(this.oneSubProject,this.managementByOrgaId);
}

class _NewpagewordState extends State<Newpageword> {
  List wordName=['监控状态','监控指令','监控联系单'];
  _NewpagewordState(this.oneSubProject,this.managementByOrgaId);
  var oneSubProject;
  List allPhase=[];
  List sensorinfo=[];
  List sensorinfotwo=[];
  List sensorinfothree=[];
  List sensorinfofour=[];
  List sensorinfofive=[];
  String text='';
  List managementByOrgaId=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print('11'+oneSubProject.id.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Center(
       child:Container(
         decoration:BoxDecoration(
             color:Color.fromRGBO(237, 237, 237, 1)
           ),
         child:Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children:[
           Container(
           decoration: BoxDecoration(
          border: Border.all(width: 1,color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
             ),
           child: GestureDetector(
             child:Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Icon(Icons.file_upload),
               Text(wordName[0]),
               GestureDetector(
                 child:Text('>'),
               )
             ],
           ),
           onTap: (){
             setState(() {
               text=wordName[0];
             });
             getSensorAllphase();
                   /*Navigator.of(context).push(
                     MaterialPageRoute(builder: (context){
                       return Newpagewordone(wordName:wordName[0]);
                     })
                   );*/
                 },
           )
         ),
         SizedBox(height:10),
         Container(
           decoration: BoxDecoration(
          border: Border.all(width: 1,color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
             ),
           child: GestureDetector(
             child:Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Icon(Icons.file_upload),
               Text(wordName[1]),
               GestureDetector(
                 child:Text('>')
               )
             ],
           ),
           onTap: (){
             setState(() {
               text=wordName[1];
             });
             getSensorAllphase();
                   /*Navigator.of(context).push(
                     MaterialPageRoute(builder: (context){
                       return Newpagewordtwo(wordName:wordName[1]);
                     })
                   );*/
                 },
           )
         ),
         SizedBox(height:10),
         Container(
           decoration: BoxDecoration(
          border: Border.all(width: 1,color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
             ),
           child: GestureDetector(
             child:Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Icon(Icons.file_upload),
               Text(wordName[2]),
               GestureDetector(
                 child:Text('>')
               )
             ],
           ),
           onTap: (){
             setState(() {
               text=wordName[2];
             });
             getSensorAllphase();
                   /*Navigator.of(context).push(
                     MaterialPageRoute(builder: (context){
                       return Newpagewordthree(wordName:wordName[2],managementByOrgaId:managementByOrgaId);
                     })
                   );*/
                 },
           )
         ),
         SizedBox(height:10),
         ]
       )
       )
    );
  }
  //0629
  getSensorAllphase()async{
    WebApi webApi =  WebApi.instance;
    sensorinfotwo=await webApi.getSensorInfo(oneSubProject.id, 2, 5, 0);
    sensorinfothree=await webApi.getSensorInfo(oneSubProject.id, 3, 5, 0);
    sensorinfofour=await webApi.getSensorInfo(oneSubProject.id, 4, 5, 0);
    sensorinfofive=await webApi.getSensorInfo(oneSubProject.id, 5, 5, 0);
    allPhase=await webApi.getAllPhase(oneSubProject.id);
    sensorinfo.addAll(sensorinfotwo);
    sensorinfo.addAll(sensorinfothree);
    sensorinfo.addAll(sensorinfofour);
    sensorinfo.addAll(sensorinfofive);
    if(text=='监控状态'){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context){
          return Newpagewordone(wordName:wordName[0],allPhase: allPhase,sensorinfo:sensorinfo);
        })
      );
    }else if(text=='监控指令'){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context){
          return Newpagewordtwo(wordName:wordName[1],allPhase: allPhase,managementByOrgaId:managementByOrgaId);
        })
      );
    }else if(text=='监控联系单'){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context){
          return Newpagewordtwo(wordName:wordName[2],allPhase: allPhase,managementByOrgaId:managementByOrgaId);
        })
      );
    }
    
  }
}*/

class Newpageword extends StatefulWidget {
  Newpageword({Key key, this.wordFiles, this.allphase, this.sensorinfo})
      : super(key: key);
  List wordFiles = [];
  List allphase = [];
  List sensorinfo = [];
  @override
  _NewpagewordState createState() =>
      _NewpagewordState(this.wordFiles, this.allphase, this.sensorinfo);
}

class _NewpagewordState extends State<Newpageword> {
  _NewpagewordState(this.wordFiles, this.allphase, this.sensorinfo);
  List wordFiles = [];
  List allphase = [];
  List sensorinfo = [];
  Color _color1 = Colors.blue;
  Color _color2 = Colors.white;
  Color _color3 = Colors.white;
  List state = ['序号', '施工阶段', '测试内容', '监控状态'];
  List instruction = ['序号', '指令名称', '时间', '上传者'];
  List contact = ['序号', '联系单名称', '时间', '上传者'];
  List columnlist = [];
  DataTableSource tablesource;
  DataTableSource statetablesource;
  DataTableSource instrtablesource;
  DataTableSource contacttablesource;
  List<Userstate> dataone = [];
  List<Userinstruction> datatwo = [];
  List<Usercontact> datathree = [];
  List<DataRow> dataRow = [];
  List stage = [];
  List typelist = [];
  List typelistdif = [];
  String typetext = '';
  Map type = {'2': '应力', '3': '位移', '4': '索力', '5': '环境'};
  var content;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wordFiles = Provider.of<Counter>(context, listen: false).wordFiles;
    allphase = Provider.of<Counter>(context, listen: false).allphase;
    sensorinfo = Provider.of<Counter>(context, listen: false).sensor;
    //print(sensorinfo);
    for (int a = 0; a < wordFiles.length; a++) {
      if (wordFiles[a]['fileType'] == 1) {
        datatwo.add(Userinstruction(
            datatwo.length + 1,
            wordFiles[a]['fileName'],
            wordFiles[a]['updateTime'],
            wordFiles[a]['username']));
      } else if (wordFiles[a]['fileType'] == 2) {
        datathree.add(Usercontact(
            datathree.length + 1,
            wordFiles[a]['fileName'],
            wordFiles[a]['updateTime'],
            wordFiles[a]['username']));
      }
    }
    tablesource = StateTableSource(dataone);
    columnlist = state;
    getContent();
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
              width: MediaQuery.of(context).size.width / 3,
              child: InkWell(
                child: Text(
                  '监控状态',
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  setState(() {
                    if (_color1 == Colors.white) {
                      _color1 = Colors.blue;
                      _color2 = Colors.white;
                      _color3 = Colors.white;
                    }
                    tablesource = StateTableSource(dataone);
                    columnlist = state;
                  });
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  //border: Border.all(width: 1, color: _color),
                  border: Border(bottom: BorderSide(width: 1, color: _color2)),
                  color: Colors.white),
              width: MediaQuery.of(context).size.width / 3,
              child: InkWell(
                child: Text(
                  '监控指令',
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  setState(() {
                    if (_color2 == Colors.white) {
                      _color2 = Colors.blue;
                      _color1 = Colors.white;
                      _color3 = Colors.white;
                    }
                    tablesource = InstrTableSource(datatwo);
                    //tablesource = StateTableSource(dataone);
                    columnlist = instruction;
                  });
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  //border: Border.all(width: 1, color: _color),
                  border: Border(bottom: BorderSide(width: 1, color: _color3)),
                  color: Colors.white),
              width: MediaQuery.of(context).size.width / 3,
              child: InkWell(
                child: Text(
                  '监控联系单',
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  setState(() {
                    if (_color3 == Colors.white) {
                      _color3 = Colors.blue;
                      _color1 = Colors.white;
                      _color2 = Colors.white;
                    }
                    tablesource = ContactTableSource(datathree);
                    columnlist = contact;
                  });
                },
              ),
            ),
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
                child: PaginatedDataTable(
                    header: Text(''),
                    columns: columnlist
                        .map((e) => DataColumn(label: Text(e)))
                        .toList(),
                    rowsPerPage: 10,
                    source: tablesource)))
      ],
    );
  }

  //getword() {}
  getContent() {
    stage = [];
    dataRow = [];
    /*for (int a = 0; a < allPhase.length; a++) {*/
    for (int a = allphase.length - 1; a >= 0; a--) {
      typetext = '';
      typelist = [];
      typelistdif = [];
      for (int b = 0; b < sensorinfo.length; b++) {
        if (sensorinfo[b]['installStage'] == allphase[a]['id']) {
          typelist.add(sensorinfo[b]['sensorType']);
          //typetext=typetext+type[sensorinfo[b].sensorType.toString()];
        }
      }

      for (int c = 0; c < typelist.length; c++) {
        if (typelistdif.indexOf(typelist[c]) < 0) {
          typelistdif.add(typelist[c]);
        }
      }
      for (int d = 0; d < typelistdif.length; d++) {
        if (typetext == '') {
          typetext = typetext + type[typelistdif[d].toString()];
        } else {
          typetext = typetext + '、' + type[typelistdif[d].toString()];
        }

        //typetext=typetext.substring(1);
      }

      dataone.add(Userstate(a, allphase[a]['name'], typetext, '正常'));
      /*content = DataRow(
          cells: [a.toString(), allPhase[a].name, typetext, '正常']
              .map((e) => DataCell(Text(e)))
              .toList());
      dataRow.add(content);*/
    }
  }
}

class StateTableSource extends DataTableSource {
  StateTableSource(this.data);
  List<Userstate> data = [];
  int featureType;
  bool selected = false;
  @override
  DataRow getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      //selected: data[index].selected,
      //onSelectChanged: (selected) {},
      cells: [
        DataCell(Text('${data[index].number}')),
        DataCell(Text('${data[index].phase}')),
        DataCell(Text('${data[index].content}')),
        DataCell(Text('${data[index].state}')),
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

class InstrTableSource extends DataTableSource {
  InstrTableSource(this.data);
  List<Userinstruction> data = [];
  int featureType;
  bool selected = false;
  @override
  DataRow getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      //selected: data[index].selected,
      //onSelectChanged: (selected) {},
      cells: [
        DataCell(Text('${data[index].number}')),
        //DataCell(Text('${data[index].name}')),
        DataCell(Container(
            width: 150,
            child: Text(
              '${data[index].name}',
              maxLines: 6,
              softWrap: true,
            ))),
        DataCell(Text('${data[index].time}')),
        DataCell(Text('${data[index].author}')),
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

class ContactTableSource extends DataTableSource {
  ContactTableSource(this.data);
  List<Usercontact> data = [];
  int featureType;
  bool selected = false;
  @override
  DataRow getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      //selected: data[index].selected,
      //onSelectChanged: (selected) {},
      cells: [
        DataCell(Text('${data[index].number}')),
        //DataCell(Text('${data[index].name}')),
        DataCell(Container(
            width: 150,
            child: Text(
              '${data[index].name}',
              maxLines: 6,
              softWrap: true,
            ))),
        DataCell(Text('${data[index].time}')),
        DataCell(Text('${data[index].author}')),
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

class Userstate {
  Userstate(this.number, this.phase, this.content, this.state);

  final int number;
  final String phase;
  final String content;
  final String state;
}

class Userinstruction {
  Userinstruction(this.number, this.name, this.time, this.author);

  final int number;
  final String name;
  final String time;
  final String author;
}

class Usercontact {
  Usercontact(this.number, this.name, this.time, this.author);

  final int number;
  final String name;
  final String time;
  final String author;
}
