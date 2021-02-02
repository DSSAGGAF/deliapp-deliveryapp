import 'package:flutter/material.dart';
import 'package:Deli_App/pages/login.page.dart';
import 'package:Deli_App/widget/constants.dart';
import 'package:Deli_App/pages/profile.page.dart';
import 'package:Deli_App/widget/TEST/MotionTabBarView.dart';
import 'package:Deli_App/widget/TEST/MotionTabController.dart';
import 'package:Deli_App/widget/TEST/motiontabbar.dart';
import 'package:Deli_App/pages/home.page.driver.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Deli_App/widget/map.dart';
import 'package:Deli_App/widget/mapTo.dart';
import 'package:location/location.dart';
import 'package:Deli_App/widget/titleDesc.dart';
import 'package:Deli_App/widget/postButton.dart';
import "package:Deli_App/network/repository.dart";
import 'package:Deli_App/widget/orderListAccepted.dart';
import 'package:Deli_App/widget/notificationList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  MotionTabController _tabController;
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  String userID = "";
  Repository _repository = Repository();

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
    _tabController = MotionTabController(initialIndex: 1, vsync: this);
  }

  // Check Location Permissions, and get my location
  void _checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    // _updateNotification();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(" Coustomer Home page"),
          backgroundColor: Colors.deepPurple,
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                _repository.getBalance();
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.directions_car),
              onPressed: () {
                var baseDialog = BaseAlertDialog(
                    title: "Do you want to switch to a driver?",
                    content: "",
                    yesOnPressed: () {
                      // userID = await getUserID();
                      _repository.changemode(true);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DriverHomePage()),
                      );
                    },
                    noOnPressed: () {
                      Navigator.pop(context);
                      _repository.getNotification();
                    },
                    yes: "Yes",
                    no: "No!");
                showDialog(
                    context: context,
                    builder: (BuildContext context) => baseDialog);
              },
            );
          }),
        ),
        bottomNavigationBar: MotionTabBar(
          labels: ["Notification", "Home", "My Order"],
          initialSelectedTab: "Home",
          tabIconColor: Colors.deepPurple,
          tabSelectedColor: Colors.deepPurpleAccent,
          onTabItemSelected: (int value) {
            print(value);
            setState(() {
              _tabController.index = value;
            });
          },
          icons: [Icons.notifications, Icons.add_box, Icons.shopping_cart],
          textStyle: TextStyle(color: Colors.red),
        ),
        body: MotionTabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              child: NotificationList(),
            ),
            Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        onTap: () => _locationData != null
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GooMap(
                                          location: _locationData,
                                        )))
                            : null,
                        showCursor: true,
                        readOnly: true,
                        focusNode: FocusNode(),
                        enableInteractiveSelection: false,
                        decoration: new InputDecoration(
                          icon: new Icon(Icons.location_searching),
                          labelText: addressData == null
                              ? 'Click to add a start location'
                              : addressData.addressLine.toString(),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          onTap: () => _locationData != null
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GooMapTo(
                                            location: _locationData,
                                          )))
                              : null,
                          showCursor: true,
                          readOnly: true,
                          focusNode: FocusNode(),
                          enableInteractiveSelection: false,
                          decoration: new InputDecoration(
                            icon: new Icon(Icons.add_location),
                            labelText: addressData2 == null
                                ? 'Click to add a destination'
                                : addressData2.addressLine.toString(),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TitleDesc(),
                  PostButton(),
                ],
              ),
            ),
            Container(
                child: Column(
              children: <Widget>[new OrderListAccepted()],
            )),
          ],
        ));
  }

  void choiceAction(String choice) {
    if (choice == Constants.profile) {
      {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilePage()));
        _repository.getBalance();
      }
    } else if (choice == Constants.SignOut) {
      {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    } else if (choice == Constants.aboutUs) {}
  }
}

class BaseAlertDialog extends StatelessWidget {
  //When creating please recheck 'context' if there is an error!

  Color _color = Color.fromARGB(220, 117, 218, 255);

  String _title;
  String _content;
  String _yes;
  String _no;
  Function _yesOnPressed;
  Function _noOnPressed;

  BaseAlertDialog(
      {String title,
      String content,
      Function yesOnPressed,
      Function noOnPressed,
      String yes = "Yes",
      String no = "No"}) {
    this._title = title;
    this._content = content;
    this._yesOnPressed = yesOnPressed;
    this._noOnPressed = noOnPressed;
    this._yes = yes;
    this._no = no;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(this._title),
      content: new Text(this._content),
      backgroundColor: this._color,
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      actions: <Widget>[
        new FlatButton(
          child: new Text(this._yes),
          textColor: Colors.greenAccent,
          onPressed: () {
            this._yesOnPressed();
          },
        ),
        new FlatButton(
          child: Text(this._no),
          textColor: Colors.redAccent,
          onPressed: () {
            this._noOnPressed();
          },
        ),
      ],
    );
  }
}
