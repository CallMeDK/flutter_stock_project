import 'package:flutter/material.dart';

class zxg_newsPage extends StatefulWidget {
  const zxg_newsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _zxg_newsPageState();
  }
}

class _zxg_newsPageState extends State<zxg_newsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新闻'),
      ),
      body: Center(
        child: Text('新闻首页'),
      ),
    );
  }
}
