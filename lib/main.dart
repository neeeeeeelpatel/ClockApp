import 'package:flutter/material.dart';
import 'package:time/PAGES/home.dart';
import 'package:time/PAGES/loading.dart';
import 'package:time/PAGES/choose_location.dart';

void main()=> runApp(MaterialApp(
 initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (conext) => Home(),
    '/location' : (context) => Choose_location(),

  },
));

