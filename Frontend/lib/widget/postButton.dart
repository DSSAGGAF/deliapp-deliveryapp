import 'package:flutter/material.dart';
import "package:Deli_App/network/repository.dart";
import 'package:Deli_App/widget/titleDesc.dart';
import 'package:Deli_App/widget/map.dart';
import 'package:Deli_App/widget/mapTo.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
                priceText.round(),
                titleController.text,
                descriptionController.text,
                addressData.addressLine,
                addressData2.addressLine);
            EasyLoading.showSuccess('Great Success!');
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
