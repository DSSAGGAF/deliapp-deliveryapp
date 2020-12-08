import 'dart:async';
import 'api.dart';
import 'package:Deli_App/model/adduser.dart';

class Repository {
  final apiProvider = API();

  // Future<User> registerUser(String username, String firstname, String lastname, String password, String email)
  //   => apiProvider.registerUser(username, firstname, lastname, password, email);

  Future signinUser(String username, String password) =>
      apiProvider.loginUser(username, password);

  Future changemode(bool username) => apiProvider.changemode(username);

  Future getRequstedOrder() => apiProvider.getRequstedOrder();

  Future postRequest(int reqPrice, String reqTitle, String reqDesc,
      String reqFrom, String reqTo) => apiProvider.postRequest(reqPrice, reqTitle, reqDesc,
     reqFrom, reqTo);

  // Future getRequstedOrder()
  //   => apiProvider.getRequstedOrder();

  // Future<Null> addUserTask(String apiKey, String taskName, String deadline) async {
  //   apiProvider.addUserTask(apiKey, taskName, deadline);
  // }

}
