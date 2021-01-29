import 'package:flutter/material.dart';
import 'package:Deli_App/network/api.dart';
import "package:Deli_App/network/repository.dart";
import 'package:Deli_App/pages/paymentPage.dart';

String fname;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Repository _repository = Repository();
  String dropdownValue = 'Male';
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _repository.getBalance();
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 33.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://w0.pngwave.com/png/639/452/computer-icons-avatar-user-profile-people-icon-png-clip-art.png'),
                radius: 60.0,
              ),
              Text(
                userInfo.name,
                style: TextStyle(fontSize: 32.0),
              ),
              // Text(
              //   'Driver',
              //   style: TextStyle(fontSize: 16.0),
              // ),
              Container(
                // height: 600.0,
                width: double.infinity,
                color: Colors.deepPurple[300],
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 50, right: 5),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          // controller: myController,

                          initialValue: userInfo.fname,
                          onChanged: (value) {
                            userInfo.fname = value;
                          },
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.lightBlueAccent,
                            labelText: 'First Name',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 50, right: 5),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          initialValue: userInfo.lname,
                          onChanged: (value) {
                            userInfo.lname = value;
                          },
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.lightBlueAccent,
                            labelText: 'Last Name',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 50, right: 50),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          initialValue: userInfo.email,
                          onChanged: (value) {
                            userInfo.email = value;
                          },
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.lightBlueAccent,
                            labelText: 'E-mail',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 50, right: 50),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          initialValue: userInfo.pass,
                          onChanged: (value) {
                            userInfo.pass = value;
                          },
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 50, right: 50),
                      child: Container(
                        alignment: Alignment.bottomRight,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyPaymentPage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.payment,
                                color: Colors.purple,
                              ),
                              Text(
                                "  "+userInfo.balance.toString(),
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50, right: 50, left: 200),
                      child: Container(
                        // alignment: Alignment.bottomLeft,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            _repository.userProfile();

                            // Navigator.push(context,
                            // MaterialPageRoute(builder: (context) => HomePage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Update',
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Icon(
                                Icons.rotate_right_sharp,
                                color: Colors.purple,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
