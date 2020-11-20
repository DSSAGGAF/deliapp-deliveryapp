import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String dropdownValue = 'Male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 100.0),
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
                'UserName',
                style: TextStyle(fontSize: 32.0),
              ),
              Text(
                'Driver',
                style: TextStyle(fontSize: 16.0),
              ),
              Container(
                height: 500.0,
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
                        child: TextField(
                          //controller: fnameController,
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
                        child: TextField(
                          //controller: lnameController,
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
                        child: TextField(
                          //controller: nEmail,
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
                        child: TextField(
                          //controller: nPassword,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          obscureText: true,
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
                          const EdgeInsets.only(top: 50, right: 50, left: 200),
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
                                Icons.arrow_forward,
                                color: Colors.purple,
                              ),
                            ],
                          ),
                        ),
                      ),
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
