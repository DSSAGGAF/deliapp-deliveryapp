import 'package:flutter/material.dart';
import 'package:Deli_App/pages/login.page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:Deli_App/network/repository.dart";
import "package:Deli_App/network/api.dart";
import "package:Deli_App/pages/home.page.dart";

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
        home: MyHomePage(),
        builder: EasyLoading.init(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Repository _repository = Repository();
  String apiKey = "";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: autoSingIn(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // String apiKey = snapshot.data;
        //apiKey.length > 0 ? getHomePage() :
        return apiKey.length > 0 ? HomePage() : LoginPage();
      },
    );
  }

  Future autoSingIn() async {
    apiKey = await getApiKey();
    if (apiKey != null) {
      if (apiKey.length > 0) {
        _repository.signinUser("", "", apiKey);
      } else {
        print("No api key");
      }
    } else {
      apiKey = "";
    }
    return apiKey;
  }

  Future getApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString("API_Token");
  }
}
