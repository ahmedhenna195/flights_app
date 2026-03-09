
import 'package:flights_app/modules/bookedscreen/mybookings.dart';
import 'package:flights_app/modules/flightdetails/flight_information.dart';
import 'package:flights_app/modules/home/home_layout.dart';
import 'package:flights_app/modules/profilescreen/profile_screen.dart';
import 'package:flights_app/modules/signscreen/sign_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SignIn(),
    );
  } }