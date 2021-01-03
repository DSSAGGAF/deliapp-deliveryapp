import 'package:flutter/material.dart';
import 'package:Deli_App/model/orders.dart';
import 'package:Deli_App/widget/dialog.dart';
import "package:Deli_App/network/repository.dart";


class OrderCard extends StatelessWidget {
  dynamic orderCard;
  final Order order;
  OrderCard(this.order);
  Repository _repository = Repository();
  

  @override
  Widget build(BuildContext context) {
    orderCard = new Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: new BoxDecoration(
        color: Colors.deepPurple,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0))
        ],
      ),
      child: new Container(
        margin: const EdgeInsets.only(top: 20.0, left: 20.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              order.userName,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  // fontWeight: FontWeight.w600,
                  fontSize: 25.0),
            ),
            SizedBox(
              height: 12,
            ),
            new Container(
                color: const Color(0xFF00C6FF),
                width: 250.0,
                height: 1.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0)),
            SizedBox(
              height: 12,
            ),
            new FittedBox(child: Text(
                order.requsetTitle +
                    " - " +
                    order.price.toString() +
                    "RM",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    // fontWeight: FontWeight.w600,
                    fontSize: 25.0),),),
          ],
        ),
      ),
    );
    return new Container(
 
      // height: 120.0,
      margin: const EdgeInsets.only(top: 18),
      child: new FlatButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialogBox(
                  title: "Title - " + order.requsetTitle,
                  descriptions: "Description - " + order.requsetDesc,
                  orderFrom: "From - " + order.requsetFrom,
                  orderTo: "To - " + order.requsetTo,
                  price: "Price - " + order.price.toString() + "RM",
                  text: "Accept",
                  orderID: order.orderId,                  
                  userID: order.userId,
                );
              });
        },
        child: new Stack(
          children: <Widget>[
            orderCard,
          ],
        ),
      ),
    );
  }
}
