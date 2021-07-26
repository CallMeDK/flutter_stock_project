import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';

import 'package:tencent_zxg_project/zxg_kline_File/flutter_k_chart.dart';
import 'package:tencent_zxg_project/zxg_kline_File/k_chart_widget.dart';
import 'package:http/http.dart' as http;
import 'package:tencent_zxg_project/zxg_market.dart';

/**
 *            stockCode: '00700',
              stockName: '腾讯控股',
              stockPrice: '531.000',
              stockZDF: '3.29',
              stockType: 'HK',
 */
// ignore: camel_case_types
class ZXG_StockDetail_View extends StatefulWidget {
  final String stockCode;
  final String stockName;
  final String stockType;

  const ZXG_StockDetail_View({
    Key? key,
    required this.stockCode,
    required this.stockName,
    required this.stockType,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ZXG_StockDetail_ViewState();
  }
}

// ignore: camel_case_types
class _ZXG_StockDetail_ViewState extends State<ZXG_StockDetail_View> {
  Color _themeColor = Color.fromRGBO(15, 16, 23, 1);
  List<KLineEntity> datas = [];
  bool showLoading = true;
  MainState _mainState = MainState.MA;
  SecondaryState _secondaryState = SecondaryState.MACD;
  bool isLine = true;
  List<DepthEntity> _bids = [], _asks = [];

  @override
  void initState() {
    super.initState();
    getData('1day');
    rootBundle.loadString('assets/depth.json').then((result) {
      final parseJson = json.decode(result);
      Map tick = parseJson['tick'];
      var bids = tick['bids']
          .map((item) => DepthEntity(item[0], item[1]))
          .toList()
          .cast<DepthEntity>();
      var asks = tick['asks']
          .map((item) => DepthEntity(item[0], item[1]))
          .toList()
          .cast<DepthEntity>();
      initDepth(bids, asks);
    });
  }

