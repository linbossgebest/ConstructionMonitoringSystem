import 'package:flutter/material.dart';
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

class Pdfone extends StatefulWidget {
  Pdfone({Key key,this.wordFiles}) : super(key: key);
  List wordFiles=[];
  @override
  _PdfoneState createState() => _PdfoneState(this.wordFiles);
}

class _PdfoneState extends State<Pdfone> {
  List files = [];
  List wordFiles=[];
  List newWordFiles=[];
  _PdfoneState(this.wordFiles);
  var filesName;
  String pathPDF = "";

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
    return Scaffold(
      appBar: AppBar(title:Text('目录')),
      body: Column(
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
             /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PDFScreen(pathPDF)),
          );*/
            },
          )
          );
          },
        ),
        )
          ),
          RaisedButton(
          child: Text("Open PDF"),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PDFScreen(pathPDF)),
          ),
        ),
       ],
    ),
    );
  }

  void printFile() async {

    //print("assets/sdcard/Pictures/flutter.pdf");
    var filebd = await rootBundle.load(filesName);
    print(filebd.runtimeType);



  }

  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }


  Future<File> createFileOfPdfUrl() async {
    //final url = "http://africau.edu/images/default/sample.pdf";
    int b=filesName.toString().lastIndexOf('/');
    int c=filesName.toString().length-1;
    final filename =filesName.toString().substring(b+1,c);
    print(filename);
    //var request = await HttpClient().getUrl(Uri.parse(url));
    //var response = await request.close();
    var bytes = await rootBundle.load(filesName);

    String dir = (await getApplicationDocumentsDirectory()).path;
    writeToFile(bytes,'$dir/$filename');
    File file = new File('$dir/$filename');
    //await file.writeAsBytes(bytes);

    return file;
  }
  
}
class PDFScreen extends StatelessWidget {
  String pathPDF = "";
  PDFScreen(this.pathPDF);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("Document"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        path: pathPDF);
  }
}