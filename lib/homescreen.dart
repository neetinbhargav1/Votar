import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:frost/welcome_screen/delayed_animation.dart';

import 'login/main.dart';

class Home extends StatefulWidget {

  @override
  _AuthScreenState createState() => new _AuthScreenState();
}

class _AuthScreenState extends State<Home> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Votar',
        home: Container(
         height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
        color: Colors.blueAccent,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.1), BlendMode.dstATop),
          image: AssetImage('assets/images/mountains.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 150.0),
              child: Center(
              child: new Column(
                  children: <Widget>[
                    AvatarGlow(
                      endRadius: 90,
                      duration: Duration(seconds: 2),
                      glowColor: Colors.white24,
                      repeat: true,
                      repeatPauseDuration: Duration(seconds: 2),
                      startDelay: Duration(seconds: 1),
                      child: Material(
                          elevation: 8.0,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[100],
                        backgroundImage: AssetImage('assets/images/assam.png'),
//                            child:ImageIcon(
//                              AssetImage("assets/images/assam.png"),
//                              size: 50.0,
//                            ),
                            radius: 70.0,
                          )),
                    ),
                  ]
              )
              )
            ),


               DelayedAnimation(
                 child:new Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 150.0),
                      alignment: Alignment.center,
                       child: new Row(
                            children: <Widget>[
                                new Expanded(


                  child: new RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.white,
//                    highlightedBorderColor: Colors.white,
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(

                      )),);


                    },
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "START",
                              textAlign: TextAlign.center,

                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),


               )],
      ),

        ) );
  }
}

