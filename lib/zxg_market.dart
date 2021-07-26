import 'package:flutter/material.dart';

class zxg_marketPage extends StatefulWidget {
  const zxg_marketPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _zxg_marketPageState();
  }
}

class _zxg_marketPageState extends State<zxg_marketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('行情'),
      ),
      body: Center(
        child: Text('行情首页'),
      ),
    );
  }
}
