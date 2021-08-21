import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'covidProperties.dart';

class CovidData with ChangeNotifier {
  List<CovidProperties> _data = [];

   List<int> pcrCount  = [];
   List<int> antigenCount  = [];
  final List<String> date = [];

  CovidData(this._data);
  // CovidData();

  List<CovidProperties> get data {
    return [..._data];
  }

  void getPcrCount() {
    final List<String> pcrCount1 = [];

    data.first.pcrData.forEach((element) {
      pcrCount1.add(element['pcr_count']);
      date.add(element['date']);
    });

    pcrCount = pcrCount1.map((e) => int.parse(e)).toList();
  }

  void getAntigenCount() {
    final List<String> antigenCount1 = [];

    data.first.antigenData.forEach((element) {
      antigenCount1.add(element['antigen_count']);
    });

    antigenCount = antigenCount1.map((e) => int.parse(e)).toList();
  }

  Future<void> fetchAndSetDataCovid() async {
    var url = 'https://hpb.health.gov.lk/api/get-current-statistical';

    var response = await http.get(Uri.parse(url));
    // print(json.decode(response.body));

    var extractedData = json.decode(response.body) as Map<String, dynamic>;

    print(extractedData);

    final List<CovidProperties> loadedData = [];

 

    loadedData.add(CovidProperties(
      updateDate: extractedData['data']['update_date_time'],
      localNewCases: extractedData['data']['local_new_cases'],
      localTotalCases: extractedData['data']['local_total_cases'],
      totalHospitalized: extractedData['data']
          ['local_total_number_of_individuals_in_hospitals'],
      localDeaths: extractedData['data']['local_deaths'],
      localNewDeaths: extractedData['data']['local_new_deaths'],
      localRecovered: extractedData['data']['local_recovered'],
      localActiveCases: extractedData['data']['local_active_cases'],
      globalNewCases: extractedData['data']['global_new_cases'],
      globalTotalCases: extractedData['data']['global_total_cases'],
      globalDeaths: extractedData['data']['global_deaths'],
      globalNewDeaths: extractedData['data']['global_new_deaths'],
      globalRecovered: extractedData['data']['global_recovered'],
      totalPCR: extractedData['data']['total_pcr_testing_count'],
      pcrData: extractedData['data']['daily_pcr_testing_data'],
      antigenData: extractedData['data']['daily_antigen_testing_data'],
    ));

    _data = loadedData;

    getPcrCount();
    getAntigenCount();
    notifyListeners();
  }
}
