import 'package:flutter/material.dart';
import 'package:Deli_App/pages/home.page.dart';
import "package:Deli_App/network/repository.dart";
import "package:Deli_App/widget/inputEmail.dart";
import "package:Deli_App/widget/password.dart";

class ButtonLogin extends StatefulWidget {
  @override
  _ButtonLoginState createState() => _ButtonLoginState();
}


class _ButtonLoginState extends State<ButtonLogin> {
  Repository _repository = Repository();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.pink[300],
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 1.0, // has the effect of extending the shadow
              offset: Offset(
                5.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FlatButton(
          onPressed: () {         
            _repository.signinUser(usernameText.text, passwordText.text,"");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'OK',
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
    );
  }
}
