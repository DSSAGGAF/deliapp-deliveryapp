import 'package:flutter/material.dart';

class PostButton extends StatefulWidget {
  @override
  _PostButtonState createState() => _PostButtonState();
}

class _PostButtonState extends State<PostButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: const EdgeInsets.only(right: 25.0),
        child: RaisedButton(
          onPressed: () {},
          child: const Text('Post', style: TextStyle(fontSize: 20)),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 5,
        ),
      ),
    );
  }
}
