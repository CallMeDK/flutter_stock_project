import 'package:flutter/material.dart';

// ignore: camel_case_types
class zxg_tradePage extends StatefulWidget {
  const zxg_tradePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _zxg_tradePageState();
  }
}

// ignore: camel_case_types
class _zxg_tradePageState extends State<zxg_tradePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('交易'),
      ),
      body: Center(
        child: Text('交易首页'),
      ),
    );
  }
}
