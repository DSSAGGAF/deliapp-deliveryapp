import 'package:flutter/material.dart';
import "package:Deli_App/network/repository.dart";
import "package:Deli_App/network/api.dart";
import 'package:Deli_App/widget/dialog.dart';
import 'package:geocoder/geocoder.dart';
import 'chatPage.dart';
import 'home.page.dart';
import 'package:Deli_App/widget/buildChatPageUser.dart';

convert(String query) async {
  var addresses = await Geocoder.local.findAddressesFromQuery(query);
  var first = addresses.first;
  coor = first.coordinates.toString();
  coor = coor.substring(1, coor.length - 1);
}

class CustAccOrder extends StatelessWidget {
  Repository _repository = Repository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(" Order Details"),
          backgroundColor: Colors.deepPurple,
        ),
        body: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Your order number " +
                      order.orderId.toString() +
                      " has been accepted",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Wrap(children: <Widget>[
                Icon(Icons.title, size: 25, color: Colors.deepPurple),
                Text(order.requsetTitle)
                // Text(" " + acceptedName)
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Wrap(children: <Widget>[
                Icon(Icons.description, size: 25, color: Colors.deepPurple),
                Text(" Description"),
                // Text(" " + acceptedDescription)
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Wrap(children: <Widget>[
                Icon(Icons.my_location, size: 25, color: Colors.deepPurple),
                GestureDetector(
                  child: Text(order.requsetFrom.toString()),
                  onTap: () async {
                    // convert(acceptedFrom);

                    // convert(acceptedFrom);
                    // if (await canLaunch(
                    //     "https://www.google.com/maps/place/" + coor)) {
                    //   await launch("https://www.google.com/maps/place/" + coor);
                    // }
                  },
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Wrap(children: <Widget>[
                Icon(Icons.location_on, size: 25, color: Colors.deepPurple),
                GestureDetector(
                  child: Text(order.requsetTo.toString()),
                  onTap: () async {
                    // convert(acceptedTo);

                    // convert(acceptedTo);
                    // if (await canLaunch(
                    //     "https://www.google.com/maps/place/" + coor)) {
                    //   await launch("https://www.google.com/maps/place/" + coor);
                    // }
                  },
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Wrap(children: <Widget>[
                Icon(Icons.attach_money, size: 25, color: Colors.deepPurple),
                Text(" Price"),
                Text(order.price.toString()),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 20, right: 40),
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BuildChatPage()));
                },
                icon: Icon(Icons.message, size: 18),
                label: Text("Chat with driver"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 20, right: 40),
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage()));
                },
                icon: Icon(Icons.arrow_back_ios, size: 18),
                label: Text("Back to main page"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
