class FlightModel {
  final String airlineName;
  final String airlineLogo;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final String price;
  final String departureCode;
  final String arrivalCode;

  FlightModel({
    required this.airlineName,
    required this.airlineLogo,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.price,
    required this.departureCode,
    required this.arrivalCode,
  });

  factory FlightModel.fromJson(Map<String, dynamic> json) {
    var flightDetails = json['flights'][0];
    return FlightModel(
      airlineName: flightDetails['airline'] ?? 'Unknown Airline',
      airlineLogo: json['airline_logo'] ?? '',
      departureTime: flightDetails['departure_airport']['time']?.substring(11, 16) ?? '00:00',
      arrivalTime: flightDetails['arrival_airport']['time']?.substring(11, 16) ?? '00:00',
      duration: json['total_duration']?.toString() ?? 'N/A',
      price: json['price']?.toString() != null ? '\$${json['price']}' : 'N/A',
      departureCode: flightDetails['departure_airport']['id'] ?? 'N/A',
      arrivalCode: flightDetails['arrival_airport']['id'] ?? 'N/A',
    );
  }
}