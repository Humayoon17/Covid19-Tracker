import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildCards({String label, dynamic value, Color color, IconData icon}) {
  return Expanded(
    flex: 1,
    child: Container(
      height: 90,
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: BorderSide(style: BorderStyle.none)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  color: color,
                  size: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                RichText(
                  text: TextSpan(
                    text: label,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
//            value == -1 ? CircularProgressIndicator(
//
//            ) :
            Text(
              value == -1 ? '---' : '$value',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w900,
                fontSize: 19,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

String convertSecToDate(String updated) {
  if (updated == '-1') {
    return '---';
  } else {
    final rawDate = DateTime.parse(updated).toLocal();
    var dateFormat = new DateFormat('yyyy-MM-dd');
    var timeFormat = new DateFormat('hh-mm-a');
    final date = dateFormat.format(rawDate);
    final time = timeFormat.format(rawDate);
    return '$date, $time';
  }
}
