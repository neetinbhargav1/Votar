import 'package:flutter/material.dart';
import 'package:frost/login/pages/login_signup_page.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.0, vertical: 8.0),
        child: Text(
          "OK",
          style: TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: () {
        
        Navigator.pop(context);

//        Navigator.push(context,
//        MaterialPageRoute(
//          builder: (context)=>LoginSignUpPage()
//        ));
//        Scaffold.of(context).showSnackBar(
//          SnackBar(
//            content: Text(
//              "ThankYOu ",
//              style: TextStyle(
//                color: Colors.white,
//              ),
//            ),
//            backgroundColor: Colors.black54,
//          ),
//        );
      },
    );
  }}