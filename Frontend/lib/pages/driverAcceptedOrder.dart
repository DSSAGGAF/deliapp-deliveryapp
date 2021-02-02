import 'package:flutter/material.dart';
import 'package:Deli_App/pages/home.page.driver.dart';
import "package:Deli_App/network/repository.dart";
import 'package:Deli_App/widget/dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geocoder/geocoder.dart';
import "package:Deli_App/network/api.dart";
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _showNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
          'your channel id', 'your channel name', 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker');
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
      0, 'plain title', 'plain body', platformChannelSpecifics,
      payload: 'item x');
}

String acceptedName;
String acceptedDescription;
String acceptedFrom;
String acceptedTo;
String acceptedPrice;
int acceptOrderId;
int customerId;

convert(String query) async {
  var addresses = await Geocoder.local.findAddressesFromQuery(query);
  var first = addresses.first;
  coor = first.coordinates.toString();
  coor = coor.substring(1, coor.length - 1);
}

class DriverAcceptedOrder extends StatelessWidget{
  Repository _repository = Repository();

  @override
  Widget build(BuildContext context) {
    _repository.postNotification(userInfo.id, acceptOrderId,
        "You have accepted order number " + acceptOrderId.toString());
    // sleep(Duration(seconds:3));
    _repository.postNotification(
        customerId,
        acceptOrderId,
        "Your order number " +
            acceptOrderId.toString() +
            " have been accepted ");
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
                GestureDetector(
                  child: Text(" " + acceptedFrom),
                  onTap: () async {
                    convert(acceptedFrom);

                    convert(acceptedFrom);
                    if (await canLaunch(
                        "https://www.google.com/maps/place/" + coor)) {
                      await launch("https://www.google.com/maps/place/" + coor);
                    }
                  },
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Wrap(children: <Widget>[
                Icon(Icons.location_on, size: 25, color: Colors.deepPurple),
                GestureDetector(
                  child: Text(" " + acceptedTo),
                  onTap: () async {
                    convert(acceptedTo);

                    convert(acceptedTo);
                    if (await canLaunch(
                        "https://www.google.com/maps/place/" + coor)) {
                      await launch("https://www.google.com/maps/place/" + coor);
                    }
                  },
                ),
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
                onPressed: () async {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ChatPage()));
                  await _showNotification();
                },
                icon: Icon(Icons.beenhere_outlined, size: 18),
                label: Text("Send a message"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 20, right: 40),
              child: OutlinedButton.icon(
                onPressed: () {
                  _repository.postNotification(customerId, acceptOrderId,
                      "Your driver Arrived please go recive ur order");
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
                  _repository.completeOrder(acceptOrderId);
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
