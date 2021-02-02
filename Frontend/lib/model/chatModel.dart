// import 'package:flutter/cupertino.dart';
// import './messageModel.dart';
// import './userModel.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:socket_io_client/socket_io_client.dart';
// import 'dart:convert';
// import 'package:Deli_App/pages/messageDriver.dart';

// class ChatModel {
//   var user1 = User("Azoozistic", "2");
//   var user2 = User("Assaggaf", "1");
//   List<Message> messages = List<Message>();
//   ChatModel() {
//     print("Done:)");
//   }

//   List<Message> getMessagesForChatID(String chatID) {
//     // messages.add(Message("text", "222", chatID));
//     // notifyListeners();
//     return messages
//         .where((msg) => msg.senderID == chatID || msg.receiverID == chatID)
//         .toList();
//   }

//   void sendMessage(String text, String receiverChatID) {
//     messages.add(Message(text, user1.chatID, user2.chatID));
//     messages.add(Message(text, user2.chatID, user1.chatID));
//     // messages.add(Message(text, "222", receiverChatID));
//     socket.emit(
//       'send_message',
//       json.encode({
//         'receiverChatID': receiverChatID,
//         'senderChatID': user1.chatID,
//         'content': text,
//       }),
//     );
//   }

//   void reciveMessage(String text, String Id) {
//     if (Id == user2.chatID)
//       messages.add(Message(text, user2.chatID, user1.chatID));
//     // notifyListeners();
//   }
// }
