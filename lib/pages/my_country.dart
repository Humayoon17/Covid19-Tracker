import 'package:covid19tracker/data_provider/data_provider.dart';
import 'package:covid19tracker/models/models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'functions.dart';

class MyCountry extends StatefulWidget {
  @override
  _MyCountryState createState() => _MyCountryState();
}

class _MyCountryState extends State<MyCountry> {
  CountriesModel myCountry;

  @override
  void initState() {
    super.initState();
    DataProvider.getCountriesCases('afghanistan').then((myCountryCases) {
      if (this.mounted) {
        setState(() {
          myCountry = myCountryCases;
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
            child: Container(
              child: Column(
                children: <Widget>[

                  Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/images/af.jpg',
                          fit: BoxFit.cover)),
                  SizedBox(height: 20),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 10, bottom: 10),
                        child: Text('STAY HOME',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SpecialElite',
                                fontWeight: FontWeight.w600,
                                fontSize: 40)),
                      )),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 120, bottom: 20),
                    child: Text('STAY SAFE',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SpecialElite',
                            fontWeight: FontWeight.w600,
                            fontSize: 50)),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: <Widget>[
                              buildCards(
                                  label: 'Total Cases',
                                  value: myCountry != null
                                      ? myCountry.confirmed
                                      : -1,
                                  color: Color(0xFFD3B37D),
                                  icon: FontAwesomeIcons.home),
                              SizedBox(width: 20),
                              buildCards(
                                  label: 'Total Deaths',
                                  value:
                                      myCountry != null ? myCountry.deaths : -1,
                                  color: Color(0xFFFA3C24),
                                  icon: FontAwesomeIcons.skull),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                buildCards(
                                    label: 'Recovered',
                                    value: myCountry != null
                                        ? myCountry.recovered
                                        : -1,
                                    color: Color(0xFF54A06A),
                                    icon: FontAwesomeIcons.userCheck),
                                SizedBox(width: 20),
                                buildCards(
                                    label: 'Sick',
                                    value: myCountry != null
                                        ? (myCountry.confirmed -
                                            myCountry.recovered -
                                            myCountry.deaths)
                                        : -1,
                                    color: Colors.lightBlueAccent,
                                    icon: FontAwesomeIcons.hospitalUser),
                              ]),
                        ),
                        SizedBox(height: 20),
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
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  convertSecToDate(myCountry == null
                                      ? '-1'
                                      : myCountry.lastUpdate),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
