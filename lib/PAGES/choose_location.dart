import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:time/services/world_time.dart';

class Choose_location extends StatefulWidget {
  const Choose_location({super.key});

  @override
  State<Choose_location> createState() => _Choose_locationState();
}




class _Choose_locationState extends State<Choose_location> {

  List<worldtime> locations = [
    worldtime(Url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    worldtime(Url: 'Europe/London', location: 'London', flag: 'uk.webp'),
    worldtime(Url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    worldtime(Url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    worldtime(Url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    worldtime(Url: 'America/Chicago', location: 'Chicago', flag: 'usa.webp'),
    worldtime(Url: 'America/New_York', location: 'New York', flag: 'usa.webp'),
    worldtime(Url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.jpg'),
    worldtime(Url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.webp'),
  ];

  void updateTime(index) async{
    worldtime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
      'dayofweek':instance.dayofweek,
    });


  }


  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
        body: ListView.builder(
          itemCount:locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical:1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                )
              ),
            );
          },
        ),
      
      
    );
  }
}
