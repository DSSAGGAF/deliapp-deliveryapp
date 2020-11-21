import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:login_minimalist/widget/map.dart';
import 'package:login_minimalist/widget/mapTo.dart';

class TextTo extends StatefulWidget {
  @override
  _TextToState createState() => _TextToState();
}

class _TextToState extends State<TextTo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 10.0),
      child: Container(
        //color: Colors.green,
        height: 200,
        width: 200,
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
            ),
            Center(
              child: Text(
                addressData2.addressLine,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


