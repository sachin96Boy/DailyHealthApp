import 'package:Health_app/data/covidData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/bottom_nav_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CovidData([]),
      child: MaterialApp(
        title: 'HealthCare App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BottomNavScreen(),
      ),
    );
  }
}
