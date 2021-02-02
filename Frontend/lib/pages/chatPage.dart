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

double width = 0, height = 60;

class _ChatPageState extends State<ChatPage> {
  final TextEditingController textEditingController = TextEditingController();

  Widget buildSingleMessage(Message message) {
    return message.senderID == chatPage.otherUser.id
        ? Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 15),
            // height: height,
            // width: width,
            child: Material(
              color: Colors.black87,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(height / 2),
                bottomRight: Radius.circular(height / 2),
                topLeft: Radius.circular(height / 2),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20, top: 20, bottom: 20),
                child: Container(
                  alignment: message.senderID == chatPage.currUser.id
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 15),
            // height: height,
            // width: width,
            child: Material(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(height / 2),
                bottomRight: Radius.circular(height / 2),
                topRight: Radius.circular(height / 2),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20, top: 20, bottom: 20),
                child: Container(
                  alignment: message.senderID == chatPage.currUser.id
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
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
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Send message',
              ),
            ),
          ),
          SizedBox(width: 10.0),
          FloatingActionButton(
            backgroundColor: Colors.deepPurple,
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
        backgroundColor: Colors.deepPurple,
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
