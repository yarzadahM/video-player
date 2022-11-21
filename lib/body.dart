import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constaints.dart';

import 'bat.dart';

import 'ball.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  bool gameStart = false;
  late double height;
  late double width;
  late double batHeight;
  late double batWidth;
  late double batPosition = 40;
  late AnimationController _controller;
  late Animation _animation;
  List poses = [60, 70,80,90,100,110,120,130,140,150];
  Ball ball1 = Ball(posX: 60, posY: 60);
  Ball ball2 = Ball(posX: 70, posY: 70);
  Ball ball3 = Ball(posX: 80, posY: 80);
  Ball ball4 = Ball(posX: 90, posY: 90);
  Ball ball5 = Ball(posX: 100, posY: 100);
  Ball ball6 = Ball(posX: 110, posY: 110);
  Ball ball7 = Ball(posX: 120, posY: 120);
  Ball ball8 = Ball(posX: 130, posY: 130);
  Ball ball9 = Ball(posX: 140, posY: 140);
  Ball ball10 = Ball(posX: 150, posY: 150);
  late List<Ball> balls;

  Future showMessage(BuildContext context) {



    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(

            title: Center(
              child: Text("Gave Over",
              style: TextStyle(
                color: Colors.red[900],
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
            content: Container(
              height: 100,
              child: Center(
                child: Column(
                  children: [
                    Text("Your Score is : $score",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(" Would You like to play again? ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue
                    ),
                    )
                  ],
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {

                        Navigator.of(context).pop();
                        setState(() {


                          balls[0].reset(60, 60);
                          balls[1].reset(70, 70);
                          balls[2].reset(80, 80);
                          balls[3].reset(90, 90);
                          balls[4].reset(100, 100);
                          balls[5].reset(110, 110);
                          balls[6].reset(120, 120);
                          balls[7].reset(130, 130);
                          balls[8].reset(140, 140);
                          balls[9].reset(150, 150);


                        });


                        _controller.repeat();
                      },
                      child: Text("Yes",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                      )),
                  TextButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text("No",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ))
                ],
              )

            ],
          );
        });
  }

  @override
  void initState() {
    balls = [
      ball1,
      ball2,
      ball3,
      ball4,
      ball5,
      ball6,
      ball7,
      ball8,
      ball9,
      ball10
    ];
    _controller =
        AnimationController(vsync: this, duration: Duration(minutes: 20000));
    _animation = Tween(begin: 0, end: 1).animate(_controller);
    _animation.addListener(() {
      setState(() {
        for (int i = 0; i < balls.length; i++) {
          balls[i].ballRun();
          balls[i].checkBorder(
              batHeight: batHeight,
              batWidth: batWidth,
              height: height,
              width: width,
              batPosition: batPosition,
              controller: _controller,
              context: context,
              showMessage: showMessage
               );
        }
      });
    });
    _controller.forward();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        height = constraints.maxHeight;
        width = constraints.maxWidth;
        batHeight = height / 25;
        batWidth = width / 2;
        return GestureDetector(
          onHorizontalDragUpdate: (update) {
            setState(() {
              batPosition += update.delta.dx;
            });
          },
          child: Stack(children: [
            Positioned(
                bottom: 0,
                left: batPosition,
                child: Bat(batHeight: batHeight, batWidth: batWidth)),
            ...balls
                .map(
                  (Ball ball) =>
                      Positioned(bottom: ball.posY, left: ball.posX, child: ball),
                )
                .toList(),
            Positioned(
              top: 40,
              right: 40,
              child: Text("Score : $score",
              style: TextStyle(
              color:Colors.blue[800]   ,
              fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
            Container(),
          ]),
        );
      }),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
