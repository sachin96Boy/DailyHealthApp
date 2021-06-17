import 'package:flutter/material.dart';
import '';

class StatusGridViewer extends StatefulWidget {
  const StatusGridViewer({Key? key}) : super(key: key);

  @override
  _StatusGridViewerState createState() => _StatusGridViewerState();
}

class _StatusGridViewerState extends State<StatusGridViewer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      color: Colors.white24,
      
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                _buildStateCard("Total Cases", "count", Colors.yellow),
                _buildStateCard("Total Deaths", "countDeath", Colors.red),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStateCard("Total Recovered", "countRec", Colors.green),
                _buildStateCard("Total Active", "countAct", Colors.grey),
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
