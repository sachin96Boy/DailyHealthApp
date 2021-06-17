import 'package:Health_app/config/styles.dart';
import 'package:Health_app/data/data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CovidBarChart extends StatefulWidget {
  // const CovidBarChart({Key? key, required this.covidCases}) : super(key: key);

  final List<double> covidCases;

  const CovidBarChart({required this.covidCases});

  @override
  _CovidBarChartState createState() => _CovidBarChartState();
}

class _CovidBarChartState extends State<CovidBarChart> {
  List<Color> colorList = [Colors.red, Colors.green];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'PCR Test Updates',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: BarChart(
              BarChartData(
                maxY: 16.0,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                      margin: 10.0,
                      showTitles: true,
                      // getTextStyles: Styles.chartLabelTextStyle,
                      getTitles: (double value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'May 24';
                          case 1:
                            return 'May 25';
                          case 2:
                            return 'May 26';
                          case 3:
                            return 'May 27';
                          case 4:
                            return 'May 28';
                          case 5:
                            return 'May 29';
                          case 6:
                            return 'May 30';
                          default:
                            return '';
                        }
                      }),
                ),
                barGroups: covidDailyCases
                    .asMap()
                    .map(
                      (key, value) => MapEntry(
                        key,
                        BarChartGroupData(x: key, barRods: [
                          BarChartRodData(
                            y: value,
                            colors: colorList,
                          )
                        ]),
                      ),
                    )
                    .values
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
