import 'package:flutter/material.dart';
import 'package:Deli_App/model/orders.dart';
import 'package:Deli_App/widget/orderCard2.dart';
import "package:Deli_App/network/repository.dart";
import 'package:Deli_App/network/api.dart';
import 'package:rxdart/rxdart.dart';

var orders = <Order>[];

class OrderListAcceptedDriver extends StatelessWidget {
  Repository _repository = Repository();
  Future<Null> _updateOrders() async {
    if (userInfo != null) {
      orders = await _repository.getAcceptedOrderDriver();
    }
  }
 final _orderSubject = BehaviorSubject<List<Order>>();
  OrderListAcceptedDriver() {
    _updateOrders().then((_) {
      _orderSubject.add(orders);
    });
  }
  Stream<List<Order>> getOrders() async* {
    await _updateOrders().then((_) {
      _orderSubject.add(orders);
    });
  }
Widget _buildReorderableListSimple(
      BuildContext context, List<Order> orderList) {
    return new Flexible(
      child: new Container(
        child: new ListView.builder(
          itemExtent: 160.0,
          itemCount: orderList.length,
          itemBuilder: (_, index) => OrderCard2(orderList[index]),
        ),
      ),
    );
  }
   @override
  Widget build(BuildContext context) {
    //getOrders();
    return StreamBuilder<List<Order>>(
      // Wrap our widget with a StreamBuilder

      stream: _orderSubject, // pass our Stream getter here
      initialData: [], // provide an initial data
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot != null) {
          if (snapshot.data.length > 0) {
            return _buildReorderableListSimple(context, snapshot.data);
          } else if (snapshot.data.length == 0) {
            return Center(child: Text('No Data'));
          }
        } else if (snapshot.hasError) {
          return Container();
        }

        return CircularProgressIndicator();
      },

      // access the data in our Stream here
    );
  }
}
