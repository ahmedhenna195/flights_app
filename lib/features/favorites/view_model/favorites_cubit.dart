import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  final List<String> _favoriteFlights = [];


  void toggleFavorite(String flightId) {
    if (_favoriteFlights.contains(flightId)) {
      _favoriteFlights.remove(flightId);
    } else {
      _favoriteFlights.add(flightId);
    }

    emit(FavoritesUpdated(List.from(_favoriteFlights)));
  }
  bool isFavorite(String flightId) {
    return _favoriteFlights.contains(flightId);
  }
}