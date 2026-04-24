import 'package:dio/dio.dart';
import '../models/flight_model.dart';

class HomeApiService {
  final Dio _dio = Dio();
  final String apiKey = "bedf72c07f25fe3c88e119fd0228ac288a61566d6fcf166ca87f01dcb5010830";

  Future<List<FlightModel>> fetchFlightsFromApi() async {
    try {
      final response = await _dio.get(
        'https://serpapi.com/search.json',
        queryParameters: {
          'engine': 'google_flights',
          'departure_id': 'CDG',
          'arrival_id': 'LHR',
          'outbound_date': '2026-05-10',
          'type': '2',
          'hl': 'en',
          'api_key': apiKey,
        },
      );

      List<dynamic> bestFlightsJson = response.data['best_flights'] ?? [];
      return bestFlightsJson.map((json) => FlightModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Failed to load flights: $e");
    }
  }
}