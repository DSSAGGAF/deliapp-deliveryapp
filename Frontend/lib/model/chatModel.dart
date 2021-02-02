import './messageModel.dart';
import './addUser.dart';
import 'dart:convert';
import "package:Deli_App/pages/chatPage.dart";
import "package:Deli_App/network/api.dart";
import 'package:Deli_App/widget/buildChatPageDriver.dart';

// import './main.dart';
class ChatModel {
  User currUser;
  User otherUser;
  List<Message> messages = List<Message>();
  ChatModel() {
    currUser = userInfo;
  }
  void setOtherUser(User _user) {
    otherUser = _user;
  }

  List<Message> getMessagesForChatID() {
    return messages
        .where((msg) =>
            msg.senderID == otherUser.id || msg.receiverID == otherUser.id)
        .toList();
  }

  void sendMessage(String text) {
    messages.add(Message(text, currUser.id, otherUser.id));
    socket.emit(
      'priv_msg',
      json.encode({'username': otherUser.name, 'message': text}),
    );
    streamController.add("event");
  }

  void reciveMessage(String text) {
    messages.add(Message(text, otherUser.id, currUser.id));
    streamController.add("event");
  }
}
