
import 'package:flights_app/features/home/models/flight_model.dart';

abstract class HomeFlightsState {}
class HomeFlightsInitial extends HomeFlightsState {}
class HomeFlightsLoading extends HomeFlightsState {}
class HomeFlightsLoaded extends HomeFlightsState {
  final List<FlightModel> flights;
  HomeFlightsLoaded(this.flights);
}
class HomeFlightsError extends HomeFlightsState {
  final String message;
  HomeFlightsError(this.message);
}