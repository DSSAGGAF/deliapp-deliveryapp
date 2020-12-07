import 'package:flutter/material.dart';
import 'package:Deli_App/model/orders.dart';

class OrderCard extends StatelessWidget {
  dynamic orderCard;
  final Order order;
  OrderCard(this.order);

  @override
  Widget build(BuildContext context) {
    orderCard = new Container(
      margin: const EdgeInsets.only(left: 72.0, right: 24.0),
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
        margin: const EdgeInsets.only(top: 16.0, left: 72.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              "user name",
              style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 25.0),
            ),
            new Text(order.requsetTitle,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.red,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 25.0)),
            new Container(
                color: const Color(0xFF00C6FF),
                width: 24.0,
                height: 1.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0)),
            new Row(
              children: <Widget>[
                new Icon(Icons.location_on, size: 18.0, color: Colors.red),
                new Text(order.requsetFrom,
                    style: TextStyle(color: Colors.red, fontSize: 25.0)),
                new Container(width: 24.0),
                new Icon(Icons.location_city, size: 18.0, color: Colors.red),
                new Text(order.requsetTo,
                    style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 25.0)),
              ],
            )
          ],
        ),
      ),
    );
    return new Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: new Stack(
        children: <Widget>[
          orderCard,
        ],
      ),
    );
  }
}
