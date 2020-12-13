import 'package:flutter/material.dart';
import 'package:Deli_App/model/orders.dart';
import 'package:Deli_App/widget/orderCard.dart';
import "package:Deli_App/network/repository.dart";

var orders = <Order>[];

class OrderList extends StatelessWidget {
  Repository _repository = Repository();
  Future<Null> _updateOrders() async {
    orders = await _repository.getRequstedOrder();
  }

  @override
  Widget build(BuildContext context) {
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
}