  void initDepth(List<DepthEntity>? bids, List<DepthEntity>? asks) {
    if (bids == null || asks == null || bids.isEmpty || asks.isEmpty) return;
    _bids = [];
    _asks = [];
    double amount = 0.0;
    bids.sort((left, right) => left.price.compareTo(right.price));
    //倒序循环 //累加买入委托量
    bids.reversed.forEach((item) {
      amount += item.amount;
      item.amount = amount;
      _bids.insert(0, item);
    });

    amount = 0.0;
    asks.sort((left, right) => left.price.compareTo(right.price));
    //循环 //累加买入委托量
    asks.forEach((item) {
      amount += item.amount;
      item.amount = amount;
      _asks.add(item);
    });
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _themeColor,
      appBar: AppBar(
        backgroundColor: _themeColor,
        title: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.stockName +
                    '(' +
                    widget.stockCode +
                    ')' +
                    '.' +
                    widget.stockType,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                '未开盘 07-23 16:08:11',
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(69, 73, 86, 1),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(children: <Widget>[
            Container(alignment: Alignment.centerLeft, child: buildButtons()),
                        if (showLoading)
              Container(
                  width: double.infinity,
                  height: 450,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator()),
            Container(
              height: 450,
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: KChartWidget(
                datas,
                isLine: isLine,
                mainState: _mainState,
                secondaryState: _secondaryState,
                volState: VolState.VOL,
                fractionDigits: 4,
              ),
            ),
          ]),
          Container(child: buildButtons1()),
          Container(
            height: 230,
            width: double.infinity,
            child: DepthChart(_bids, _asks),
          )
        ],
      ),
    );
  }

  Widget buildButtons() {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 5,
      children: <Widget>[
        button("月k", onPressed: () async {
          //getData('1mon');
          String result = await rootBundle.loadString('assets/kmon.json');
          Map parseJson = json.decode(result);
          List list = parseJson['data'];
          datas = list
              .map((item) => KLineEntity.fromJson(item))
              .toList()
              .reversed
              .toList()
              .cast<KLineEntity>();
          DataUtil.calculate(datas);
        }),
        TextButton(
            onPressed: () {
              showLoading = true;
              setState(() {});
              getData('1day');
            },
            child: Text("日k", style: const TextStyle(color: Colors.white)),
            style: TextButton.styleFrom(
                backgroundColor: Color.fromRGBO(15, 16, 23, 1))),

        button("Tick/KLine", onPressed: () => isLine = !isLine),
        // button("MA", onPressed: () => _mainState = MainState.MA),
        // button("BOLL", onPressed: () => _mainState = MainState.BOLL),
        // button("隐藏",
        //     onPressed: () => _mainState =
        //         _mainState == MainState.NONE ? MainState.MA : MainState.NONE),
        // button("MACD", onPressed: () => _secondaryState = SecondaryState.MACD),
        // button("KDJ", onPressed: () => _secondaryState = SecondaryState.KDJ),
        // button("RSI", onPressed: () => _secondaryState = SecondaryState.RSI),
        // button("WR", onPressed: () => _secondaryState = SecondaryState.WR),
        // button("隐藏副视图",
        //     onPressed: () => _secondaryState =
        //         _secondaryState == SecondaryState.NONE
        //             ? SecondaryState.MACD
        //             : SecondaryState.NONE),
        // button("update", onPressed: () {
        //   //更新最后一条数据
        //   datas.last.close += (Random().nextInt(100) - 50).toDouble();
        //   datas.last.high = max(datas.last.high, datas.last.close);
        //   datas.last.low = min(datas.last.low, datas.last.close);
        //   DataUtil.updateLastData(datas);
        // }),
        // button("addData", onPressed: () {
        //   //拷贝一个对象，修改数据
        //   var kLineEntity = KLineEntity.fromJson(datas.last.toJson());
        //   kLineEntity.id = kLineEntity.id! + 60 * 60 * 24;
        //   kLineEntity.open = kLineEntity.close;
        //   kLineEntity.close += (Random().nextInt(100) - 50).toDouble();
        //   datas.last.high = max(datas.last.high, datas.last.close);
        //   datas.last.low = min(datas.last.low, datas.last.close);
        //   DataUtil.addLastData(datas, kLineEntity);
        // }),
      ],
    );
  }

  Widget buildButtons1() {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 5,
      children: <Widget>[
        button("MA", onPressed: () => _mainState = MainState.MA),
        button("BOLL", onPressed: () => _mainState = MainState.BOLL),
        button("MACD", onPressed: () => _secondaryState = SecondaryState.MACD),
        button("KDJ", onPressed: () => _secondaryState = SecondaryState.KDJ),
        button("RSI", onPressed: () => _secondaryState = SecondaryState.RSI),
        button("WR", onPressed: () => _secondaryState = SecondaryState.WR),
      ],
    );
  }

  Widget button(String text, {VoidCallback? onPressed}) {
    return TextButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed();
            setState(() {});
          }
        },
        child: Text("$text", style: const TextStyle(color: Colors.white)),
        style: TextButton.styleFrom(
            backgroundColor: Color.fromRGBO(15, 16, 23, 1)));
  }

  void getData(String period) async {
    late String result;
    try {
      // result = await getIPAddress('$period');
      result = await rootBundle.loadString('assets/kline.json');
    } catch (e) {
      print('获取数据失败,获取本地数据');
      result = await rootBundle.loadString('assets/kline.json');
    } finally {
      Map parseJson = json.decode(result);
      List list = parseJson['data'];
      datas = list
          .map((item) => KLineEntity.fromJson(item))
          .toList()
          .reversed
          .toList()
          .cast<KLineEntity>();
      DataUtil.calculate(datas);
      showLoading = false;
      setState(() {});
    }
  }

  Future<String> getIPAddress(String? period) async {
    //没有股票接口，用的网上找的火币接口
    var url =
        'https://api.huobi.br.com/market/history/kline?period=${period ?? '1day'}&size=300&symbol=btcusdt';
    String result;
    var response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 7));
    if (response.statusCode == 200) {
      result = response.body;
    } else {
      return Future.error("获取失败");
    }
    return result;
  }
}
