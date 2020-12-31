import 'package:flutter/material.dart';
import 'dart:math' show cos, sqrt, asin;
import 'package:geocoder/geocoder.dart';
import 'package:Deli_App/widget/map.dart';
import 'package:Deli_App/widget/mapTo.dart';
import 'package:intl/intl.dart';

var f = new NumberFormat("###");
String textHolder = '0 RM';
final myController = TextEditingController();
// setState() {
//   textHolder = _coordinateDistance().toString() + " RM";
// }

double _coordinateDistance() {
  // var p = 0.017453292519943295;
  // var c = cos;
  // var a = 0.5 -
  //     c((toLatLng.latitude - fromLatLng.latitude) * p) / 2 +
  //     c(fromLatLng.latitude * p) *
  //         c(toLatLng.latitude * p) *
  //         (1 - c((toLatLng.longitude - fromLatLng.longitude) * p)) /
  //         2;
  // // return (12742 * asin(sqrt(a))) * 2.5;
  return 5;
}

@override
void dispose() {
  // Clean up the controller when the widget is removed from the
  // widget tree.
  myController.dispose();
  // super.dispose();
}

class TitleDesc extends StatefulWidget {
  @override
  _TitleDescState createState() => _TitleDescState();
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class _TitleDescState extends State<TitleDesc> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0),
      child: Container(
        height: 500,
        width: 100,
        child: Column(
          children: <Widget>[
            Container(
              height: 10,
            ),
            Center(
              child: Text(
                'Title',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 1,
            ),
            Center(
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  height: 2,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 3,
            ),
            Center(
              child: Text(
                'Price',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  height: 2,
                ),
              ),
            ),
            TextFormField(
              enableInteractiveSelection: false, // will disable paste operation
              focusNode: new AlwaysDisabledFocusNode(),
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.multiline,
              initialValue: f.format(_coordinateDistance()).toString() + ' RM',
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
