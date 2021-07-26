import 'package:flutter/material.dart';
import 'zxg_rootPage.dart';
import 'package:tencent_zxg_project/zxg_kline_File/generated/l10n.dart'
    as k_chart;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CallMeDK flutterProject',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor: Color.fromRGBO(1, 0, 0, 0.0),
        splashColor: Color.fromRGBO(1, 0, 0, 0.0),
      ),
      localizationsDelegates: [
        k_chart.S.delegate //国际话
      ],
      home: RootPage(),
    );
  }
}
