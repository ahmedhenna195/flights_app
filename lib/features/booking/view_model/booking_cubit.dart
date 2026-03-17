import 'package:flutter_bloc/flutter_bloc.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  final List<Map<String, dynamic>> _bookedFlights = [];


  void bookFlight(Map<String, dynamic> flightData) {

    _bookedFlights.add(flightData);

    emit(BookingUpdated(List.from(_bookedFlights)));
  }
}