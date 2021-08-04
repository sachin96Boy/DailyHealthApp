import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/covidData.dart';
import '../widgets/custom_app_bar.dart';

class InformationScreen extends StatelessWidget {
  // const InformationScreen({Key? key}) : super(key: key);

  final List<dynamic> dummy = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: ElevatedButton(
          child: Text('Hit Me'),
          onPressed: () {
            print("button pressed");
          },
        ),
      ),
    );
  }
}
