import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{

  String location;//location name for the UT
  late String time;//// the time in that location
  String flag;//url to asset flag icon
  String url;
  late bool isDaytime;//true or false if daytime or not

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async{

    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data= jsonDecode(response.body);
      // print(data);

      //get properties from data
      String datetime= data['datetime'];
      String offset= data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);
      //create datetime object

      DateTime now= DateTime.parse(datetime);
      now=now.add(Duration(hours: int.parse(offset)));
      print(now);

      //set the itme property
      isDaytime= now.hour>6 && now.hour<20? true: false;
      time= DateFormat.jm().format(now);

    }
    catch(e){
      print('Caught error: $e');
      time='could not get time data';
    }


  }
}

