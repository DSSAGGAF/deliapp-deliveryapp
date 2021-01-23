import 'package:flutter/material.dart';
import 'package:Deli_App/model/orders.dart';
import 'package:Deli_App/widget/orderCard.dart';
import 'package:Deli_App/widget/OrderListAcceptedDriver.dart';
import "package:Deli_App/network/repository.dart";
import 'package:Deli_App/model/notification.dart';
import 'package:rxdart/rxdart.dart';
import 'package:Deli_App/network/api.dart';

var notifications = <Notification1>[];

class NotificationList extends StatefulWidget {

  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  Repository _repository = Repository();
  _NotificationListState() {
    _updateNotification().then((_) {
      _notificationSubject.add(notifications);
    });
  }
  Future<Null> _updateNotification() async {
    if (userInfo != null) {
      notifications = await _repository.getNotification();
    }
  }

  final _notificationSubject = BehaviorSubject<List<Notification1>>();

  Stream<List<Order>> getOrders() async* {
    await _updateNotification().then((_) {
      _notificationSubject.add(notifications);
    });
  }

  @override
  Widget _buildReorderableListSimple(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, i) {
          final notification = notifications[i];
          return ListTile(
            onTap: () async {
              setState(() {
                getOrders();
              });
              notifications[i].status = true;
              _repository.changeStatus(notifications[i].notificationId);
            },
            leading: Icon(Icons.notifications),
            title: Text(
              notifications[i].notificationContent,
              style: TextStyle(
                  color: notifications[i].status == false
                      ? Colors.black
                      : Colors.grey),
            ),
          );
        },
        separatorBuilder: (c, i) => Divider(),
        itemCount: notifications.length);
  }

  Widget build(BuildContext context) {
    //getOrders();
    return StreamBuilder<List<Notification1>>(
      // Wrap our widget with a StreamBuilder

      stream: _notificationSubject, // pass our Stream getter here
      initialData: [], // provide an initial data
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot != null) {
          if (snapshot.data.length > 0) {
            return _buildReorderableListSimple(context);
          } else if (snapshot.data.length == 0) {
            return Center(child: Text('No Data'));
          }
        } else if (snapshot.hasError) {
          return Container();
        }

        return CircularProgressIndicator();
      },

      // access the data in our Stream here
    );
  }
}
