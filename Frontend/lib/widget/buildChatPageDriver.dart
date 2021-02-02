import 'dart:async';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import "package:Deli_App/pages/chatPage.dart";
import "package:Deli_App/model/addUser.dart";
import "package:Deli_App/pages/driverAcceptedOrder.dart";
import 'package:flutter/cupertino.dart';
User otherUser;
String cond = "false";
IO.Socket socket = IO.io(
    'http://192.168.1.18:5000',
    OptionBuilder()
        .setTransports(['websocket']) // optional
        .disableAutoConnect() // disable auto-connection
        .build());

Future connectAndListen() {
  socket.connect();
  socket.onConnect((_) {
    print('connect');
    socket.emit('username', chatPage.currUser.name);
    socket.emit('otehrUsernameDriver', acceptOrderId);
  });

  socket.on('otherUserData', (data) {   
    otherUser = User.fromJson(data["data"]);
    cond = "true";
    chatPage.setOtherUser(otherUser);
    _streamControllerBuild.add("event");
  });
  // streamController.add("");
  socket.on('new_private_message', (data) => chatPage.reciveMessage(data));
  socket.onDisconnect((_) => print('disconnect'));
}

class BuildChatPage extends StatefulWidget {
  @override
  _BuildChatPage createState() => _BuildChatPage();
}

StreamController _streamControllerBuild;
Stream _streamBuild;

class _BuildChatPage extends State<BuildChatPage> {

  @override
  void initState() {
    super.initState();

    _streamControllerBuild = StreamController();
    _streamBuild = _streamControllerBuild.stream;
  }

  @override
  Widget build(BuildContext context) {
    connectAndListen();
    return StreamBuilder(
      stream: _streamBuild,
      builder: (context, snapchot) {
        Widget widget;
        if (snapchot.hasData) {
          print(snapchot.data);
          return Container(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: ChatPage(),
            ),
          );
        } else {
          print(snapchot.data);
          widget = Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return widget;
      },
    );
  }
}
