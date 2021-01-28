import 'package:flutter/material.dart';

class Newpagewordtwo extends StatefulWidget {
  Newpagewordtwo(
      {Key key, this.wordName, this.allPhase, this.managementByOrgaId})
      : super(key: key);
  String wordName;
  List allPhase = [];
  List managementByOrgaId = [];
  @override
  _NewpagewordtwoState createState() => _NewpagewordtwoState(
      this.wordName, this.allPhase, this.managementByOrgaId);
}

class _NewpagewordtwoState extends State<Newpagewordtwo> {
  _NewpagewordtwoState(this.wordName, this.allPhase, this.managementByOrgaId);
  String wordName;
  List allPhase = [];
  var content;
  List<Widget> list = [];
  List<DataRow> dataRow = [];
  List managementByOrgaId = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(wordName)),
        body: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(237, 237, 237, 1)),
            child: Column(children: [
              Expanded(
                  child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  //width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: DataTable(
                    columns: ['序号', '指令名称', '时间', '上传者']
                        .map((e) => DataColumn(
                            label:
                                //Container(width:MediaQuery.of(context).size.width/4,  child:Text(e,maxLines: 6,softWrap: true,))
                                Text(e)))
                        .toList(),
                    rows: dataRow,
                    //rows: [DataRow(cells: ['1','1','1','1'].map((e) => DataCell(Text(e))).toList())],
                  ),
                ),
              ))
            ])));
  }

  /*getContent(){  
    list=[];
    for(int a=0;a<allPhase.length;a++){
      content=Column(
        children:[
          Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10)
              ),
          child:Column(
            children:[
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ 
              Text(allPhase[a].name+'指令'),
              SizedBox(width:30),
              Text('上传者'),
              SizedBox(width:30),
              Text('>')
            ],
          ),
          //SizedBox(height:10),
            ]
          )
        ),
        SizedBox(height:10),
        ]
      );
      list.add(content);
    }
    return list;
  }*/
  getContent() {
    /*dataRow=[];
    for(int a=0;a<allPhase.length;a++){
      content=DataRow(cells: [(a+1).toString(),allPhase[a].name+'指令','xxx','xxx'].map((e) => DataCell(Text(e))).toList());
      dataRow.add(content);
    }*/
    dataRow = [];
    for (int a = 0; a < managementByOrgaId.length; a++) {
      int b = managementByOrgaId[a].time.toString().indexOf('T');
      String time = managementByOrgaId[a].time.toString().substring(0, b);
      /*var content=DataRow(cells: [a.toString(),managementByOrgaId[a].orderFileName,managementByOrgaId[a].sendName,time,].map((e) => DataCell(
          //Container(width:MediaQuery.of(context).size.width/4,  child:Text(e,maxLines: 6,softWrap: true,))
          Text(e)
          )).toList());*/
      var content = DataRow(cells: [
        DataCell(Text(a.toString())),
        DataCell(Container(
            width: 150,
            child: Text(
              managementByOrgaId[a].orderFileName,
              maxLines: 6,
              softWrap: true,
            ))),
        DataCell(Text(time)),
        DataCell(Text(managementByOrgaId[a].sendName)),
      ]);
      dataRow.add(content);
    }
  }
}
