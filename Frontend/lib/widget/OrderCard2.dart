import 'package:flutter/material.dart';
import 'package:Deli_App/model/orders.dart';
import 'package:Deli_App/pages/driverAcceptedOrder.dart';
import 'package:Deli_App/widget/dialog.dart';
import "package:Deli_App/network/repository.dart";

class OrderCard2 extends StatelessWidget {
  dynamic orderCard;
  final Order order;
  OrderCard2(this.order);
  Repository _repository = Repository();

  @override
  Widget build(BuildContext context) {
    orderCard = new Container(
      // resizeToAvoidBottomPadding: false,
      // children: <Widget>[
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //       begin: Alignment.topRight,
      //       end: Alignment.bottomLeft,
      //       colors: [Colors.purple, Colors.deepPurple]),
      // ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 13, right: 13),
          child: Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                leading: Icon(Icons.shopping_bag, color: Colors.deepPurple),
                title: Text(order.requsetTitle),
                subtitle: Text("By " + order.userName),
              ),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 10, left: 10),
              //     child: Text(
              //       order.requsetFrom,
              //     ),
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 10, left: 10),
              //     child: Text(
              //       order.requsetTo,
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    order.requsetDesc + " For " + order.price.toString() + "RM",
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: Text("data"),
              // ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  Align(
                      // alignment: Alignment.bottomRight,
                      // child: order.orderStatus ? Text("Pinnding") : Text("Done"),
                      child: order.orderStatus == true
                          ? Text("Completed",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700))
                          : Text("Pending",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700))),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                      child: const Text('See more',
                          style: TextStyle(color: Colors.deepPurple)),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialogBox(
                                title: "Title - " + order.requsetTitle,
                                descriptions:
                                    "Description - " + order.requsetDesc,
                                orderFrom: "From - " + order.requsetFrom,
                                orderTo: "To - " + order.requsetTo,
                                price:
                                    "Price - " + order.price.toString() + "RM",
                                text: "",
                                orderID: order.orderId,
                                userID: order.userId,
                              );
                            });
                      },
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
    return new Stack(
      children: <Widget>[
        orderCard,
      ],
    );
  }
}