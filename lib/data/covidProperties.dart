
class CovidProperties {
  final String updateDate;
  final String localNewCases;
  final String localTotalCases;
  final String totalHospitalized;
  final String localDeaths;
  final String localNewDeaths;
  final String localRecovered;
  final String localActiveCases;
  final String globalNewCases;
  final String globalTotalCases;
  final String globalDeaths;
  final String globalNewDeaths;
  final String globalRecovered;
  final String totalPCR;
  final List pcrData;

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
      required this.pcrData});
}
