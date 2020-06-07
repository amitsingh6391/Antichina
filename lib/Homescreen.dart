import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import "package:flutter/material.dart";

import 'admob_service.dart';
import 'finalapp.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  final ams = AdMobService(); //call admobclass for use fntction

  // @override
  // void initState() {               //intilazied the appid
  //   super.initState();
  //   Admob.initialize(ams.getAdMobAppId());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
          preferredSize: Size.fromHeight(178),
          child:AppBar(shape: CustomShapeBorder(),backgroundColor: Color(0xFFcccccc),
            flexibleSpace:
            Container(
              child: Image(image: AssetImage('images/Dbb2SNqV0AAvTgY.png'),)
                ),
                leading: IconButton(icon: Icon(Icons.exit_to_app,color:Colors.black,size:30)
                ,onPressed: (){
                  exit(0);
                }),
                ),
                ),
      body:SingleChildScrollView(
              child: Container(
         // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color(0xFF7A9BEE)),
          child: Center(child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding:EdgeInsets.fromLTRB(40, 80, 20, 60),
                    width:MediaQuery.of(context).size.width,
                    child: 
                    Text("Lets make a step towards chinese product free india by unistalling chinese apps.. ",
                    style: TextStyle(fontSize: 35,color: Colors.red,fontWeight:FontWeight.bold,
                    fontFamily: "Dancing"),
                    ),
                    ),
                   // Icon(Icons.nature_people,size:40)
                  ]
              ),
             // Text("hiiii babu",style: TextStyle(fontFamily:"Dancing",fontSize: 80),),
            //  AdmobBanner(
            // adUnitId: ams.getBannerAdId(),
            //  adSize: AdmobBannerSize.BANNER
            //  ),
              Row(
                children: <Widget>[
                  Container(
                    width:MediaQuery.of(context).size.width,
                    padding:EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child:Text("Click on => Scan Now <=to find installed China Apps in your phone",
                    style: TextStyle(fontSize: 25,fontFamily: "Dancing"
                    ),
                    )
                  ),
                  
                ],
              ),
             
               SizedBox(width: 300,
                child:Container(padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child:
                   RaisedButton(
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                              padding: EdgeInsets.all(0),
                              
                              child: Ink(
                                decoration: BoxDecoration(
                                    
                                    gradient: LinearGradient(colors: [Colors.grey, Colors.red],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0)
                                ),
                            child:Container(
                              constraints: BoxConstraints(maxWidth: 300.0, maxHeight: 40.0),
                            alignment: Alignment.center,
                            child: Text( "Scan Now",
                              style: TextStyle(
                                color: Colors.white,
                                  fontFamily: "Dancing",
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),)
                            ), 
                            onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>ListAppsPages(),));

                            },
                          ),)
            
          ),
           CircleAvatar(
               backgroundImage:AssetImage("images/download.jpg") ,
               radius: 60,),
          ],
          ),
          )
        ),
      ) );
  }
}
class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {

    final double innerCircleRadius = 150.0;

    Path path = Path();
    path.lineTo(0, rect.height);
    path.quadraticBezierTo(rect.width / 2 - (innerCircleRadius / 2) - 30, rect.height + 15, rect.width / 2 - 75, rect.height + 50);
    path.cubicTo(
        rect.width / 2 - 40, rect.height + innerCircleRadius - 40,
        rect.width / 2 + 40, rect.height + innerCircleRadius - 40,
        rect.width / 2 + 75, rect.height + 50
    );
    path.quadraticBezierTo(rect.width / 2 + (innerCircleRadius / 2) + 30, rect.height + 15, rect.width, rect.height);
    path.lineTo(rect.width, 0.0);
    path.close();

    return path;
  }
}