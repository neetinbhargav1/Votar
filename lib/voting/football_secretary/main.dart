import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frost/homescreen.dart';
import 'package:frost/voting/social_welfare/main.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'constants.dart';
import 'package:frost/voting/football_secretary/state/vote.dart';
//import 'package:frost/voting/state/authentication.dart';
import 'package:frost/login/pages/login_signup_page.dart';



class FootballVoteApp extends StatefulWidget {

  _VoteApp createState() => _VoteApp();

}
class _VoteApp extends State<FootballVoteApp> {
  VoidCallback onBackPress;


  @override
  void initState() {
    super.initState();

//    onBackPress = () {
//      Navigator.pop(context, true); // It worked for me instead of above line
//      Navigator.pushReplacement(
//        context, MaterialPageRoute(builder: (context) => RemoveUser()),);
//    };
  }


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
                  await FirebaseAuth.instance.signOut();
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
          ));},
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            builder: (_) => VoteState(),
          ),
//        ChangeNotifierProvider(
//          builder: (_) => AuthenticationState(),
//        ),
        ],
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) =>
                Scaffold(
                  appBar: AppBar(title: Text('Votar')),
                  body: HomeScreeen(),
                ),

            '/HomePage': (context) =>
                Scaffold(
                  body: SocialVoteApp(),
                )
          },
        ),
      ));
    }

    PopupMenuButton getActions(BuildContext context) {
      return PopupMenuButton<int>(
        itemBuilder: (context) =>
        [
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



