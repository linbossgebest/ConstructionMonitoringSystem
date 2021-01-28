import 'package:flutter/material.dart';
import 'package:flutter_filereader/flutter_filereader.dart';

class FileReaderPage extends StatefulWidget {
  FileReaderPage({Key: Key});

  @override
  _FileReaderPageState createState() => _FileReaderPageState();
}

class _FileReaderPageState extends State<FileReaderPage> {
  //_FileReaderPageState(this.filePath);
  String filePath;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filePath =
        '/storage/emulated/0/Android/data/com.example.ditu/files/位移测点数据 (7).xlsx';
    print(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("doc"),
      ),
      body: FileReaderView(
        filePath: filePath,
      ),
    );
  }
}
