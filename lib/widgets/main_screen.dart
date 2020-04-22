import 'package:covid19tracker/pages/pages.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;

  /// Bottom Navigation Items
  final List _bottomNavBarItem =<TabData> [
    TabData(iconData: FontAwesomeIcons.globeAmericas, title: 'World'),
    TabData(iconData: FontAwesomeIcons.flag, title: 'My Country'),
    TabData(iconData: FontAwesomeIcons.shieldAlt, title: 'Precaution')
  ];

  /// List for Body Items
  List _bodyItems = [
    HomePage(),
    MyCountry(),
    Precaution(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: _bodyItems[_currentIndex],
        bottomNavigationBar: FancyBottomNavigation(
          tabs: _bottomNavBarItem,

          textColor: Color(0xFF060A20),
          barBackgroundColor: Colors.white,
          initialSelection: 0,
          onTabChangedListener: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
