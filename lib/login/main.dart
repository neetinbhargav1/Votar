import 'package:flutter/material.dart';
import './pages/root_page.dart';
import './services/authentication.dart';



class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Votar',
      home: new RootPage(auth: new Auth())
      );
  }
  
}

