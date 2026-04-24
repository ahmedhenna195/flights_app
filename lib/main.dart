import 'package:flights_app/features/home/data/home_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/view/sign_in.dart';
import 'features/auth/view_model/auth_cubit.dart';
import 'features/booking/view_model/booking_cubit.dart';
import 'features/favorites/view_model/favorites_cubit.dart';
import 'features/home/view_model/home_flights_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => FavoritesCubit()),
        BlocProvider(create: (context) => BookingCubit()),
        BlocProvider(create: (context) => HomeFlightsCubit(HomeApiService())..fetchFlights()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignIn(),
      ),
    );
  }
}