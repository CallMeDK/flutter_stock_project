import 'package:flutter/material.dart';
import 'package:tencent_zxg_project/zxg_optionalStockFile/ZXG_OptionalStock_Cell.dart';

class zxg_optionalStockPage extends StatefulWidget {
  const zxg_optionalStockPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _zxg_optionalStockPageState();
  }
}

class _zxg_optionalStockPageState extends State<zxg_optionalStockPage> {
  Color _themeColor = Color.fromRGBO(15, 16, 23, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _themeColor,
        title: Text('自选'),
        elevation: 0.0,
      ),
      body: Container(
        color: _themeColor,
        child: ListView(
          children: [
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股',
              stockPrice: '531.000',
              stockZDF: '3.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股1',
              stockPrice: '631.000',
              stockZDF: '-4.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股2',
              stockPrice: '731.000',
              stockZDF: '5.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股3',
              stockPrice: '831.000',
              stockZDF: '-6.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股4',
              stockPrice: '931.000',
              stockZDF: '7.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股5',
              stockPrice: '1031.000',
              stockZDF: '8.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股6',
              stockPrice: '1131.000',
              stockZDF: '9.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股7',
              stockPrice: '1231.000',
              stockZDF: '10.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股8',
              stockPrice: '1331.000',
              stockZDF: '11.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股9',
              stockPrice: '1431.000',
              stockZDF: '12.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股10',
              stockPrice: '1531.000',
              stockZDF: '13.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股',
              stockPrice: '531.000',
              stockZDF: '3.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股1',
              stockPrice: '631.000',
              stockZDF: '-4.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股2',
              stockPrice: '731.000',
              stockZDF: '5.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股3',
              stockPrice: '831.000',
              stockZDF: '-6.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股4',
              stockPrice: '931.000',
              stockZDF: '7.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股5',
              stockPrice: '1031.000',
              stockZDF: '8.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股6',
              stockPrice: '1131.000',
              stockZDF: '9.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股7',
              stockPrice: '1231.000',
              stockZDF: '10.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股8',
              stockPrice: '1331.000',
              stockZDF: '11.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股9',
              stockPrice: '1431.000',
              stockZDF: '12.29',
              stockType: 'HK',
            ),
            ZXG_OptionalStock_Cell(
              stockCode: '00700',
              stockName: '腾讯控股10',
              stockPrice: '1531.000',
              stockZDF: '13.29',
              stockType: 'HK',
            ),
          ],
        ),
      ),
    );
  }
}
