import "dart:io";
import 'package:firebase_admob/firebase_admob.dart';

class AdMobService{

String getAdMobAppId(){
  if(Platform.isAndroid){
    //realaddid
    return  "ca-app-pub-6517770398502887~4848455358";
  }
  return null;
}

String getBannerAdId(){
  if(Platform.isAndroid){
   
    //for test "ca-app-pub-3940256099942544/6300978111";
    return "ca-app-pub-6517770398502887/7091475313";
  }
  return null;

}}