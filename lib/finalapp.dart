

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() => runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: ListAppsPages()));

class ListAppsPages extends StatefulWidget {
  @override
  _ListAppsPagesState createState() => _ListAppsPagesState();
}

class _ListAppsPagesState extends State<ListAppsPages> {
  bool _showSystemApps = false;
  bool _onlyLaunchableApps = false;

  //gmail..
  contact() async {
    final Uri params = Uri(scheme: "mailto", path: "amitsingh506142@gmail.com");

    String url = params.toString();

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 10,
          onPressed: () {
            contact();
          },
          child: Icon(
            Icons.mail,
            color: Colors.green,
          )),
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.cyan,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        actions: <Widget>[
          CircleAvatar(backgroundImage: AssetImage("images/download.jpg")),
          SizedBox(width: 150)
        ],
      ),
      backgroundColor: Colors.cyan,
      body: _ListAppsPagesContent(
          //includeSystemApps: _showSystemApps,
          onlyAppsWithLaunchIntent: _onlyLaunchableApps,
          key: GlobalKey()),
    );
  }
}

class _ListAppsPagesContent extends StatefulWidget {
  //final bool includeSystemApps;
  final bool onlyAppsWithLaunchIntent;
  const _ListAppsPagesContent(
      {Key key,
      // this.includeSystemApps: false,
      this.onlyAppsWithLaunchIntent: false})
      : super(key: key);

  @override
  __ListAppsPagesContentState createState() => __ListAppsPagesContentState();
}

class __ListAppsPagesContentState extends State<_ListAppsPagesContent> {
//define here alert dilog

  showAlertDialog(BuildContext context, String appname, packagename) {
//set up button
    Widget ok = FlatButton(
        onPressed: () {
          launchurl(appname, packagename);
        },
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.all(20),
          elevation: 10,
          shadowColor: Colors.black,
          child: Text(
            "Continue",
            style: TextStyle(fontSize: 25),
          ),
        ));

    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.cyan,
      title: Row(
        children: <Widget>[
          Text(
            "Great Choice",
            style: TextStyle(fontFamily: "Dancing", fontSize: 30),
          ),
          CircleAvatar(backgroundImage:AssetImage("images/"))
        ],
      ),
      content: Card(
          margin: EdgeInsets.all(20),
          shadowColor: Colors.black,
          color: Colors.white,
          elevation: 10,
          child: Text(
            "Congratulaions!! now your Phone gone to be free from chinese apps",
            style: TextStyle(fontFamily: "Dancing", fontSize: 30),
          )),
      actions: <Widget>[
        ok,
      ],
    );

