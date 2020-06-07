import "package:flutter/material.dart";
import "dart:async";
//import "package:firebase_admob/firebase_admob.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'Homescreen.dart';
import 'package:flutter_animation_set/animation_set.dart';
import 'package:flutter_animation_set/animator.dart';

import 'foldable.dart';
void main(){

 
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
@override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner:false,

      title:"Unistall China Apps",
      //home:Homescreen(),
      home:SplashScreen()
      
    );
  }}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
 void initState(){

   super.initState();

   Timer(Duration(seconds: 7),(){
     Navigator.push(context, MaterialPageRoute(builder:(context)=>Foldable(),));
    
     },
     );
 }

  
  @override
  Widget makeWave(int before, int after) {
  return AnimatorSet(
    child: Container(
      color: Colors.white,
      width: 5,
      height: 15,
    ),
    animatorSet: [
      Delay(duration: before),
      SY(from: 0.8, to: 1.6, duration: 200, delay: 0, curve: Curves.linear),
      SY(from: 1.6, to: 0.8, duration: 200, delay: 0, curve: Curves.linear),
      Delay(duration: after),
    ],
  );
}
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.cyan,

       appBar: PreferredSize(
          preferredSize: Size.fromHeight(178),
          child:AppBar(shape: CustomShapeBorder(),backgroundColor: Color(0xFFcccccc),
            flexibleSpace:
            Container(
              child: Image(image: AssetImage('images/Dbb2SNqV0AAvTgY.png'),)
                ),
                
                ),
                ),

    body:  Column(
        children: <Widget>[

          SizedBox(height:100),
          CircleAvatar(
       backgroundImage:AssetImage("images/download.jpg") ,
       radius: 60,),
         SizedBox(height:50),
          Row(
            children: <Widget>[
              
              Container(
                       child: Center(
                        child:SizedBox(
  width: MediaQuery.of(context).size.width,
  child: FadeAnimatedTextKit(
    // onTap: () {
    //     print("Tap Event");
    //   },
    text: [
      "        Say NO ",
      "     TO Chinese App....",
      "   UNISTAL CHINESE APP!!!"
    ],textAlign: TextAlign.center,
    textStyle: TextStyle(
    
      color: Colors.redAccent[200],
        fontSize: 40.0, 
        fontWeight: FontWeight.bold
    ),
  ),
) ) ),
               
            ],
          ),
           Container(
                          width: 40,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          makeWave(0, 500),
                          makeWave(100, 400),
                          makeWave(200, 300),
                          makeWave(300, 200),
                          makeWave(400, 100),
                          makeWave(500, 0),
                        ],
                      ),

                        ),
        ],
      ),
    

      
    );
  }
}