import 'package:flutter/material.dart';
import 'package:login_minimalist/pages/login.page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: MaterialApp(
        title: 'Home',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}