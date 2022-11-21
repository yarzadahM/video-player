import 'package:flutter/material.dart';

import 'constaints.dart';

class Ball extends StatelessWidget {
  double posX;
  double posY;
  Direction vDir = Direction.up;
  Direction hDir = Direction.right;
  double randX = 1;
  double randY = 1;
  Ball({Key? key, required this.posX, required this.posY}) : super(key: key);

  void checkBorder(
      {
        required double batHeight,
       required double batWidth,
        required double height,
        required double width,
        required double batPosition,
        required AnimationController controller,
        required   Function showMessage,
        required BuildContext context}) {
    if (vDir == Direction.up && posY >= height - 30) {
      vDir = Direction.down;
      randY = randomNumber();
    }
    if (hDir == Direction.right && posX >= width - 30) {
      hDir = Direction.left;
      randX = randomNumber();
    }
    if (hDir == Direction.left && posX <= 0) {
      hDir = Direction.right;
      randX = randomNumber();
    }
    if (vDir == Direction.down && posY <= 0 + batHeight) {
      if (posX > batPosition - 30 && posX < batPosition + batWidth) {
        vDir = Direction.up;
        score++;
        randY = randomNumber();
      } else {
        controller.repeat();
        showMessage(context);
       }
    }
  }

  void reset(double x, double y) {
    score = 0;
    posX = x;
    posY = y;
    vDir = Direction.up;
    hDir = Direction.left;
    randX = 1;
    randY = 1;

  }
  void reset1(){
    score=0;
  }

  void ballRun() {
    vDir == Direction.up ? posY += speed * randY : posY -= speed * randY;
    hDir == Direction.right ? posX += speed * randX : posX -= speed * randX;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration:
      BoxDecoration(shape: BoxShape.circle, color: Colors.red[900]),
    );
  }
}
