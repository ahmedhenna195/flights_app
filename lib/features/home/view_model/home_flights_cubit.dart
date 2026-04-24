import 'package:flights_app/features/home/data/home_api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_flights_state.dart';

class HomeFlightsCubit extends Cubit<HomeFlightsState> {
  final HomeApiService apiService;

  HomeFlightsCubit(this.apiService) : super(HomeFlightsInitial());

  void fetchFlights() async {
    emit(HomeFlightsLoading());
    try {
      final flights = await apiService.fetchFlightsFromApi();
      emit(HomeFlightsLoaded(flights));
    } catch (e) {
      // السطر ده هيطبعلك المشكلة بالظبط في الكونسول
      print("======== API ERROR: $e ========");
      emit(HomeFlightsError("حدث خطأ أثناء تحميل الرحلات. تأكد من اتصال الإنترنت."));
    }
  }
}