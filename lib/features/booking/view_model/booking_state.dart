abstract class BookingState {}

class BookingInitial extends BookingState {}


class BookingUpdated extends BookingState {

  final List<Map<String, dynamic>> bookedFlights;

  BookingUpdated(this.bookedFlights);
}