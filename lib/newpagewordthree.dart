import 'package:flutter/material.dart';

class Newpagewordthree extends StatefulWidget {
  Newpagewordthree({Key key, this.wordName, this.managementByOrgaId})
      : super(key: key);
  String wordName;
  List managementByOrgaId = [];
  @override
  _NewpagewordthreeState createState() =>
      _NewpagewordthreeState(this.wordName, this.managementByOrgaId);
}

class _NewpagewordthreeState extends State<Newpagewordthree> {
  _NewpagewordthreeState(this.wordName, this.managementByOrgaId);
  String wordName;
  List<DataRow> dataRow = [];
  List contactlist = ['联系单1', '联系单2', '联系单3', '联系单4', '联系单5'];
  var content;
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
                    columns: ['序号', '联系单名称', '时间', '上传者']
                        .map((e) => DataColumn(label: Text(e)))
                        .toList(),
                    rows: dataRow,
                    //rows: [DataRow(cells: ['1','1','1','1'].map((e) => DataCell(Text(e))).toList())],
                  ),
                ),
              ))
            ])));
  }

  getContent() {
    /*dataRow=[];
    for(int a=0;a<contactlist.length;a++){
      content=DataRow(cells: [(a+1).toString(),contactlist[a],'xxx','xxx'].map((e) => DataCell(Text(e))).toList());
      dataRow.add(content);
    }*/
    dataRow = [];
    for (int a = 0; a < managementByOrgaId.length; a++) {
      int b = managementByOrgaId[a].time.toString().indexOf('T');
      String time = managementByOrgaId[a].time.toString().substring(0, b);
      /*var content=DataRow(cells: [a.toString(),managementByOrgaId[a].orderFileName,managementByOrgaId[a].sendName,time,].map((e) => DataCell(
          Container(width:MediaQuery.of(context).size.width/4,  child:Text(e,maxLines: 6,softWrap: true,))
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
