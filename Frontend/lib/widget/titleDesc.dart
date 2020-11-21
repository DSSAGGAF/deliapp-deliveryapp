import 'package:flutter/material.dart';

class TitleDesc extends StatefulWidget {
  @override
  _TitleDescState createState() => _TitleDescState();
}

class _TitleDescState extends State<TitleDesc> {
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: Container(
            height: 300,
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
                )
              ],
            ),
          ),
    );
  }
}
