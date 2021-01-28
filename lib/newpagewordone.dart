import 'package:flutter/material.dart';

class Newpagewordone extends StatefulWidget {
  Newpagewordone({Key key,this.wordName,this.allPhase,this.sensorinfo}) : super(key: key);
  String wordName='';
  List allPhase=[];
  List sensorinfo=[];
  @override
  _NewpagewordoneState createState() => _NewpagewordoneState(this.wordName,this.allPhase,this.sensorinfo);
}

class _NewpagewordoneState extends State<Newpagewordone> {
  String wordName='';
  List allPhase=[];
  List sensorinfo=[];
  _NewpagewordoneState(this.wordName,this.allPhase,this.sensorinfo);
  //Map state={'监控状态':0,'监控指令':1,'监控联系单':2};
  //List pagestate=[];
  List stateone=['st3','索力、温度','正常'];
  List statetwo=['st2','应力、温度','正常'];
  List statethree=['st1','位移、应力','正常'];
  List staterow=[];
  var content;
  List<DataRow> dataRow=[];
  List stage=[];
  List typelist=[];
  List typelistdif=[];
  String typetext='';
  Map type={'2':'应力','3':'位移','4':'索力','5':'环境'};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    staterow.add(stateone);
    staterow.add(statetwo);
    staterow.add(statethree);
    //getdatarow();
    //print('个数'+sensorinfo.length.toString());
    getContent();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title:Text(wordName)),
       body: Container(
         decoration:BoxDecoration(
             color:Color.fromRGBO(237, 237, 237, 1)
           ),
         child:Column(
      children:[
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
          //width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child:DataTable(
          columns:['序号','施工阶段','测试内容','监控状态'].map((e) => DataColumn(label: Text(e))).toList(),
          rows:dataRow,
          //rows: [DataRow(cells: ['1','1','1','1'].map((e) => DataCell(Text(e))).toList())],
        ),
        ),
          )
          )
      ]
    )
       )
    );
  }
  
  getdatarow(){
    dataRow=[];
    for(int a=0;a<staterow.length;a++){
      content=DataRow(cells: [(staterow.length-a).toString(),staterow[a][0],staterow[a][1],staterow[a][2]].map((e) => DataCell(Text(e))).toList());
      //content=DataRow(cells: ['1','1','1','1'].map((e) => DataCell(Text(e))).toList());
      
      print(staterow[a][0]);
      setState(() {
        dataRow.add(content);
      });
    }
    print(dataRow);
    //return dataRow;
  }

  getContent(){
    stage=[];
    dataRow=[];
    /*for (int a = 0; a < allPhase.length; a++) {*/
    for (int a = allPhase.length-1; a >= 0; a--) {
      typetext='';
      typelist=[];
      typelistdif=[];
      for (int b = 0; b < sensorinfo.length; b++) {
        if (sensorinfo[b].installStage == allPhase[a].id) {
          typelist.add(sensorinfo[b].sensorType);
          //typetext=typetext+type[sensorinfo[b].sensorType.toString()];
        }
      }
      for(int c=0;c<typelist.length;c++){
        if(typelistdif.indexOf(typelist[c])<0){
          typelistdif.add(typelist[c]);
        }
      }
      for(int d=0;d<typelistdif.length;d++){
        if(typetext==''){
          typetext=typetext+type[typelistdif[d].toString()];
        }else{
          typetext=typetext+'、'+type[typelistdif[d].toString()];
        }
         
         //typetext=typetext.substring(1);
      }
      content=DataRow(cells: [a.toString(),allPhase[a].name,typetext,'正常'].map((e) => DataCell(Text(e))).toList());
      dataRow.add(content);
    }
  }
  
}



