import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/covidData.dart';

class StatusGridViewer extends StatefulWidget {
  final bool localData;
  final bool todayData;

  StatusGridViewer(this.localData, this.todayData);

  @override
  _StatusGridViewerState createState() => _StatusGridViewerState();
}

class _StatusGridViewerState extends State<StatusGridViewer> {
  @override
  Widget build(BuildContext context) {
    final covidData = Provider.of<CovidData>(context);
    final dataInstance = covidData.data;

    var totalCases;
    var totalDeaths;
    var totalRecovered;
    var totalActive;

    if (widget.localData == true && widget.todayData == true) {
      setState(() {
        dataInstance.forEach((element) {
          totalCases = element.localNewCases;
          totalDeaths = element.localNewDeaths;
          totalRecovered = element.localRecovered;
          totalActive = element.localActiveCases;
        });
      });
    }else if(widget.localData == true && widget.todayData == false){
      setState(() {
        dataInstance.forEach((element) {
          totalCases = element.localTotalCases;
          totalDeaths = element.localDeaths;
          totalRecovered = element.localRecovered;
          totalActive = element.localActiveCases;
        });
      });
    }else if(widget.localData == false && widget.todayData == true){
      setState(() {
        dataInstance.forEach((element) {
          totalCases = element.globalNewCases;
          totalDeaths = element.globalNewDeaths;
          totalRecovered = element.globalRecovered;
          totalActive = element.globalTotalCases;
        });
      });
    }else if(widget.localData == false && widget.todayData == false){
      setState(() {
        dataInstance.forEach((element) {
          totalCases = element.globalTotalCases;
          totalDeaths = element.globalDeaths;
          totalRecovered = element.globalRecovered;
          totalActive = element.globalTotalCases;
        });
      });
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      color: Colors.white24,
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                _buildStateCard("Total Cases", '$totalCases', Colors.yellow),
                _buildStateCard("Total Deaths", '$totalDeaths', Colors.red),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStateCard("Total Recovered", '$totalRecovered', Colors.green),
                _buildStateCard("Total Active", '$totalActive', Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStateCard(String name, String patCount, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            Text(
              patCount,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
