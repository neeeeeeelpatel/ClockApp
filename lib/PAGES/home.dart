import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data ={};



  @override
  Widget build(BuildContext context) {

    data = (data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?)!;
    print(data);

    //set background
    String bgImage = data?['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data?['isDayTime'] ? Colors.blueAccent : Colors.indigo;

    return   Scaffold(
        backgroundColor: bgColor,
      body: SafeArea(


          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120,0,0),
              child: Column(
                children: [
                   TextButton.icon(onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                     setState(() {
                       data = {
                         'time': result['time'],
                         'location': result['location'],
                         'isDayTime': result['isDayTime'],
                         'flag': result['flag'],
                         'dayofweek': result['dayofweek'],
                       };
                     });
                   },
                  icon: Icon(Icons.edit_location,
                        color: Colors.grey,
                  ),
                  label: Text('Edit loaction',
                        style: TextStyle(
                          color: Colors.grey[300],
                        ),
                  ),
                   ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data
                      ['location'],
                      style: const TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.yellowAccent,

                      ),),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    data['time'],
                    style:const TextStyle(
                      fontSize: 66.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.0,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                      'Day of the Week',
                        style: const TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.yellowAccent,

                        ),),
                    ],
                  ),
                  SizedBox(height: 10.0,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data
                      ['dayofweek'].toString(),
                        style: const TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.yellowAccent,

                        ),),
                    ],
                  ),
                ],
              ),
            ),
          ),
    ));
  }
}
