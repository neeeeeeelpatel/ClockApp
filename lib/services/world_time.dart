import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class worldtime {

 late String location; // location name for the UI
  late String time ; // time in that location
  late String flag; // url to the flag icon
  late String Url; //  location for API endpoint
late bool isDayTime;// shows if day or night
late int dayofweek;

  worldtime({this.location='', this.time='', this.flag='', this.Url='', this.dayofweek=0});

  Future <void> getTime() async
  {

    try{
      //Make a request
      Uri url = Uri.parse('http://worldtimeapi.org/api/timezone/$Url');
      Response response = await get(url);
      Map data = jsonDecode(response.body);


      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 6);
       int dayofweek = data['day_of_week'];


//Create date time object

      List<String> offsetParts = offset.split(':');
      int hours = int.parse(offsetParts[0]);
      int minutes = int.parse(offsetParts[1]);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: hours, minutes: minutes));





      //Set time property
      isDayTime = now.hour>6 && now.hour<20 ? true:false;
      time = DateFormat.jm().format(now);
      this.dayofweek = dayofweek;



    }
    catch(e)
    {
      print('Caught error: $e');
      time = 'couldnt get time data';
    }

  }
}

