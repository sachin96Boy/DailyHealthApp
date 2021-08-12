import 'package:flutter/material.dart';


import '../screens/mapScreen.dart';
import '../screens/home_Screen.dart';
import '../screens/status_Screen.dart';
import '../screens/information.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    HomeScreen(),
    StatusScreen(),
    MapScreen(),
    InformationScreen(),
  ];

  int _currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        //make the selected tab as the current screen
        onTap: (value) => setState(() => _currentIndex = value),

        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: const [
          Icons.home,
          Icons.insert_chart,
          Icons.add_location,
          Icons.info,
        ]
            .asMap()
            .map(
              (key, value) => MapEntry(
                key,
                BottomNavigationBarItem(
                  label: '',
                  icon: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 16.0,
                    ),
                    decoration: BoxDecoration(
                      color: _currentIndex == key
                          ? Colors.purple[600]
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Icon(value),
                  ),
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}
