import 'package:flutter/material.dart';
import 'package:tencent_zxg_project/zxg_news.dart';
import 'package:tencent_zxg_project/zxg_optionalStock.dart';
import 'package:tencent_zxg_project/zxg_market.dart';
import 'package:tencent_zxg_project/zxg_trade.dart';
import 'package:tencent_zxg_project/zxg_fund.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _RootPageState();
  }
}

class _RootPageState extends State<RootPage> {
  List<Widget> _pages = [
    zxg_optionalStockPage(),
    zxg_newsPage(),
    zxg_marketPage(),
    zxg_tradePage(),
    zxg_fundPage(),
  ];

  int _currentIndex = 0;

  void _onTap(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: _onTap,
        selectedFontSize: 12.0,
        unselectedItemColor: Color.fromRGBO(93, 97, 111, 1),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: '自选',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: '新闻',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.broken_image),
            label: '行情',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horizontal_circle),
            label: '交易',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.savings),
            label: '基金',
          ),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}
