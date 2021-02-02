import 'dart:async';
import 'package:flutter/material.dart';
import "package:Deli_App/network/api.dart";
import 'package:Deli_App/pages/userOrderAccepted.dart';
import 'package:flutter/cupertino.dart';
import "package:Deli_App/network/repository.dart";

class BuildorderAcceptedPage extends StatefulWidget {
  @override
  _BuildorderAcceptedPage createState() => _BuildorderAcceptedPage();
}

StreamController _streamControllerBuild;
Stream _streamBuild;

class _BuildorderAcceptedPage extends State<BuildorderAcceptedPage> {
  Repository _repository = Repository();

  @override
  void initState() {
    super.initState();

    _streamControllerBuild = StreamController();
    _streamBuild = _streamControllerBuild.stream;
  }

  Timer timer;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _streamBuild,
      builder: (context, snapchot) {
        Widget widget;
        if (snapchot.hasData) {
          print(snapchot.data);
          return Container(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: CustAccOrder(),
            ),
          );
        } else {
          timer = new Timer(const Duration(seconds: 3), () {
            if (loadOrderSucceed == true) {
              _streamControllerBuild.add("order");
            } else {
              _repository.getAcceptedOrderforUser();
              _streamControllerBuild.add(null);
            }
          });
          print(snapchot.data);
          widget = Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return widget;
      },
    );
  }
}
