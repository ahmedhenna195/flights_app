import 'package:flights_app/features/auth/view/sign_in.dart';
import 'package:flights_app/features/booking/view/flight_information.dart';
import 'package:flights_app/features/booking/view/mybookings.dart';
import 'package:flights_app/features/home/home_layout.dart';
import 'package:flights_app/features/layout/view/main_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/view_model/auth_cubit.dart';
import 'features/booking/view_model/booking_cubit.dart';
import 'features/favorites/view_model/favorites_cubit.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(create: (context) => FavoritesCubit()),
          BlocProvider(create: (context) => BookingCubit()),
        ],
        child: SignIn(),
      ),
    );
  } }