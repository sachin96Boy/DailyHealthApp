import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

import 'package:Health_app/data/covidData.dart';

import 'package:Health_app/screens/covidBarChart.dart';

import 'package:Health_app/config/palatte.dart';
import 'package:Health_app/config/styles.dart';

import 'package:Health_app/widgets/custom_app_bar.dart';
import 'package:Health_app/widgets/statusGridViewer.dart';

class StatusScreen extends StatefulWidget {
  static const routeName = '/statusScreen';
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  var _isInit = true;
  var _isLoading = false;

  var _local = true;
  var _today = true;

  get local {
    return _local;
  }

  get today {
    return _today;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("Didchangedependanciescalled");
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<CovidData>(context, listen: true)
          .fetchAndSetDataCovid()
          .then((_) => {
                setState(() {
                  _isLoading = false;
                }),
              });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final covidData = Provider.of<CovidData>(context, listen: false);
    // final dataInstance = covidData.data;
    final pcrcount = covidData.pcrCount;
    final pcrDates = covidData.date;

    // final List<String> numList = [];
    // final List<String> numList2 = [];
    // final List<int> newNumList;

    // // if (_isDataGetting) {}
    // dataInstance.first.pcrData.forEach((element) {
    //   numList.add(element['pcr_count']);
    //   numList2.add(element['date']);
    // });

    // newNumList = numList.map((e) => int.parse(e)).toList();

    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Palette.primaryColor,
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : CustomScrollView(
              physics: ClampingScrollPhysics(),
              slivers: [
                _buildHeader(),
                _buildRegionTabBar(),
                _buildStateTabBar(),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  sliver: SliverToBoxAdapter(
                    child: StatusGridViewer(local, today),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  sliver: SliverToBoxAdapter(
                    child: CovidBarChart(
                      covidCases: pcrcount.sublist(1, 8),
                      covidDates: pcrDates,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: const Center(
          child: const Text(
            'Statistics',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRegionTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TabBar(
            indicator: const BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: Colors.white60,
            ),
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: [
              const Text('Local'),
              const Text('Global'),
            ],
            onTap: (index) {
              print('Statmeaer changed ' + index.toString());

              setState(() {
                _local = !_local;
              });
            },
          ),
        ),
      ),
    );
  }

  SliverPadding _buildStateTabBar() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 2,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white54,
            tabs: [
              const Text('Today'),
              const Text('Total'),
            ],
            onTap: (index) {
              print('Date to show details selected ' + index.toString());
              setState(() {
                _today = !_today;
              });
            },
          ),
        ),
      ),
    );
  }
}
