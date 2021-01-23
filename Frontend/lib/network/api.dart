import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:http/http.dart';
import "package:Deli_App/model/addUser.dart";
import "package:Deli_App/model/orders.dart";
import "package:Deli_App/model/notification.dart";

User userInfo;

class API {
  Client client = Client();

  Future createUser(String name, String fname, String lname, String pass, String email,
      String gender) async {
    final Response response = await post('http://10.0.2.2:5000/api/register',
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "username": name,
          "emailadress": email,
          "password": pass,
          "gender": gender,
          "firstname": fname,
          "lastname": lname,
        }));
    if (response.statusCode == 201) {
      // return User.fromJson(json.decode(response.body));
    } else {
      ///print('Error');
      throw Exception("Can't load author");
    }
  }
 
  Future loginUser(String username, String password) async {
    final Response response = await post("http://10.0.2.2:5000/api/login",
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "username": username,
          "password": password,
        }));
    final Map result = json.decode(response.body);
    if (response.statusCode == 201) {

      userInfo = User.fromJson(result["data"]);

    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future userProfile() async {
    final Response response = await post('http://10.0.2.2:5000/api/userProfile',
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "user_id": userInfo.id,
          "emailadress": userInfo.email,
          "password": userInfo.pass,
          "firstname": userInfo.fname,
          "lastname": userInfo.lname,
        }));
    if (response.statusCode == 201) {
      // return User.fromJson(json.decode(response.body));
    } else {
      ///print('Error');
      throw Exception("Can't load author");
    }
  }
 Future changemode(bool driverMode) async {
    final Response response = await post('http://10.0.2.2:5000/api/changeMode',
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "user_id": userInfo.id,
          "driver_mode": driverMode,
        }));
    if (response.statusCode == 201) {
      //print(response.body);
      // return User.fromJson(json.decode(response.body));
    } else {
      ///print('Error');
      throw Exception("Can't load author");
    }
  }

  Future postRequest(int reqPrice, String reqTitle, String reqDesc,
      String reqFrom, String reqTo) async {
    final Response response = await post(
        'http://10.0.2.2:5000/api/requset_order',
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "user_id": userInfo.id,
          "request_title": reqTitle,
          "request_desc": reqDesc,
          "request_from": reqFrom,
          "request_to": reqTo,
          "price": reqPrice,
        }));
    if (response.statusCode == 201) {
      // return User.fromJson(json.decode(response.body));
    } else {
      ///print('Error');
      throw Exception("Can't load author");
    }
  }

  Future postAccpted(int orderID) async {
    final Response response = await post(
        'http://10.0.2.2:5000/api/accpet_order',
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "driver_id": userInfo.id,
          "order_id": orderID
        }));
    if (response.statusCode == 201) {
      // return User.fromJson(json.decode(response.body));
    } else {
      ///print('Error');
      throw Exception("Can't load author");
    }
  }



  Future<List<Order>> getRequstedOrder() async {
    final Response response = await get(
      'http://10.0.2.2:5000/api/requset_order',
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8'
      },
    );
    final Map result = json.decode(response.body);
    if (response.statusCode == 201) {
      List<Order> orders = [];
      for (Map json_ in result["data"]) {
        try {
          orders.add(Order.fromJson(json_));
        } catch (Exception) {
          print(Exception);
        }
      }
      return orders;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load tasks');
    }
  } //Order

  Future<List<Order>> getAcceptedOrder() async {
    final Response response = await get('http://10.0.2.2:5000/api/myOrderUser?user_id=${userInfo.id}',
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        );
    final Map result = json.decode(response.body);
    if (response.statusCode == 201) {
      List<Order> orders = [];
      for (Map json_ in result["data"]) {
        try {
          orders.add(Order.fromJson(json_));
        } catch (Exception) {
          print(Exception);
        }
      }
      return orders;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load tasks');
    }
  } //getAcceptedOrder

  Future<List<Order>> getAcceptedOrderDriver() async {
    final Response response = await get(
        'http://10.0.2.2:5000/api/myOrderDriver?user_id=${userInfo.id}',
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        }
        );
    final Map result = json.decode(response.body);
    if (response.statusCode == 201) {
      List<Order> orders = [];
      for (Map json_ in result["data"]) {
        try {
          orders.add(Order.fromJson(json_));
        } catch (Exception) {
          print(Exception);
        }
      }
      return orders;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load tasks');
    }
  } //getAcceptedOrder

  Future postNotification(
      int userID, int orderID, String notificationContent) async {
    final Response response = await post(
        'http://10.0.2.2:5000/api/notification',
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "user_id": userID,
          "order_id": orderID,
          "notification_content": notificationContent
        }));
    if (response.statusCode == 201) {
      // return Notification.fromJson(result["data"]);
    } else {
      print(response);
      throw Exception("Can't load author");
    }
  } //postNotification

  Future<List<Notification1>> getNotification() async {
    final Response response = await get(
      'http://10.0.2.2:5000/api/notification?user_id=${userInfo.id}',
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8'
      },
    );
    final Map result = json.decode(response.body);
    if (response.statusCode == 201) {
      List<Notification1> notification = [];
      for (Map json_ in result["data"]) {
        try {
          notification.add(Notification1.fromJson(json_));
        } catch (Exception) {
          print(Exception);
        }
      }
      return notification;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load tasks');
    }
  } //getNotification()

    Future changeStatus(int notiID) async {
    final Response response = await post('http://10.0.2.2:5000/api/NotificationSeen',
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "notification_id": notiID,
        }));
    if (response.statusCode == 201) {
      // return User.fromJson(json.decode(response.body));
    } else {
      ///print('Error');
      throw Exception("Can't load author");
    }
  }
    Future completeOrder(int orderId) async {
    final Response response = await post('http://10.0.2.2:5000/api/Complete_Order',
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "order_id": orderId,
        }));
    if (response.statusCode == 201) {
      // return User.fromJson(json.decode(response.body));
    } else {
      ///print('Error');
      throw Exception("Can't load author");
    }
  }

} // API
