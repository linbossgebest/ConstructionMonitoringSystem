import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

class Pdf extends StatefulWidget {
  Pdf({Key key}) : super(key: key);

  @override
  _PdfState createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  String pathPDF = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    printFile();
    createFileOfPdfUrl().then((f) {
      setState(() {
        pathPDF = f.path;
        print(pathPDF);
      });
    });
  }
  void printFile() async {

    print("assets/sdcard/Pictures/flutter.pdf");
    var filebd = await rootBundle.load("/sdcard/Pictures/flutter.pdf");
    print(filebd.runtimeType);



  }

  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }


  Future<File> createFileOfPdfUrl() async {
    //final url = "http://africau.edu/images/default/sample.pdf";
    final filename = 'flutter.pdf';
    //var request = await HttpClient().getUrl(Uri.parse(url));
    //var response = await request.close();
    var bytes = await rootBundle.load("/sdcard/Pictures/flutter.pdf");

    String dir = (await getApplicationDocumentsDirectory()).path;
    writeToFile(bytes,'$dir/$filename');
    File file = new File('$dir/$filename');
    //await file.writeAsBytes(bytes);

    return file;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title:Text('pdf')),
       body: Center(
        child: RaisedButton(
          child: Text("Open PDF"),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PDFScreen(pathPDF)),
          ),
        ),
      ),
    );
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
