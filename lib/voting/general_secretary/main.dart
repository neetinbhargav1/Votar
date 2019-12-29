

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frost/homescreen.dart';
import 'package:frost/login/main.dart';
import 'package:frost/voting/cultural_secretary/main.dart';
import 'package:frost/voting/general_secretary/state/authentication.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'constants.dart';
import 'package:frost/voting/general_secretary/state/vote.dart';
//import 'package:frost/voting/state/authentication.dart';
import 'package:frost/login/pages/login_signup_page.dart';



class Votegeneral extends StatefulWidget {

  @override
  Votegeneral1 createState() => Votegeneral1();

}
class Votegeneral1 extends State<Votegeneral>{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;




  @override
  Widget build(BuildContext context) {

    return WillPopScope(

        onWillPop: (){return showDialog(context: context, builder: (context)
        => AlertDialog(
          title: Text(
            "Are you sure want to exit?",

          ),
          content: Text(
            "You will not be able to vote anymore",
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: ()async{

                FirebaseUser user=await FirebaseAuth.instance.currentUser();
                user.delete();
                _firebaseAuth.signOut();
                Navigator.pop(context,true);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()),);
                print('deleted from FireBase');

              },
              child: Text("Yes"),
            ),
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text("No"),
            )

          ],
        ));
        },

    child: MultiProvider(

      providers: [

        ChangeNotifierProvider(
          builder: (_) => VoteState(),
        ),

        ChangeNotifierProvider(
          builder: (_) => AuthenticationState(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Scaffold(

            appBar: AppBar(title: Text('Votar')),

                body: HomeScreeen(),


              ),

          '/result': (context) => Scaffold(
                appBar: AppBar(
                  title: Text('Result'),
                  leading: IconButton(
                    icon: Icon(Icons.home),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                  actions: <Widget>[
                    getActions(context),
                  ],
                ),
              ),
      '/HomePage': (context) => Scaffold(
        body: Cultural(),
      )
        },
      ),
    ));
  }

  PopupMenuButton getActions(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text('Logout'),
        )
      ],
      onSelected: (value) {
        if (value == 1) {
          // logout
//          Provider.of<AuthenticationState>(context, listen: false).logout();
//          gotoLoginScreen(context);
        }
      },
    );
  }


  }

