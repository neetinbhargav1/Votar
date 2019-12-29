import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:frost/voting/cultural_secretary/main.dart';
import 'package:frost/voting/general_secretary/main.dart';
import 'package:frost/welcome_screen/delayed_animation.dart';


class Welcom extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Welcom> with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xFF8185E2),
          body: Center(
            child: Column(
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
//                        backgroundColor: Colors.grey[100],
                        backgroundImage: AssetImage('assets/images/assam.png'),
//                        child:ImageIcon(
//                          AssetImage("assets/images/assam.png"),
//                          size: 50.0,
//                        ),
                        radius: 50.0,
                      )),
                ),
                DelayedAnimation(
                  child: Text(
                    "A Voting APP",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: color),
                  ),
                  delay: delayedAmount + 1000,
                ),
                DelayedAnimation(
                  child: Text(
                    "For Our College",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: color),
                  ),
                  delay: delayedAmount + 2000,
                ),
                SizedBox(
                  height: 30.0,
                ),
//                DelayedAnimation(
//                  child: Text(
//                    "Your New Personal",
//                    style: TextStyle(fontSize: 20.0, color: color),
//                  ),
//                  delay: delayedAmount + 3000,
//                ),
                DelayedAnimation(
                  child: Text(
                    "    Note: Do Vote wisely.\n\n> Yup, you read that right! \n\n> This is a voting app for our college "
                        "\n\n> Choose ONE of them"
                        "\n\n- Neetin"
                        "Bhargav",
                    style: TextStyle(fontSize: 20.0, color: color),
                  ),
                  delay: delayedAmount + 3000,
                ),
                SizedBox(
                  height: 100.0,
                ),
//                DelayedAnimation(
//                  child: Text(
//                    "this is a voting app",
//                    style: TextStyle(fontSize: 20.0, color: color),
//                  ),
//                  delay: delayedAmount + 3000,
//                ),
//                SizedBox(
//                  height: 100.0,
//                ),
                DelayedAnimation(
                  child: GestureDetector(
                    onTapDown: _onTapDown,
//                    onTapUp: _onTapUp,
                    child: Transform.scale(
                      scale: _scale,
                      child: _animatedButtonUI,


                    ),
                  ),
                  delay: delayedAmount + 4000,
                ),
                SizedBox(height: 50.0,),

              ],
            ),
          )
//          Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Tap on the Below Button',style: TextStyle(color: Colors.grey[400],fontSize: 20.0),),
//             SizedBox(
//               height: 20.0,
//             ),
        //      Center(

        //   ),
        //   ],


        // ),
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
    height: 60,
    width: 270,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
      color: Colors.white,
    ),
    child: Center(
      child: Text(
        'NEXT',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF8185E2),
        ),
      ),
    ),
  );

  void _onTapDown(TapDownDetails details) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) =>Votegeneral()),);
  }
  }

