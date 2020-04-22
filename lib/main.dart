import 'package:covid19tracker/widgets/main_screen.dart';
import 'package:flutter/material.dart';

 void main() {

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF131053),
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
