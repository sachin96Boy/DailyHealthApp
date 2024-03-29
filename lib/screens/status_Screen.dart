import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

import 'package:health_app/data/covidData.dart';

import 'package:health_app/screens/covidBarChart.dart';

import 'package:health_app/config/palatte.dart';
import 'package:health_app/config/styles.dart';

import 'package:health_app/widgets/custom_app_bar.dart';
import 'package:health_app/widgets/statusGridViewer.dart';

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
    
    final pcrcount = covidData.pcrCount;
    final antigencount = covidData.antigenCount;
    final pcrDates = covidData.date;

    

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
                    child: SizedBox(height: 10.0,),
                    ),),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  sliver: SliverToBoxAdapter(
                    child: CovidBarChart(
                      covidCases: pcrcount.sublist(1, 8),
                      covidDates: pcrDates,
                      title: 'PCR Details In Sri Lanka',
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0), 
                  sliver: SliverToBoxAdapter(
                    child: SizedBox(height: 20.0,),
                    ),),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  sliver: SliverToBoxAdapter(
                    child: CovidBarChart(
                      covidCases: antigencount.sublist(1, 8),
                      covidDates: pcrDates,
                      title: 'Antigen Test Details In Sri Lanka',
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
