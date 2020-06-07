import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';

import 'package:url_launcher/url_launcher.dart';

import 'Homescreen.dart';
import 'finalapp.dart';

class Foldable extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FSBStatus drawerStatus;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(178),
          child: AppBar(
            shape: CustomShapeBorder(),
            backgroundColor: Color(0xFFcccccc),
            flexibleSpace: Container(
                child: Image(
              image: AssetImage('images/Dbb2SNqV0AAvTgY.png'),
            )),
            leading: IconButton(
                icon: Icon(Icons.cancel, color: Colors.black, size: 50),
                onPressed: () {
                  exit(0);
                }),
          ),
        ),
        body: FoldableSidebarBuilder(
          drawerBackgroundColor: Colors.red,
          drawer: CustomDrawer(
            closeDrawer: () {
              setState(() {
                drawerStatus = FSBStatus.FSB_CLOSE;
              });
            },
          ),
          screenContents: FirstScreen(),
          status: drawerStatus,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrange,
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                    ? FSBStatus.FSB_CLOSE
                    : FSBStatus.FSB_OPEN;
              });
            }),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.cyan),
          child: Center(
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(40, 80, 20, 60),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Lets make a step towards chinese product free india by unistalling chinese apps.. ",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Dancing"),
                    ),
                  ),
                  // Icon(Icons.nature_people,size:40)
                ]),
                // Text("hiiii babu",style: TextStyle(fontFamily:"Dancing",fontSize: 80),),
                //  AdmobBanner(
                // adUnitId: ams.getBannerAdId(),
                //  adSize: AdmobBannerSize.BANNER
                //  ),
                Row(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                        child: Text(
                          "Click on => Scan Now <=to find installed China Apps in your phone",
                          style: TextStyle(fontSize: 25, fontFamily: "Dancing"),
                        )),
                  ],
                ),

                SizedBox(
                    width: 300,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0)),
                        padding: EdgeInsets.all(0),
                        child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.grey, Colors.red],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(40.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 300.0, maxHeight: 40.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Scan Now",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Dancing",
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListAppsPages(),
                              ));
                        },
                      ),
                    )),
                CircleAvatar(
                  backgroundImage: AssetImage("images/download.jpg"),
                  radius: 60,
                ),
              ],
            ),
          )),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  //urlluncher

  urllauncher(String url) async {
    // var url="https://play.google.com/store/apps/details?id=com.academic.master";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "could not launch $url";
    }
  }

//urlluncher for contact us that is gmail..

  contact() async {
    final Uri params = Uri(scheme: "mailto", path: "amitsingh506142@gmail.com");

    String url = params.toString();

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "could not launch $url";
    }
  }

//sharelink..

  Future<void> sharelink() async {
    try {
      Share.text(
          'Academic Maste',
          'https://play.google.com/store/apps/details?id=com.antichina.amitapps',
          'text/plain');
    } catch (e) {
      print('error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.withAlpha(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "images/download.jpg",
                    ),
                    radius: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("BE   AATMNIRBHAR",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold))
                ],
              )),
          ListTile(
            onTap: () {
              urllauncher(
                  "https://play.google.com/store/apps/details?id=com.academic.master");
            },
            leading: Icon(Icons.thumb_up),
            title: Text(
              "RATE  US",
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              contact();
            },
            leading: Icon(Icons.person),
            title: Text("Contact  Us"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              urllauncher("https://atmanirbhar.flycricket.io/privacy.html");
            },
            leading: Icon(Icons.security),
            title: Text("Privacy  Policy"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              sharelink();
            },
            leading: Icon(Icons.share),
            title: Text("SHARE"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
