import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:http/http.dart';
import "package:Deli_App/model/addUser.dart";
import "package:Deli_App/model/orders.dart";
import 'package:shared_preferences/shared_preferences.dart';

int user_id;

class API {
  Client client = Client();
  static Future<User> createUser(String name, String pass, String email,
      String fname, String lname, String gender) async {
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
      //print(response.body);
      return User.fromJson(json.decode(response.body));
    } else {
      ///print('Error');
      throw Exception("Can't load author");
    }
  }

  String uname(String name) {
    return name;
  }

  Future<User> changemode(bool driverMode) async {
    final Response response = await post('http://10.0.2.2:5000/api/changeMode',
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "user_id": user_id,
          "driver_mode": driverMode,
        }));
    if (response.statusCode == 201) {
      //print(response.body);
      return User.fromJson(json.decode(response.body));
    } else {
      ///print('Error');
      throw Exception("Can't load author");
    }
  }

<<<<<<< HEAD
  static Future<User> postRequest(int reqPrice, String reqTitle, String reqDesc,
      String reqFrom, String reqTo) async {
    final Response response = await post('http://10.0.2.2:5000/api/postRequest',
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{}));
    if (response.statusCode == 201) {
      //print(response.body);
      return User.fromJson(json.decode(response.body));
    } else {
      ///print('Error');
      throw Exception("Can't load author");
    }
  }
=======
  Future<User> loginUser(String username, String password) async {
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
      // If the call to the server was successful, parse the JSON
      // return User.fromJson(json.decode(response.body));
      // await saveUserID(result["data"]["user_id"]);.
      user_id = result["data"];
      // saveUserID(user_id);

    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  saveUserID(int user_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', user_id.toString());
  }

<<<<<<< HEAD
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
      // for (Order order in orders) {
      //   print(order.orderId);
      //   print(order.userId);
      //   print(order.requsetTitle);
      //   print(order.requsetDesc);
      //   print(order.requsetFrom);
      //   print(order.requsetTo);
      //   print(order.price);
      // }
      return orders;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load tasks');
    }
  } //Order

} // API
=======
>>>>>>> eee57e8ecb0db60c22208070f418a84422fe2631
}
>>>>>>> c545b90320d1fbf7bb2b193d09028227242e4114
