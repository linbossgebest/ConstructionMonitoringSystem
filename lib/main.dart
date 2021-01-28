import 'package:flutter/material.dart';
import 'denglu.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:amap_all_fluttify/amap_all_fluttify.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

void main() {
  SyncfusionLicense.registerLicense(null);
  //runApp(MyApp());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) {
          return Counter();
        },
      ),
    ],
    child: MyApp(),
  ));
}

/*Future<void> main() async {
  runApp(MyApp());

  await enableFluttifyLog(false);
  await AmapService.init(
    iosKey: '',
    androidKey: '7be7e3ffa61a5ec86dbc98a576598b2e',
    //webApiKey: 'e69c6fddf6ccf8de917f5990deaa9aa2',
  );
}*/

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: Denglu(),
      localizationsDelegates: [
        //此处
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        //此处
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
