import 'package:Deli_App/pages/driverAcceptedOrder.dart';
import 'package:Deli_App/widget/orderList.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/services/base.dart';
import "package:Deli_App/network/repository.dart";
import "package:Deli_App/network/api.dart";

String coor;
Repository _repository = Repository();

convert(String query) async {
  // final query = "1600 Amphiteatre Parkway, Mountain View";
  var addresses = await Geocoder.local.findAddressesFromQuery(query);
  var first = addresses.first;
  coor = first.coordinates.toString();
  coor = coor.substring(1, coor.length - 1);
}

class Constants {
  Constants._();
  static const double padding = 10;
  static const double avatarRadius = 0;
}

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text, price, orderFrom, orderTo;
  final int orderID, userID;
  // final Image img;

  const CustomDialogBox(
      {Key key,
      this.title,
      this.descriptions,
      this.text,
      this.orderFrom,
      this.orderTo,
      this.orderID,
      this.userID,
      this.price})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                widget.descriptions,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 12,
              ),
              GestureDetector(
                child: Text(
                  widget.orderFrom,
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.left,
                ),
                onTap: () async {
                  //convert(widget.orderFrom);

                  convert(widget.orderFrom);
                  if (await canLaunch(
                      "https://www.google.com/maps/place/" + coor)) {
                    await launch("https://www.google.com/maps/place/" + coor);
                  }
                },
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                widget.orderTo,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                widget.price,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.left,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      _repository.postAccpted(widget.orderID);
                      _repository.postNotification(
                          userInfo.id,
                          widget.orderID,
                          "You have accepted order number " +
                              widget.orderID.toString());
                      _repository.postNotification(
                          widget.userID,
                          widget.orderID,
                          "Your order number " +
                              widget.orderID.toString() +
                              " have been accepted ");
                              
                      acceptedName = widget.title;
                      acceptedDescription = widget.descriptions;
                      acceptedFrom = widget.orderFrom;
                      acceptedTo = widget.orderTo;
                      acceptedPrice = widget.price;
                      acceptOrderId = widget.orderID;
                      customerId = widget.userID;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DriverAcceptedOrder()));
                    },
                    child: Text(
                      widget.text,
                      style: TextStyle(fontSize: 14),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
          ),
        ),
      ],
    );
  }
}
