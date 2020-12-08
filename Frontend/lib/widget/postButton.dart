import 'package:flutter/material.dart';
import "package:Deli_App/network/repository.dart";

class PostButton extends StatefulWidget {
  @override
  _PostButtonState createState() => _PostButtonState();
}

class _PostButtonState extends State<PostButton> {
  @override
  Repository _repository = Repository();
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: const EdgeInsets.only(right: 25.0),
        child: RaisedButton(
          onPressed: () {
            _repository.postRequest(
                5, "reqTitle", "reqDesc", "reqFrom", "reqTo");
          },
          child: const Text('Post', style: TextStyle(fontSize: 20)),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 5,
        ),
      ),
    );
  }
}
