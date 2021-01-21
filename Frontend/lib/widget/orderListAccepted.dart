import 'package:flutter/material.dart';
import 'package:Deli_App/model/orders.dart';
import 'package:Deli_App/widget/orderCard.dart';
import "package:Deli_App/network/repository.dart";

var orders = <Order>[];

class OrderListAccepted extends StatelessWidget {
  Repository _repository = Repository();
  Future<Null> _updateOrders() async {
    orders = await _repository.getAcceptedOrder();
  }

  Stream<int> imgStream = (() async* {
    await Future<void>.delayed(Duration(seconds: 1));
    yield 1;
    await Future<void>.delayed(Duration(seconds: 1));
  })();

  @override
  Widget build(BuildContext context) {
    StreamBuilder<int> builder = new StreamBuilder(
        stream: imgStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return new Text("data");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            _updateOrders();
            return new Flexible(
              child: new Container(
                child: new ListView.builder(
                  itemExtent: 160.0,
                  itemCount: orders.length,
                  itemBuilder: (_, index) => OrderCard(orders[index]),
                ),
              ),
            );
          }
        });
  }
}
