import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:tencent_zxg_project/main.dart';
import 'package:tencent_zxg_project/zxg_fund.dart';
import 'ZXG_StockDetail_View.dart';

class ZXG_OptionalStock_Cell extends StatelessWidget {
  final String stockCode;
  final String stockName;
  final String stockPrice;
  final String stockZDF;
  final String stockType;
  final String? fundType;

  const ZXG_OptionalStock_Cell({
    Key? key,
    required this.stockCode,
    required this.stockName,
    required this.stockPrice,
    required this.stockZDF,
    required this.stockType,
    this.fundType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return ZXG_StockDetail_View(
            stockCode: stockCode,
            stockName: stockName,
            stockType: stockType,
          );
        }));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        color: Color.fromRGBO(15, 16, 23, 1),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      stockName,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        color: Color.fromRGBO(206, 130, 83, 1),
                        width: 15,
                        height: 12,
                        child: Text(
                          stockType,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        stockCode,
                        style: TextStyle(
                          color: Color.fromRGBO(69, 73, 86, 1),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // padding: const EdgeInsets.all(100.0),
                    alignment: Alignment.center,
                    child: Text(
                      stockPrice,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 40,
                    color: (double.parse(stockZDF) >= 0
                        ? Color.fromRGBO(149, 56, 26, 1)
                        : Color.fromRGBO(53, 106, 39, 1)),
                    child: Text(
                      '${stockZDF}%',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
