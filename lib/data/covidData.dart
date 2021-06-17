import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CovidData with ChangeNotifier {
  CovidData();

  Future<void> fetchAndSetDataCovid() async {
    var url = 'https://hpb.health.gov.lk/api/get-current-statistical';

    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    notifyListeners();
  }
}
