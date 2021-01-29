import 'package:flutter/material.dart';
import 'package:Deli_App/pages/login.page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Home',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
        builder: EasyLoading.init(),
      ),
    );
  }
}