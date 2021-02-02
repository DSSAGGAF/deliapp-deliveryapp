import "package:Deli_App/network/repository.dart";
import 'package:Deli_App/model/notification.dart';
import 'package:flutter/material.dart';

var notifications = <Notification1>[];
Repository _repository = Repository();

Future<Null> _updateNotification() async {
  notifications = await _repository.getNotification();
}

@override
Widget build(BuildContext context) {
  _updateNotification();
  return new Flexible(
    child: ListView.separated(
        itemBuilder: (context, i) {
          final notification = notifications[i];
          return ListTile(
            onTap: () async {
              _repository.changeStatus(notifications[i].notificationId);
              notifications[i].status = true;
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
        itemCount: notifications.length),
  );
}
