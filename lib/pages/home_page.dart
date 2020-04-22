import 'package:covid19tracker/data_provider/data_provider.dart';
import 'package:covid19tracker/models/global_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'functions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalModel globalCases;
  List countries;

  @override
  void initState() {
    super.initState();
    DataProvider.getGlobalData().then((casesFromDataProvider) {
      if (this.mounted) {
        setState(() {
          globalCases = casesFromDataProvider;
        });
      }
    });

    DataProvider.getCountries().then((country) {
      if (this.mounted) {
        setState(() {
          countries = country;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(

                  'assets/images/corona_defence.jpg',

                  fit: BoxFit.cover,

                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Global',
                style: TextStyle(
                    fontFamily: 'SpecialElite',
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    color: Colors.white,
                    letterSpacing: 3),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: <Widget>[
                    buildCards(
                        label: 'Total Cases',
                        value: globalCases != null ? globalCases.confirmed : -1,
                        color: Colors.blue,
                        icon: FontAwesomeIcons.globeAmericas),
                    SizedBox(
                      width: 20,
                    ),
                    buildCards(
                      label: 'Total Deaths',
                      value: globalCases == null ? -1 : globalCases.deaths,
                      color: Color(0xFFFA3C24),
                      icon: FontAwesomeIcons.skull,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildCards(
                        label: 'Recovered',
                        value: globalCases != null ? globalCases.recovered : -1,
                        color: Color(0xFF54A06A),
                        icon: FontAwesomeIcons.solidCheckCircle),
                    SizedBox(
                      width: 20,
                    ),
                    buildCards(
                        label: 'Affected Countries',
                        value: countries != null ? countries.length : -1,
                        color: Color(0xFFB7A8C4),
                        icon: Icons.flag),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Last Updated: ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        convertSecToDate(globalCases == null
                            ? '-1'
                            : globalCases.lastUpdate),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height:100
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
