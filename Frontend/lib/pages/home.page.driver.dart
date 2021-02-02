import 'package:Deli_App/widget/orderList.dart';
import 'package:Deli_App/widget/orderListAcceptedDriver.dart';
import 'package:flutter/material.dart';
import 'package:Deli_App/pages/login.page.dart';
import 'package:Deli_App/widget/constants.dart';
import 'package:Deli_App/pages/profile.page.dart';
import 'package:Deli_App/pages/home.page.dart';
import 'package:Deli_App/widget/TEST/MotionTabBarView.dart';
import 'package:Deli_App/widget/TEST/MotionTabController.dart';
import 'package:Deli_App/widget/TEST/motiontabbar.dart';
import "package:Deli_App/network/repository.dart";
import 'package:Deli_App/model/notification.dart';
import 'package:Deli_App/widget/notificationList.dart';

class DriverHomePage extends StatefulWidget {
  @override
  _DriverHomePageState createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage>
    with TickerProviderStateMixin {
  MotionTabController _tabController;
  Repository _repository = Repository();
  var notifications = <Notification1>[];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Driver Page"),
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
              icon: Icon(Icons.supervised_user_circle),
              onPressed: () {
                var baseDialog = BaseAlertDialog(
                    title: "Do you want to sewitch to a regluer user?",
                    content: "",
                    yesOnPressed: () {
                      _repository.changemode(false);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
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
          labels: ["Notification", "Live Feed", "My Order"],
          initialSelectedTab: "Live Feed",
          tabIconColor: Colors.deepPurple,
          tabSelectedColor: Colors.deepPurpleAccent,
          onTabItemSelected: (int value) {
            print(value);
            setState(() {
              _tabController.index = value;
            });
          },
          icons: [
            Icons.notifications,
            Icons.play_circle_filled,
            Icons.shopping_cart
          ],
          textStyle: TextStyle(color: Colors.red),
        ),
        body: MotionTabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              child: NotificationList(),
            ),
            GestureDetector(
              // onTap: () => setState(() {
              //   OrderList().getOrders();
              // }),
              child: OrderList().build(context),
            ),
            GestureDetector(
              onTap: () => setState(() {
                OrderListAcceptedDriver().getOrders();
              }),
              child: OrderListAcceptedDriver().build(context),
            ),
          ],
        )
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
