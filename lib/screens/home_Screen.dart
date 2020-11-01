import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../config/palatte.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildPreventionTips(screenHeight),
        ],
      ),
    );
  }
}

SliverToBoxAdapter _buildHeader(double screenHeight) {
  return SliverToBoxAdapter(
    child: Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'HealthCare First',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Are you feeling Unwell?',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Text(
                'If you are feeling below symtomps please contact the nearest Doctor ',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
  return SliverToBoxAdapter(
    child: Container(
      padding: const EdgeInsets.all(20.0),
      color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Prevention Tips',
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    ),
  );
}
