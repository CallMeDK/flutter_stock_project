import 'package:flutter/material.dart';

class zxg_fundPage extends StatefulWidget {
  const zxg_fundPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _zxg_fundPageState();
  }
}

class _zxg_fundPageState extends State<zxg_fundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基金'),
      ),
      body: Center(
        child: Text('基金首页'),
      ),
    );
  }
}
