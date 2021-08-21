import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CovidBarChart extends StatelessWidget {
  final List<int> covidCases;
  final List<String> covidDates;
  final String title;

  CovidBarChart(
      {required this.covidCases,
      required this.covidDates,
      required this.title});

  final List<Color> colorList = [Colors.red, Colors.green];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20.0),
          topRight: const Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(25.0),
            alignment: Alignment.centerLeft,
            child:  Text(
              title,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.35,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceEvenly,
                maxY: 25000.0,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    margin: 10.0,
                    showTitles: true,
                    rotateAngle: 315.0,
                    // getTextStyles: Styles.chartLabelTextStyle,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return covidDates[0];
                        case 1:
                          return covidDates[1];
                        case 2:
                          return covidDates[2];
                        case 3:
                          return covidDates[3];
                        case 4:
                          return covidDates[4];
                        case 5:
                          return covidDates[5];
                        case 6:
                          return covidDates[6];
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(
                      color: Color(0xff939393),
                      fontSize: 8,
                    ),
                    margin: 0,
                  ),
                ),
                barGroups: covidCases
                    .asMap()
                    .map(
                      (key, value) => MapEntry(
                        key,
                        BarChartGroupData(
                          x: key,
                          barRods: [
                            BarChartRodData(
                              y: value.toDouble(),
                              colors: colorList,
                            )
                          ],
                          showingTooltipIndicators: [1],
                        ),
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
