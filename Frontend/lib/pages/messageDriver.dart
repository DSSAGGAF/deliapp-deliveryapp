// import 'package:flutter/cupertino.dart';
// import 'package:Deli_App/model/chatModel.dart';
// import './messageModel.dart';
// import './userModel.dart';
// import 'package:flutter/material.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:socket_io_client/socket_io_client.dart';
// import 'dart:async';
// import 'dart:convert';

// double width = 0, height = 60;

// class ChatPage extends StatefulWidget {
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }

// IO.Socket socket = IO.io(
//     'http://10.0.2.2:5000',
//     OptionBuilder().setTransports(['websocket']).setExtraHeaders(
//             {'foo': 'bar'}) // optional
//         .build());

// class _ChatPageState extends State<ChatPage> {
//   final TextEditingController textEditingController = TextEditingController();
//   var chatPage = ChatModel();
//   Widget buildSingleMessage(Message message) {
//     return message.senderID == chatPage.user2.chatID
//         ? Padding(
//             padding: const EdgeInsets.only(left: 10.0, right: 10, top: 15),
//             // height: height,
//             // width: width,
//             child: Material(
//               color: Colors.pinkAccent,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(height / 2),
//                 bottomRight: Radius.circular(height / 2),
//                 topLeft: Radius.circular(height / 2),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     left: 20.0, right: 20, top: 20, bottom: 20),
//                 child: Container(
//                   alignment: message.senderID == chatPage.user1.chatID
//                       ? Alignment.centerLeft
//                       : Alignment.centerRight,
//                   child: Text(
//                     message.text,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15.0,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           )
//         : Padding(
//             padding: const EdgeInsets.only(left: 10.0, right: 10, top: 15),
//             // height: height,
//             // width: width,
//             child: Material(
//               color: Colors.pinkAccent,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(height / 2),
//                 bottomRight: Radius.circular(height / 2),
//                 topRight: Radius.circular(height / 2),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     left: 20.0, right: 20, top: 20, bottom: 20),
//                 child: Container(
//                   alignment: message.senderID == chatPage.user1.chatID
//                       ? Alignment.centerLeft
//                       : Alignment.centerRight,
//                   child: Text(
//                     message.text,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15.0,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//   }

//   StreamController _streamController;
//   Stream _stream;
//   @override
//   void initState() {
//     super.initState();

//     _streamController = StreamController();
//     _stream = _streamController.stream;
//   }

//   Widget buildChatList() {
//     return StreamBuilder(
//       stream: _stream,
//       builder: (context, snapshot) {
//         List<Message> messages =
//             chatPage.getMessagesForChatID(chatPage.user2.chatID);
//         return Container(
//           height: MediaQuery.of(context).size.height * 0.75,
//           child: ListView.builder(
//             itemCount: messages.length,
//             itemBuilder: (BuildContext context, int index) {
//               return buildSingleMessage(messages[index]);
//             },
//           ),
//         );
//       },
//     );
//   }

//   Widget buildChatArea() {
//     return Container(
//       child: Row(
//         children: <Widget>[
//           Container(
//             width: MediaQuery.of(context).size.width * 0.8,
//             child: TextField(
//               controller: textEditingController,
//             ),
//           ),
//           SizedBox(width: 10.0),
//           FloatingActionButton(
//             onPressed: () {
//               chatPage.sendMessage(
//                   textEditingController.text, chatPage.user2.chatID);
//               textEditingController.text = '';
//             },
//             elevation: 0,
//             child: Icon(Icons.send),
//           ),
//         ],
//       ),
//     );
//   }

//   void connectAndListen() {
//     socket.onConnect((_) {
//       // chatPage.sendMessage("textEditingController.text", chatPage.user2.chatID);
//       print('connect');

//       // socket.emit('message', 'test');
//     });
//     // socket.on('send_message', (data) => print(data.toString()));
//     //When an event recieved from server, data is added to the stream
//     socket.on('receive_message', (result) {
//       // _streamController.add("event");
//       // ChatModel().sendMessage(
//       //                   "textEditingController.text", widget.friend.chatID);
//       // ChatModel().reciveMessage(data, "222");
//       // print("msg rec");
//       // print(data.toString());
//       // // final dataList = data as List;
//       // // final result = json.decode(data);
//       // // print(result.toString());
//       // print(data.toString());
//       // print(result["content"]);
//       chatPage.reciveMessage(result["content"], result["senderChatID"]);
//       _streamController.add("event");
//     });
//     socket.onDisconnect((_) => print('disconnect'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     connectAndListen();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Chat page"),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: ListView(
//         children: <Widget>[
//           buildChatList(),
//           buildChatArea(),
//         ],
//       ),
//     );
//   }
// }
