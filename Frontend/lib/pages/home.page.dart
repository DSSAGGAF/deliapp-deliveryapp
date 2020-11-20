import 'package:flutter/material.dart';
import 'package:login_minimalist/pages/login.page.dart';
import 'package:login_minimalist/widget/constants.dart';
import 'package:login_minimalist/pages/profile.page.dart';
import 'package:login_minimalist/widget/tabBar.dart';
import 'package:login_minimalist/widget/TEST/MotionTabBarView.dart';
import 'package:login_minimalist/widget/TEST/MotionTabController.dart';
import 'package:login_minimalist/widget/TEST/motiontabbar.dart';
import 'package:login_minimalist/pages/home.page.driver.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  MotionTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
 GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
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
                    title: "Do you want to sewitch to a driver?",
                    content: "",
                    yesOnPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DriverHomePage()),);
                    },
                    noOnPressed: () {
                      Navigator.pop(context);
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
              child: Center(
                child: Text("Notification"),
              ),
            ),
            Container(
              
              child: Center(
                  
              ),
            ),
            Container(
              child: Center(
                child: Text("My Order"),
              ),
            ),
          ],
        )
        //body:
        //  new MenuTabBar(
        //   background: Colors.blue,
        //   iconButtons: [
        //     new IconButton(
        //         color: Colors.blue,
        //         icon: new Icon(Icons.notifications, size: 30),
        //         onPressed: () {}),
        //     // new IconButton(color: Colors.blue, icon: new Icon(Icons.search, size: 30), onPressed: (){}),
        //     // new IconButton(color: Colors.blue, icon: new Icon(Icons.map, size: 30), onPressed: (){}),
        //     new IconButton(
        //         color: Colors.blue,
        //         icon: new Icon(Icons.add_shopping_cart, size: 30),
        //         onPressed: () {}),
        //   ],
        //   child: new Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         new Container(
        //             child: new Text("Reminder",
        //                 style: TextStyle(color: Colors.white, fontSize: 20)),
        //             margin: EdgeInsets.all(10)),
        //         new Container(
        //             child: new Text("Camera",
        //                 style: TextStyle(color: Colors.white, fontSize: 20)),
        //             margin: EdgeInsets.all(10)),
        //         new Container(
        //             child: new Text("Attchment",
        //                 style: TextStyle(color: Colors.white, fontSize: 20)),
        //             margin: EdgeInsets.all(10)),
        //         new Container(
        //             child: new Text("Text Note",
        //                 style: TextStyle(color: Colors.white, fontSize: 20)),
        //             margin: EdgeInsets.all(10))
        //       ]),
        // )
        // const Center(
        //   child: Text(
        //     'thanks for signing in',
        //     style: TextStyle(fontSize: 24),

        //   ),
        // ),

        // floatingActionButton: FloatingActionButton(
        //   //onPressed: ,
        //   child: Icon(Icons.add_location),

        //),

        //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
  }

  void choiceAction(String choice) {
    if (choice == Constants.profile) {
      {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilePage()));
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
