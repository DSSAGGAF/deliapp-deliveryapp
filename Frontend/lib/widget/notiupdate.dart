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
                        _repository
                            .changeStatus(notifications[i].notificationId);
                        notifications[i].status = true;
                        // await notificationRepo.update(notification);

                        // if (notification.type ==
                        //     NotificationType.UserNotification) {
                        //   Navigator.of(context).push(
                        //       MaterialPageRoute(builder: (_) => OrdersPage()));
                        // } else {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (_) => PartnerOrdersPage()));
                        // }
                      },
                      leading: Icon(Icons.notifications),
                      title: Text(
                        notifications[i].notificationContent,
                        style: TextStyle(
                            color: notifications[i].status == false
                                ? Colors.black
                                : Colors.grey),
                      ),
                      // subtitle: Text("ff"),
                    );
                    // Align(
                    //           alignment: Alignment.centerRight,
                    //           child: Text(
                    //               "${Constants.dateformat1.format(notification.timeStamp)}",
                    //               style: TextStyle(fontSize: 10))),
                  },
                  separatorBuilder: (c, i) => Divider(),
                  itemCount: notifications.length),
                
                
                );
                
  }