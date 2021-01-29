import 'package:flutter/material.dart';
import 'dart:math' show cos, sqrt, asin;
import 'package:geocoder/geocoder.dart';
import 'package:Deli_App/widget/map.dart';
import 'package:Deli_App/widget/mapTo.dart';
import 'package:intl/intl.dart';

var f = new NumberFormat("###");
String textHolder = '0 RM';
// void changepls() {
// setState() {
//   textHolder = _coordinateDistance().toString() + " RM";
// }
// }

double _coordinateDistance() {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((toLatLng.latitude - fromLatLng.latitude) * p) / 2 +
      c(fromLatLng.latitude * p) *
          c(toLatLng.latitude * p) *
          (1 - c((toLatLng.longitude - fromLatLng.longitude) * p)) /
          2;
  return (12742 * asin(sqrt(a))) * 12;
  // return 5;
}

class TitleDesc extends StatefulWidget {
  @override
  _TitleDescState createState() => _TitleDescState();
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

final titleController = TextEditingController();
final descriptionController = TextEditingController();
final priceController = TextEditingController();

class _TitleDescState extends State<TitleDesc> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Container(
        height: 300,
        width: 100,
        child: Column(
          children: <Widget>[
            Container(
              height: 10,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: titleController,
                  decoration: new InputDecoration(
                    icon: new Icon(Icons.title),
                    labelText: 'Add title',
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: descriptionController,
                  decoration: new InputDecoration(
                    icon: new Icon(Icons.description),
                    labelText: 'Add Description',
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
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
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: TextField(
                // controller: priceController,
                enableInteractiveSelection:
                    false, // will disable paste operation
                focusNode: new AlwaysDisabledFocusNode(),
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.multiline,
                controller: priceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: textHolder,
                ),
                onTap: () => changepls(),
              ),
            ),
            // Center(
            //   child: RaisedButton(
            //     onPressed: changepls(),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  changepls() {
    setState(() {
      textHolder = f.format(_coordinateDistance()).toString() + 'RM';
    });
  }
}
double priceText = _coordinateDistance();
