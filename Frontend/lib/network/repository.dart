import 'dart:async';
import 'api.dart';

class Repository {
  final apiProvider = API();

  Future createUser(String username, String firstname, String lastname, String password, String email, String gender)
    => apiProvider.createUser(username, firstname, lastname, password, email,gender);

  Future signinUser(String username, String password) =>
      apiProvider.loginUser(username, password);

  Future changemode(bool username) => apiProvider.changemode(username);
  
  Future changeStatus(int notiID) => apiProvider.changeStatus(notiID);

  Future getRequstedOrder() => apiProvider.getRequstedOrder();

  Future getAcceptedOrder() => apiProvider.getAcceptedOrder();
  
  Future getAcceptedOrderDriver() => apiProvider.getAcceptedOrderDriver();

  Future postRequest(int reqPrice, String reqTitle, String reqDesc,
          String reqFrom, String reqTo) =>
      apiProvider.postRequest(reqPrice, reqTitle, reqDesc, reqFrom, reqTo);

  Future postAccpted(int orderID) => apiProvider.postAccpted(orderID);

  Future completeOrder(int orderID) => apiProvider.completeOrder(orderID);
  
  Future postNotification(int userID, int orderID, String notificationContent) => apiProvider.postNotification(userID, orderID, notificationContent);

  // Future getOtherUserName(int orderID) => apiProvider.getOtherUserName(orderID);

  // Future getRequstedOrder()
  //   => apiProvider.getRequstedOrder();

  // Future<Null> addUserTask(String apiKey, String taskName, String deadline) async {
  //   apiProvider.addUserTask(apiKey, taskName, deadline);
  Future userProfile() => apiProvider.userProfile();
  
  
  Future getNotification() => apiProvider.getNotification();
  Future getBalance() => apiProvider.getBalance();
  Future postPayment(double balance) => apiProvider.postPayment(balance);
  // }

}
