import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'admob_service.dart';

class Suggestion extends StatefulWidget {
  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  List<String> litems = ["one", "2"];
  // List<String> litems2 = ['images/download (3).png','images/882062.png'];

  //define function of indian apps...

  launchurl(String link) async{
 var url = link;
 if (await canLaunch(url)){
   await launch(url);
 }else{
   throw "could not launch $url";
 }

}
  Row Indianapp(String appname, String imgurl,String link) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          //color: Colors.black12,
          decoration: BoxDecoration(
              color: Colors.cyan,
              //   gradient: LinearGradient(colors: [Colors.red, Colors.cyan]),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(0),
                  height: 100,
                  width: 100,
                  child: Image(
                    image: AssetImage(imgurl),
                  )),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              appname,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            width: 90,
                            child: RaisedButton(
                              color: Colors.blueAccent[100],
                              child: Text(
                                "INSTALL",
                                style: TextStyle(fontSize: 14),
                              ),
                              onPressed: () {
                               launchurl(link);
                              },
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  //intiliazied adds
  // final ams = AdMobService(); //call admobclass for use fntction

  // @override
  // void initState() {               //intilazied the appid
  //   super.initState();
  //   Admob.initialize(ams.getAdMobAppId());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellow,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(80),
                    bottomLeft: Radius.circular(80),
                  ),
                  color: Color(0xFF7A9BEE),
                ),
                child: Card(
                  margin: EdgeInsets.all(30),
                  color: Color(0xFF7A9BEE),
                  elevation: 10,
                  child: Center(
                      child: Text(
                    "Suggested Apps",
                    style: TextStyle(fontFamily: "Dancing", fontSize: 40),
                  )),
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                     color: Color (0xFF7A9BEE),
                      child: Column(
                        children: <Widget>[
                          Center(child:Card(
                             color: Color (0xFF7A9BEE),
                             elevation: 10,
                            child:Text("Social Media apps",
                          style: TextStyle(fontFamily: "Dancing", fontSize: 40),
                          ),)
                          ),
                           Indianapp("FireWork",
                              "images/photo_2020-06-02_22-05-40-min.jpg",
                              "https://play.google.com/store/apps/details?id=com.loopnow.kamino&hl=en"),
                          SizedBox(
                            height: 10,
                          ),
                          Indianapp("Say Namaste ",
                              "images/photo_2020-06-02_22-04-49-min.jpg",
                              "https://play.google.com/store/apps/details?id=com.inscripts.namaste&hl=en"),
                          SizedBox(
                            height: 10,
                          ),
            //               AdmobBanner(
            // adUnitId:"ca-app-pub-6517770398502887/4873394134",
            //  adSize: AdmobBannerSize.BANNER
            //  ),
                          Indianapp("In Shots",
                              "images/photo_2020-06-02_22-05-06-min.jpg",
                              "https://play.google.com/store/apps/details?id=com.nis.app&hl=en"),
                          SizedBox(
                            height: 10,
                          ),
                          Indianapp("Hike",
                              "images/photo_2020-06-02_22-05-53-min.jpg",
                              "https://play.google.com/store/apps/details?id=com.hike.chat.stickers&hl=en"),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      color: Color(0xFF7A9BEE),
                      child: Column(
                        children: <Widget>[
                          Center(child: Card(
                             color: Color (0xFF7A9BEE),
                             elevation: 10,
                            child:Text("photo and video Editing",
                          style: TextStyle(fontFamily: "Dancing", fontSize: 40),
                          ),)),
                          Indianapp("Pics Art",
                              "images/photo_2020-06-02_22-04-53 - Copy.jpg",
                              "https://play.google.com/store/apps/details?id=com.picsart.studio&hl=en"),
                          SizedBox(
                            height: 10,
                          ),
            //               AdmobBanner(
            // adUnitId:"ca-app-pub-6517770398502887/2247230794",
            //  adSize: AdmobBannerSize.BANNER
            //  ),
                          Indianapp("B612",
                              "images/photo_2020-06-02_22-05-33-min.jpg",
                              "https://play.google.com/store/apps/details?id=com.linecorp.b612.android&hl=en"),
                          SizedBox(
                            height: 10,
                          ),
                         
                        ],
                      ),
                    ),

                    Container(
                      color: Color(0xFF7A9BEE),
                      child: Column(
                        children: <Widget>[
                          Center(child: Card(
                             color: Color (0xFF7A9BEE),
                             elevation: 10,
                            child:Text("Others daily use apps",
                          style: TextStyle(fontFamily: "Dancing", fontSize: 40),
                          ),)),
                          Indianapp("Arogya setu",
                              "images/photo_2020-06-02_22-05-43-min.jpg",
                              "https://play.google.com/store/apps/details?id=nic.goi.aarogyasetu"),
                          SizedBox(
                            height: 10,
                          ),
                         
                          Indianapp("Adobe scan",
                              "images/photo_2020-06-02_22-04-16-min.jpg",
                              "https://play.google.com/store/apps/details?id=com.adobe.scan.android&hl=en"),
                          SizedBox(
                            height: 10,
                          ),
                          Indianapp("Norton AppLock",
                              "images/photo_2020-06-02_22-04-10-min.jpg",
                              "https://play.google.com/store/apps/details?id=com.symantec.applock&hl=en"),
                          SizedBox(
                            height: 10,
                          ),
            //               AdmobBanner(
            // adUnitId:"ca-app-pub-6517770398502887/9717638651",
            //  adSize: AdmobBannerSize.BANNER
            //  ),
                          Indianapp("Proton Vpn",
                              "images/photo_2020-06-02_22-04-27-min.jpg",
                              "https://play.google.com/store/apps/details?id=ch.protonvpn.android&hl=en"),
                          SizedBox(
                            height: 10,
                          ),
                          Indianapp("Files By Google",
                              "images/photo_2020-06-02_22-04-43-min.jpg",
                              "https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&hl=en"),
                          SizedBox(
                            height: 10,
                          ),
                          Indianapp("Ajio",
                              "images/photo_2020-06-02_22-04-39-min.jpg",
                              "https://play.google.com/store/apps/details?id=com.ril.ajio"),
                          SizedBox(
                            height: 10,
                          ),
                          Indianapp("1-mg",
                              "images/photo_2020-06-02_22-05-24-min.jpg",
                              "https://play.google.com/store/apps/details?id=com.aranoah.healthkart.plus&hl=en"),
                          SizedBox(
                            height: 10,
                          ),
                          Indianapp("Academic master",
                        "images/photo_2020-06-02_22-05-50-min.jpg",
                        "https://play.google.com/store/apps/details?id=com.academic.master"),
                    SizedBox(
                      height: 10,
                    ),

                    Indianapp(
                        "Chrome", "images/photo_2020-06-02_22-05-30-min.jpg",
                        "https://play.google.com/store/apps/details?id=com.android.chrome&hl=en"),
                    SizedBox(
                      height: 10,
                    ),
                    
                    Indianapp(
                        "LOCO", "images/photo_2020-06-02_22-04-32-min.jpg",
                        "https://play.google.com/store/apps/details?id=com.showtimeapp&hl=en"),
                    SizedBox(
                      height: 10,
                    ),
                    // Indianapp(
                   
                    Indianapp("Map My India",
                        "images/photo_2020-06-02_22-00-42-min.jpg",
                        "https://play.google.com/store/apps/details?id=com.mmi.maps&hl=en"),
                    SizedBox(
                      height: 10,
                    ),
                    Indianapp("Phone2 Location",
                        "images/photo_2020-06-02_22-06-02-min.jpg",
                        "https://play.google.com/store/apps/details?id=and.p2l"),
                    SizedBox(
                      height: 10,
                    ),
                        ],
                      ),
                    ),

                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
