import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Precaution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('PRECAUTIONS',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'SpecialElite',
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Developer Information',
                            style: TextStyle(
                                fontFamily: 'SpecialElite',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.person),
                          title: Text(
                            'Humayoon Muhammadi',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Name'),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.email),
                          title: Text(

                            'Humayoon_muhammadi@yahoo.com',
                            softWrap: true,
                            style: TextStyle(fontWeight: FontWeight.bold,

                            ),
                          ),
                          subtitle: Text('Email'),
                        ),

                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.local_phone),
                          title: Text(
                            '+93 (0) 729072966',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Contact'),
                        ),

                        ListTile(
                          onTap: () {},
                          leading: Icon(FontAwesomeIcons.github),
                          title: Text(
                            'Humayoon17',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Github'),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.my_location),
                          title: Text(
                            'Kabul, Afghanistan',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Address'),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  _buildInstruction(
                      image: Image.asset('assets/precaution/mask.png'),
                      label: 'Use a medical face mask'),
                  _buildInstruction(
                      image: Image.asset('assets/precaution/wash_hand.png'),
                      label: 'Wash your hands thoroghly'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  _buildInstruction(
                      image: Image.asset('assets/precaution/hand_shake.png'),
                      label: 'Avoid physical contact'),
                  _buildInstruction(
                      image: Image.asset('assets/precaution/alchol.png'),
                      label: 'Use an alchol-based gel'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  _buildInstruction(
                      image: Image.asset('assets/precaution/quarantine.png'),
                      label: '14-Days self-quarantine'),
                  _buildInstruction(
                      image: Image.asset('assets/precaution/corona_virus.png'),
                      label: 'Coronavirus COVID-19'),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstruction({Widget image, String label}) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 150,
            height: 150,
            child: image,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '$label',
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
