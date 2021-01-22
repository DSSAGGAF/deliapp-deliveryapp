import 'package:flutter/material.dart';
import 'package:Deli_App/model/orders.dart';
import 'package:Deli_App/pages/home.page.driver.dart';
import 'package:Deli_App/widget/orderList.dart';
String acceptedName;
String acceptedDescription;
String acceptedFrom;
String acceptedTo;
String acceptedPrice;

class DriverAcceptedOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Order Details'),
        ),
        body: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'You have accepted an order',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Wrap(children: <Widget>[
                Icon(Icons.title, size: 25, color: Colors.deepPurple),
                // Text(" Name")
                Text(" " + acceptedName)
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Wrap(children: <Widget>[
                Icon(Icons.description, size: 25, color: Colors.deepPurple),
                // Text(" Description"),
                Text(" " + acceptedDescription)
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Wrap(children: <Widget>[
                Icon(Icons.my_location, size: 25, color: Colors.deepPurple),
                // Text(" From")
                Text(" " + acceptedFrom)
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Wrap(children: <Widget>[
                Icon(Icons.location_on, size: 25, color: Colors.deepPurple),
                // Text(" To")
                Text(" " + acceptedTo)
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Wrap(children: <Widget>[
                Icon(Icons.attach_money, size: 25, color: Colors.deepPurple),
                // Text(" Price")
                Text(" " + acceptedPrice)
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 20, right: 40),
              child: OutlinedButton.icon(
                onPressed: () {
                  // Respond to button press
                },
                icon: Icon(Icons.notifications_active_outlined, size: 18),
                label: Text("Notify Customer"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 20, right: 40),
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DriverHomePage()));
                },
                icon: Icon(Icons.beenhere_outlined, size: 18),
                label: Text("Complete Order"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
