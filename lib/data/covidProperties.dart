class CovidProperties {
  final String updateDate;
  final int localNewCases;
  final int localTotalCases;
  final int totalHospitalized;
  final int localDeaths;
  final int localNewDeaths;
  final int localRecovered;
  final int localActiveCases;
  final int globalNewCases;
  final int globalTotalCases;
  final int globalDeaths;
  final int globalNewDeaths;
  final int globalRecovered;
  final int totalPCR;
  final List<dynamic> pcrData;
  final List<dynamic> antigenData;

  CovidProperties(
      {required this.updateDate,
      required this.localNewCases,
      required this.localTotalCases,
      required this.totalHospitalized,
      required this.localDeaths,
      required this.localNewDeaths,
      required this.localRecovered,
      required this.localActiveCases,
      required this.globalNewCases,
      required this.globalTotalCases,
      required this.globalDeaths,
      required this.globalNewDeaths,
      required this.globalRecovered,
      required this.totalPCR,
      required this.pcrData,
      required this.antigenData
      });
}
