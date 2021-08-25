import 'package:health_app/data/covidData.dart';
import 'package:health_app/screens/home_Screen.dart';
import 'package:health_app/screens/information.dart';
import 'package:health_app/screens/mapScreen.dart';
import 'package:health_app/screens/screens.dart';
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
        title: 'Covid-19 CareApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BottomNavScreen(),
        routes: {
          StatusScreen.routeName : (context) => StatusScreen(),
          MapScreen.routeName: (context) => MapScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          InformationScreen.routeName : (context) => InformationScreen()
        },
      ),
    );
  }
}
