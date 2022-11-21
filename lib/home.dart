import 'package:flutter/material.dart';
import 'package:video_player/body.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                image:DecorationImage(
                  image: AssetImage('image/img.jpg'),
                  fit: BoxFit.cover,
                )
              ),

            ),
            SizedBox(height: 100,),
            TextButton(onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>Body()));
            }, child: Text('P L A Y',style: TextStyle(
              fontSize: 40

            ),),
              style: TextButton.styleFrom(
                backgroundColor: Colors.orange
              ),
            )
          ],
        ),
      ),
    );
  }
}
