import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frost/login/main.dart';

class RemoveUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<RemoveUser> {



  Widget _showButtonList() {
    return new Container(
      padding: EdgeInsets.all(26.0),
      child: new ListView(
        children: <Widget>[

          _removeUserContainer(),
        ],
      ),
    );
  }


  _removeUserContainer() {
    return new MaterialButton(
      shape:
      RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      onPressed: ()async {
         FirebaseUser user=await FirebaseAuth.instance.currentUser();
         user.delete();
         await FirebaseAuth.instance.signOut();


         print('deleted from FireBase');
          exit(0);



      },
      minWidth: MediaQuery
          .of(context)
          .size
          .width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      color: Colors.red,
      textColor: Colors.white,
      child: Text(
        "Thank You",
        textAlign: TextAlign.center,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Votar'),

      ),
      body: _showButtonList(),


    );
  }
}

