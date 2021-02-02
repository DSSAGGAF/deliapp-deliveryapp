import 'package:Deli_App/model/ChatModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:Deli_App/model/messageModel.dart';
import 'package:flutter/material.dart';
import 'dart:async';
StreamController streamController;
Stream _stream;
var chatPage = ChatModel();

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController textEditingController = TextEditingController();

  Widget buildSingleMessage(Message message) {
    return Container(
      alignment: message.senderID == chatPage.otherUser.id
          ? Alignment.centerLeft
          : Alignment.centerRight,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      child: Text(message.text),
    );
  }

  @override
  void initState() {
    super.initState();

    streamController = StreamController();
    _stream = streamController.stream;
  }

  Widget buildChatList() {
    return StreamBuilder(
      stream: _stream,
      builder: (context, snapshot) {
        List<Message> messages = chatPage.getMessagesForChatID();
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              return buildSingleMessage(messages[index]);
            },
          ),
        );
      },
    );
  }

  Widget buildChatArea() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              controller: textEditingController,
            ),
          ),
          SizedBox(width: 10.0),
          FloatingActionButton(
            onPressed: () {
              chatPage.sendMessage(textEditingController.text);
              textEditingController.text = '';
            },
            elevation: 0,
            child: Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chatPage.otherUser.name),
      ),
      body: ListView(
        children: <Widget>[
          buildChatList(),
          buildChatArea(),
        ],
      ),
    );
  }
}