//showdialog
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    List chiniespackagename = [
      "com.zhiliaoapp.musically",
      "com.kwai.video",
      "com.uc.browser.in",
      "sg.bigo.live",
      "com.intsig.camscanner",
      "com.tencent.iglite",
      "com.hcg.cok.gp",
      "com.mobile.legends",
      "com.zzkko",
      "com.romwe",
      "com.yottagames.mafiawar",
      "com.ngame.alistar.eu",
      "com.tencent.ludosuperstar",
      "free.vpn.unblock.proxy.turbovpn",
      "free.vpn.unblock.proxy.vpnmonster",
      "com.netease.lztgglobal",
      "com.lilithgames.hgame.gp.id",
      "com.lilithgame.tgames",
      "io.yarsa.games.ludo",
      "com.indiamart.m",
      "com.alibaba.aliexpresshd",
      "com.alibaba.intl.android.apps.poseidon",
      "com.tencent.mm",
      "com.uc.iflow",
      "com.newsdog",
      "com.quvideo.xiaoying",
      "com.lbe.parallel.intl",
      "com.apusapps.browser",
      "phone.antivirus.virus.cleaner.junk.clean.speed.booster.master",
      "com.cm.browser.downloader.adblock",
      "com.limsky.ramcleaner",
      "com.qihoo.security",
      "com.tencent.mobileqq",
      "com.tencent.qqmusic",
      "com.uc.vmate",
      "sg.bigo.live.lite",
      "com.zakzak.live.chat",
      "com.uc.vmlite",
      "com.mi.global.shop",
      "com.mi.global.jointly",
      "com.quvideo.vivavideo.lite",
      "com.ucturbo",
      "com.CricChat.intl",
      "com.kwai.global.video.social.kwaigo",
      "com.newbiz.mvmaster",
      "com.funnypuri.client",
      "com.wond.tika",
      "com.kwai.bulldog",
      "com.banggood.client",
      "com.mi.gloabalbrowser",
      "com.duokan.phone.remotecontroller",
      "com.xiaomi.midrop",
      "com.mi.android.globalFileexplorer",
      "com.mi.android.gloaballauncher",
      "com.miui.videoplayer",
      "com.miui.android.fashiongallery",
      "com.miui.calculator",
      "com.xiaomi.smarthome",
      "com.mint.keyboard",
      "com.mi.globalbrowser.mini",
      "com.camerasideas.instashot",
      "com.cameraasideas.instashot",
      "photo.editior.photoeditior.photoeditorpro",
      "com.camerasideas.trimmer",
      "photoeditior.layout.collgemaker",
      "video.downloader.videodownloader",
      "videoeditior.videomaker.videoeditiorforyoutube",
      "storysaverforinstagram.storydownloader.instastorysaver",
      "mp3videoconverter.videotomp3.videotomp3converter",
      "all.video.downloader.allvideodownloader",
      "cam.cam001.selfie",
      "sweet.facecamera.selfie",
      "sweet.selfie.lite",
      "instagramstory.maker.unfold",
      "com.youdao.hindict",
      "cn.wps.moffice_eng",
      "cn.wps.moffice_i18n",
      "com.life360.android.safetymapd",
      "com.videoeditorpro.android",
      "com.kl.kkchat",
      "com.fancyu.videochat.love",
      "com.asianinno.uplive.aiglamour",
      "com.videochat.livu",
      "com.parau.videochat",
      "com.p1.mobile.putong",
      "com.thankyo.hwgame",
      "com.rcplatform.livechat",
      "video.like",
      "app.buzz.share",
      "com.lenovo.anyshare.gps",
      "com.UCMobile.intl",
      "com.tencent.ig",
      "com.zhiliaoapp.musically.go",
      "com.xprodev.cutcam",
      "cn.xender",
      "com.uc.vmate",
      "com.commsource.beautyplus",
      "club.fromfactory",
      "com.snowwhiteapps.downloader",
      "com.ss.android.ugc.boom",
      "com.domobile.applockwatcher",
      "com.uc.browser.en",
      "com.ss.android.ugc.boomlite",
      "com.uc.vmlite",
      "com.youdao.hindict",
      "com.videochat.livu",
      "com.gotomate.livechat",
      "com.asianinno.uplive",
      "com.awesome.coolguides.live"
          "app.buzz.share"
          "com.nexstreaming.app.kinemasterfree",
      "us.zoom.videomeetings",
      "com.cyberlink.youperfect",
    ];

    suggestedapp(String appname) async {
      var app = appname;
      var url = "";

      if (app == "TikTok") {
        url =
            "https://play.google.com/store/apps/details?id=com.roposo.android";
      }
      if (app == "Likee") {
        url =
            "https://play.google.com/store/apps/details?id=com.roposo.android";
      }
      if (app == "Kwai") {
        url =
            "https://play.google.com/store/apps/details?id=com.roposo.android";
      }
      if (app == "TikTok Lite") {
        url =
            "https://play.google.com/store/apps/details?id=com.roposo.android";
      }
      if (app == "VMate Status") {
        url =
            "https://play.google.com/store/apps/details?id=com.roposo.android";
      }
      if (app == "ZAKZAK LIVE") {
        url =
            "https://play.google.com/store/apps/details?id=com.roposo.android";
      }
      if (app == "UVideo") {
        url =
            "https://play.google.com/store/apps/details?id=com.roposo.android";
      }
      if (app == "MV Master") {
        url =
            "https://play.google.com/store/apps/details?id=com.roposo.android";
      }
      if (app == "Yiyo") {
        url =
            "https://play.google.com/store/apps/details?id=com.roposo.android";
      }
      if (app == "Zili") {
        url =
            "https://play.google.com/store/apps/details?id=com.roposo.android";
      }
      if (app == "TIKA") {
        url =
            "https://play.google.com/store/apps/details?id=com.roposo.android";
      }
      if (app == "Snack Video") {
        url =
            "https://play.google.com/store/apps/details?id=com.roposo.android";
      }
      if (app == "Helo") {
        url =
            "https://play.google.com/store/apps/details?id=in.mohalla.sharechat";
      }

      if (app == "UC Browser") {
        url =
            "https://play.google.com/store/apps/details?id=com.android.chrome";
      }
      if (app == "Mi Browser Pro") {
        url =
            "https://play.google.com/store/apps/details?id=com.android.chrome";
      }
      if (app == "Mint Browser") {
        url =
            "https://play.google.com/store/apps/details?id=com.android.chrome";
      }
      if (app == "SHAREit") {
        url =
            "https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files";
      }
      if (app == "Xender") {
        url =
            "https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files";
      }
      if (app == "CamScanner") {
        url =
            "https://play.google.com/store/apps/details?id=com.adobe.scan.android";
      }
      if (app == "TurboVPN") {
        url =
            "https://play.google.com/store/apps/details?id=ch.protonvpn.android";
      }
      if (app == "AppLock") {
        url =
            "https://play.google.com/store/apps/details?id=com.symantec.applock";
      }
      if (app == "WeChat") {
        url = "https://play.google.com/store/apps/details?id=com.whatsapp";
      }
      if (app == "KineMaster") {
        url =
            "https://play.google.com/store/apps/details?id=com.photo.video.editor.slideshow.videomaker";
      }
      if (app == "BeautyPlus") {
        url =
            "https://play.google.com/store/apps/details?id=com.joeware.android.gpulumera";
      }
      if (app == "WPS Office") {
        url =
            "https://play.google.com/store/apps/details?id=com.google.android.apps.docs";
      }
      if (app == "PUBG") {
        url =
            "https://play.google.com/store/apps/details?id=com.epicgames.fortnite";
      }
      if (app == "PUBG MOBILE LITE") {
        url =
            "https://play.google.com/store/apps/details?id=com.epicgames.fortnite";
      }
      if (app == "Clash of Kings") {
        url =
            "https://play.google.com/store/apps/details?id=com.zynga.empires2";
      }
      if (app == "Mobile Legends") {
        url =
            "https://play.google.com/store/apps/details?id=com.netease.g104na.gb";
      }
      if (app == "Ludo") {
        url = "https://play.google.com/store/apps/details?id=com.ludo.king";
      }
      if (app == "Romwe") {
        url = "https://play.google.com/store/apps/details?id=com.ril.ajio";
      }
      if (app == "Shein") {
        url =
            "https://play.google.com/store/apps/details?id=com.shopping.limeroad";
      }
      if (app == "AliExpress") {
        url = "https://play.google.com/store/apps/details?id=com.tul.tatacliq";
      }
      if (app == "Alibaba.com") {
        url = "https://play.google.com/store/apps/details?id=com.indiamart.m";
      }
      if (app == "Banggood") {
        url =
            "https://play.google.com/store/apps/details?id=in.amazon.mShop.android.shopping";
      }
      if (app == "Zoom") {
        url =
            "https://play.google.com/store/apps/details?id=com.google.android.talk";
      }
      if (app == "ClubFactory") {
        url =
            "https://play.google.com/store/apps/details?id=in.amazon.mShop.android.shopping";
      }
      if (app == "Ludo") {
        url = "https://play.google.com/store/apps/details?id=com.ludo.king";
      }
      if (app == "YouCam Perfect") {
        url =
            "https://play.google.com/store/apps/details?id=com.appbreakers.selficamera";
      }
      if (app == "UC News") {
        url = "https://play.google.com/store/apps/details?id=com.eterno";
      }
      if (app == "NewsDog") {
        url = "https://play.google.com/store/apps/details?id=com.eterno";
      }
      if (app == "Mi Remote Controller") {
        url =
            "https://play.google.com/store/apps/details?id=smart.tv.wifi.remote.control.samcontrol";
      }
      if (app == "UC Cricket") {
        url =
            "https://play.google.com/store/apps/details?id=com.cricbuzz.android";
      }
      if (app == "Video Editor & Video Maker") {
        url =
            "https://play.google.com/store/apps/details?id=com.photo.video.editor.slideshow.videomaker";
      }
      if (app == "Parallel Space") {
        url =
            "https://play.google.com/store/apps/details?id=do.multiple.cloner";
      }
      if (app == "VideoShow Video Editor") {
        url =
            "https://play.google.com/store/apps/details?id=com.photo.video.editor.slideshow.videomaker";
      }

      if (app == "Screen Recorder V Recorder") {
        url =
            "https://play.google.com/store/apps/details?id=videoeditor.videorecorder.screenrecorder";
      }

      if (app == "Sweet Selfie") {
        url =
            "https://play.google.com/store/apps/details?id=com.joeware.android.gpulumera";
      }
      if (app == "U-Dictionary") {
        url =
            "https://play.google.com/store/apps/details?id=com.mobiletranstorapps.all.languages.free.voice.translation";
      }

      if (app == "WPS Office") {
        url =
            "https://play.google.com/store/apps/details?id=com.microsoft.office.word";
      }
      if (app == "Family Locator") {
        url =
            "https://play.google.com/store/apps/details?id=com.life360.android.safetymapd";
      }
      if (app == "VivaCut") {
        url =
            "https://play.google.com/store/apps/details?id=com.wondershare.filmorago";
      }

      if (app == "Collage Maker") {
        url =
            "https://play.google.com/store/apps/details?id=com.lyrebirdstudio.collage";
      }
      if (app == "Photo Editor Pro") {
        url =
            "https://play.google.com/store/apps/details?id=com.niksoftware.snapseed";
      }
      if (app == "Story Maker") {
        url =
            "https://play.google.com/store/apps/details?id=instagram.story.art.collage";
      }
      if (app == "Share Apps & File Transfer") {
        url =
            "https://play.google.com/store/apps/details?id=com.appshare.shrethis.appshare";
      }
      if (app == "KKlive") {
        url =
            "https://play.google.com/store/apps/details?id=com.hkfuliao.chamet";
      }
      if (app == "MeMe Live") {
        url = "https://play.google.com/store/apps/details?id=younow.live";
      }
      if (app == "FancyU") {
        url = "https://play.google.com/store/apps/details?id=younow.live";
      }
      if (app == "Lamour") {
        url = "https://play.google.com/store/apps/details?id=younow.live";
      }
      if (app == "Lamour Love All Over The World") {
        url =
            "https://play.google.com/store/apps/details?id=com.mumu.videochat.india";
      }
      if (app == "LivU") {
        url =
            "https://play.google.com/store/apps/details?id=younow.com.mumu.videochat.india";
      }
      if (app == "ParaU") {
        url =
            "https://play.google.com/store/apps/details?id=com.mumu.videochat.india";
      }
      if (app == "Tantan") {
        url = "https://play.google.com/store/apps/details?id=com.tinder";
      }
      if (app == "StreamKar") {
        url = "https://play.google.com/store/apps/details?id=com.tinder";
      }
      if (app == "Tumile") {
        url =
            "https://play.google.com/store/apps/details?id=global.weventure.product.pulse";
      }
      if (app == "QQ") {
        url = "https://play.google.com/store/apps/details?id=com.netease.mail";
      }
      if (app == "QQMusic") {
        url = "https://play.google.com/store/apps/details?id=com.gana";
      }
      if (app == "Mi Community") {
        url =
            "https://play.google.com/store/apps/details?id=app.le.miui10gestures";
      }
      if (app == "DU Battery saver") {
        url =
            "https://play.google.com/store/apps/details?id=com.kaspersky.batterysaver";
      }
      if (app == "Safe Security") {
        url =
            "https://play.google.com/store/apps/details?id=com.maxdevlab.cleaner.security";
      }
      if (app == "ShareMe") {
        url =
            "https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files";
      }
      if (app == "Mi Calculator") {
        url =
            "https://play.google.com/store/apps/details?id=com.google.android.calculator";
      }
      if (app == "VMate Status 2020") {
        url =
            "https://play.google.com/store/apps/details?id=in.mohalla.sharechat";
      }

      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw "could not launch $url";
      }
    }

    print(chiniespackagename.length);
    double x=1;
    return FutureBuilder(
        future: DeviceApps.getInstalledApplications(
            includeAppIcons: true,
            // includeSystemApps: includeSystemApps,
            onlyAppsWithLaunchIntent: widget.onlyAppsWithLaunchIntent),
        builder: (context, data) {
          if (data.data == null) {


            return 
            
            Center(
              child:CircularProgressIndicator()
            
            );
          } else {
            List<Application> apps = data.data;
            print(apps);

            return ListView.builder(
              itemBuilder: (context, position) {
                Application app = apps[position];
                return Column(
                  children: <Widget>[
                    
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: app is ApplicationWithIcon &&
                              chiniespackagename.contains(app.packageName)
                          ? Column(
                              children: <Widget>[
                                
                                Row(
                                  children: <Widget>[
                                    Card(
                                      elevation: 10,
                                      child: Text(app.appName,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                Card(
                                  margin: EdgeInsets.all(12),
                                  elevation: 10,
                                  shadowColor: Colors.black,
                                  child: Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundImage: MemoryImage(app.icon),
                                        backgroundColor: Colors.white,
                                        radius: 40,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            size: 60,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            //  launchurl(app.appName,app.packageName);
                                            showAlertDialog(context,
                                                app.appName, app.packageName);
                                          }),
                                      SizedBox(width: 30),
                                      GestureDetector(
                                        child: Card(
                                          clipBehavior: Clip.hardEdge,
                                          borderOnForeground: false,
                                          elevation: 10,
                                          shadowColor: Colors.black,
                                          child: Column(
                                            children: <Widget>[
                                              Text("Suggested App",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Icon(
                                                Icons.lightbulb_outline,
                                                size: 70,
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          suggestedapp(app.appName);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(),
                    ),
                  ],
                );
              },
              itemCount: apps.length,
            );
          }
        });
  }

  launchurl(String appname, String packagename) async {
    //"https://play.google.com/store/apps/details?id=com.truecaller";

    String chinaappurl =
        "https://play.google.com/store/apps/details?id=$packagename";

    var url = "";

    if (appname == "Truecaller") {
      url = chinaappurl;
    }
    if (appname == "SHAREit") {
      url = chinaappurl;
    }
    if (appname == "CamScanner") {
      url = chinaappurl;
    }
    if (appname == "BeautyPlus") {
      url = chinaappurl;
    }
    if (appname == "BiGO Live") {
      url = chinaappurl;
    }
    if (appname == "TikTok") {
      url = chinaappurl;
    }
    if (appname == "Kwai") {
      url = chinaappurl;
    }
    if (appname == "UC Mini") {
      url = chinaappurl;
    }
    if (appname == "UC Browser") {
      url = chinaappurl;
    }
    if (appname == "Vigo Video") {
      url = chinaappurl;
    }
    if (appname == "PUBG MOBILE") {
      url = chinaappurl;
    }
    if (appname == "PUBG MOBILE LITE") {
      url = chinaappurl;
    }
    if (appname == "Clash of Kings") {
      url = chinaappurl;
    }
    if (appname == "Mobile Legends") {
      url = chinaappurl;
    }
    if (appname == "SHEIN") {
      url = chinaappurl;
    }
    if (appname == "ROMWE") {
      url = chinaappurl;
    }
    if (appname == "AppLock") {
      url = chinaappurl;
    }
    if (appname == "VMate") {
      url = chinaappurl;
    }
    if (appname == "Mafia City") {
      url = chinaappurl;
    }
    if (appname == "Arena of Valor") {
      url = chinaappurl;
    }
    if (appname == "Ludo World") {
      url = chinaappurl;
    }
    if (appname == "Turbo VPN") {
      url = chinaappurl;
    }
    if (appname == "Unlimited Free VPN Monster") {
      url = chinaappurl;
    }
    if (appname == "Cyber Hunter") {
      url = chinaappurl;
    }
    if (appname == "AFK Arena") {
      url = chinaappurl;
    }
    if (appname == "Dank Tanks") {
      url = chinaappurl;
    }
    if (appname == "Ludo King") {
      url = chinaappurl;
    }
    if (appname == "IndiaMART") {
      url = chinaappurl;
    }
    if (appname == "AliExpress") {
      url = chinaappurl;
    }
    if (appname == "Alibaba.com") {
      url = chinaappurl;
    }
    if (appname == "WeChat") {
      url = chinaappurl;
    }
    if (appname == "UC News") {
      url = chinaappurl;
    }
    if (appname == "NewsDog") {
      url = chinaappurl;
    }
    if (appname == "Video Editor & Video Maker") {
      url = chinaappurl;
    }
    if (appname == "Parallel Space") {
      url = chinaappurl;
    }
    if (appname == "APUS Browser") {
      url = chinaappurl;
    }
    if (appname == "Virus Cleaner") {
      url = chinaappurl;
    }
    if (appname == "CM Browser") {
      url = chinaappurl;
    }
    if (appname == "Mi Community") {
      url = chinaappurl;
    }
    if (appname == "DU Battery saver") {
      url = chinaappurl;
    }
    if (appname == "Safe Security") {
      url = chinaappurl;
    }
    if (appname == "QQ") {
      url = chinaappurl;
    }
    if (appname == "QQMusic") {
      url = chinaappurl;
    }
    if (appname == "UC Cricket") {
      url = chinaappurl;
    }
    if (appname == "POCO Launcher 2.0") {
      url = chinaappurl;
    }
    if (appname == "All downloader 2019") {
      url = chinaappurl;
    }
    if (appname == "Tumile") {
      url = chinaappurl;
    }
    if (appname == "Helo") {
      url = chinaappurl;
    }
    if (appname == "Tik Tok Lite") {
      url = chinaappurl;
    }
    if (appname == "Cut Cut") {
      url = chinaappurl;
    }
    if (appname == "Xender") {
      url = chinaappurl;
    }
    if (appname == "Club Factory") {
      url = chinaappurl;
    }
    if (appname == "VMate Status") {
      url = chinaappurl;
    }
    if (appname == "UDictionary") {
      url = chinaappurl;
    }
    if (appname == "LivU") {
      url = chinaappurl;
    }
    if (appname == "ToGetU") {
      url = chinaappurl;
    }
    if (appname == "Live Chat") {
      url = chinaappurl;
    }
    if (appname == "Battle of empires") {
      url = chinaappurl;
    }
    if (appname == "UpLive") {
      url = chinaappurl;
    }
    if (appname == "Rise of Civilizations") {
      url = chinaappurl;
    }
    if (appname == "Vigo Live") {
      url = chinaappurl;
    }
    if (appname == "King of Avalon") {
      url = chinaappurl;
    }
    if (appname == "Guns of Glory") {
      url = chinaappurl;
    }
    if (appname == "Zak Zak Pro") {
      url = chinaappurl;
    }
    if (appname == "Clash of Kings") {
      url = chinaappurl;
    }
    if (appname == "Castle Clash") {
      url = chinaappurl;
    }
    if (appname == "Game of Sultans") {
      url = chinaappurl;
    }
    if (appname == "NonoLive") {
      url = chinaappurl;
    }
    if (appname == "Web novel") {
      url = chinaappurl;
    }
    if (appname == "Hello Yo") {
      url = chinaappurl;
    }
    if (appname == "Last Empire") {
      url = chinaappurl;
    }
    if (appname == "UVideo") {
      url = chinaappurl;
    }
    if (appname == "MV Master") {
      url = chinaappurl;
    }
    if (appname == "Yiyo") {
      url = chinaappurl;
    }
    if (appname == "Zili") {
      url = chinaappurl;
    }
    if (appname == "TIKA") {
      url = chinaappurl;
    }
    if (appname == "Snack Video") {
      url = chinaappurl;
    }
    if (appname == "AliExpress") {
      url = chinaappurl;
    }
    if (appname == "Banggood") {
      url = chinaappurl;
    }
    if (appname == "Mint Browser") {
      url = chinaappurl;
    }
    if (appname == "Mi Remote controller") {
      url = chinaappurl;
    }
    if (appname == "UC Browser") {
      url = chinaappurl;
    }
    if (appname == "UC News") {
      url = chinaappurl;
    }
    if (appname == "UC Mini") {
      url = chinaappurl;
    }
    if (appname == "UC Cricket") {
      url = chinaappurl;
    }
    if (appname == "Parallel Space") {
      url = chinaappurl;
    }
    if (appname == "VideoShow Video Editior") {
      url = chinaappurl;
    }
    if (appname == "Screen Recorder V Recorder") {
      url = chinaappurl;
    }
    if (appname == "BeautyPlus") {
      url = chinaappurl;
    }
    if (appname == "Sweet Selfie") {
      url = chinaappurl;
    }
    if (appname == "U-Dictionary") {
      url = chinaappurl;
    }
    if (appname == "AppLock") {
      url = chinaappurl;
    }
    if (appname == "WPS Office") {
      url = chinaappurl;
    }
    if (appname == "Family Locator") {
      url = chinaappurl;
    }
    if (appname == "VivaCut") {
      url = chinaappurl;
    }
    if (appname == "Screen Recorder & Video Recorder") {
      url = chinaappurl;
    }
    if (appname == "Collage Maker") {
      url = chinaappurl;
    }
    if (appname == "Photo Editor Pro") {
      url = chinaappurl;
    }
    if (appname == "Story Maker") {
      url = chinaappurl;
    }
    if (appname == "Share Apps & File Transfer") {
      url = chinaappurl;
    }
    if (appname == "KKlive") {
      url = chinaappurl;
    }
    if (appname == "MeMe Live") {
      url = chinaappurl;
    }
    if (appname == "FancyU") {
      url = chinaappurl;
    }
    if (appname == "Lamour") {
      url = chinaappurl;
    }
    if (appname == "Lamour Love All Over The World") {
      url = chinaappurl;
    }
    if (appname == "LivU") {
      url = chinaappurl;
    }
    if (appname == "ParaU") {
      url = chinaappurl;
    }
    if (appname == "Tantan") {
      url = chinaappurl;
    }
    if (appname == "StreamKar") {
      url = chinaappurl;
    }
    if (appname == "Tumile") {
      url = chinaappurl;
    }

    //launcurl.....on playstore
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw " could not launch $url";
    }
  }
//

}
