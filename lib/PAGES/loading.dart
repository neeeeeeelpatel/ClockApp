import 'package:flutter/material.dart';
import 'package:time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}




class _LoadingState extends State<Loading> {

  void setupWorldTime ()async
  {
    worldtime instance = worldtime(location: 'Kolkata', flag:'india.png', Url:'Asia/Kolkata',dayofweek: 0);
   await instance.getTime();
   Navigator.pushReplacementNamed(context, '/home', arguments: {
     'location': instance.location,
     'flag': instance.flag,
     'time': instance.time,
     'isDayTime': instance.isDayTime,
     'dayofweek':instance.dayofweek,

   });

  }

  void initState(){
    super.initState();
    setupWorldTime();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 80.0,
        ),

      )
    );
  }
}
