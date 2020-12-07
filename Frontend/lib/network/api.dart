import 'dart:convert';

import 'package:http/http.dart';
import "package:Deli_App/model/addUser.dart";

class API {
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

  static Future<User> changemode(bool driverMode, int userID) async {
    final Response response = await post('http://10.0.2.2:5000/api/changeMode',
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "user_id": userID,
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
}
