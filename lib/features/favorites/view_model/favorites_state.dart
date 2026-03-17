abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesUpdated extends FavoritesState {
  final List<String> favoriteFlights;

  FavoritesUpdated(this.favoriteFlights);
}