
import 'package:flutter/material.dart';
import 'body.dart';
import 'home.dart';


void main(){
  runApp(
      MultyBallGame()
  );
}
class MultyBallGame extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>Home(),
      },
      debugShowCheckedModeBanner: false,

    );
  }
}


/*
class MultyBall extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Body() ,
    );
  }
}
*/
