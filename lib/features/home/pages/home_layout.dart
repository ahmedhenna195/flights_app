import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flights_app/core/colors/appcolors.dart';
import 'package:flights_app/core/images/imagespathes.dart';
import 'package:flights_app/core/texts/textstyle.dart';
import 'package:flights_app/core/widgets/flight_ticket_card.dart';
import 'package:flights_app/features/home/view_model/home_flights_cubit.dart';
import 'package:flights_app/features/home/view_model/home_flights_state.dart';
import 'package:flights_app/features/favorites/view_model/favorites_cubit.dart';
import 'package:flights_app/features/favorites/view_model/favorites_state.dart';
import 'package:flights_app/features/booking/view_model/booking_cubit.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: AppColors.primaryBlue,
            padding: EdgeInsets.only(top: 32, left: 24, right: 24, bottom: 24),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, John',
                        style: AppTextStyles.font20MediumWhite,
                      ),
                      Text(
                        'Where are we flying today?',
                        style: AppTextStyles.font14SmallWhite,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search flights',
                            hintStyle: AppTextStyles.font16MediumGray,
                            prefixIcon: Icon(Icons.search, color: Colors.grey, size: 28),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.tune_rounded, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Favorite Flights', style: AppTextStyles.font18MediumBlack),
                    Text('See all', style: AppTextStyles.font14MediumBlue),
                  ],
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 230,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 280,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image(
                                    image: AssetImage(ImagePaths.paris),
                                    height: 144,
                                    width: 278,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 12,
                                  right: 12,
                                  child: BlocBuilder<FavoritesCubit, FavoritesState>(
                                    builder: (context, state) {
                                      var cubit = context.read<FavoritesCubit>();
                                      String flightId = "paris_london_01";
                                      bool isFav = cubit.isFavorite(flightId);
                                      return GestureDetector(
                                        onTap: () {
                                          cubit.toggleFavorite(flightId);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.6),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            isFav ? Icons.favorite : Icons.favorite_border,
                                            color: isFav ? Colors.redAccent : Colors.grey,
                                            size: 20,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Paris to London', style: AppTextStyles.font16BoldBlack),
                                      Text('\$150', style: AppTextStyles.font16BoldBlue),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text('Direct • 1h 20m', style: AppTextStyles.font12MediumGray),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        width: 280,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image(
                                    image: AssetImage(ImagePaths.london),
                                    height: 144,
                                    width: 278,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 12,
                                  right: 12,
                                  child: BlocBuilder<FavoritesCubit, FavoritesState>(
                                    builder: (context, state) {
                                      var cubit = context.read<FavoritesCubit>();
                                      String flightId = "london_newyork_02";
                                      bool isFav = cubit.isFavorite(flightId);
                                      return GestureDetector(
                                        onTap: () {
                                          cubit.toggleFavorite(flightId);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.6),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            isFav ? Icons.favorite : Icons.favorite_border,
                                            color: isFav ? Colors.redAccent : Colors.grey,
                                            size: 20,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('London to New York', style: AppTextStyles.font16BoldBlack),
                                      Text('\$220', style: AppTextStyles.font16MediumBlue),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text('1 Stop • 8h 15m', style: AppTextStyles.font12MediumGray),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Text('Discover Flights', style: AppTextStyles.font18MediumBlack),
                SizedBox(height: 16),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<HomeFlightsCubit, HomeFlightsState>(
              builder: (context, state) {
                if (state is HomeFlightsLoading) {
                  return Center(child: CircularProgressIndicator(color: AppColors.primaryBlue));
                } else if (state is HomeFlightsError) {
                  return Center(child: Text(state.message, style: TextStyle(color: Colors.red)));
                } else if (state is HomeFlightsLoaded) {
                  if (state.flights.isEmpty) {
                    return Center(child: Text("No flights available."));
                  }
                  return ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    itemCount: state.flights.length,
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final flight = state.flights[index];
                      return InkWell(
                        borderRadius: BorderRadius.circular(24),
                        onTap: () {
                          Map<String, dynamic> flightToBook = {
                            'airlineName': flight.airlineName,
                            'departureCity': 'Paris',
                            'arrivalCity': 'London',
                            'date': 'Jun 24, 2026',
                            'price': flight.price,
                          };
                          context.read<BookingCubit>().bookFlight(flightToBook);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Flight Booked Successfully! Check Booked Tab.'),
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        child: FlightTicketCard(
                          airlineLogo: ImagePaths.redFlight,
                          logoBgColor: Colors.red.shade50,
                          airlineName: flight.airlineName,
                          flightClass: 'Economy Class',
                          classBgColor: Colors.blue.shade50,
                          classTextColor: Colors.blue.shade700,
                          departureCode: flight.departureCode,
                          departureCity: 'Paris',
                          departureTime: flight.departureTime,
                          arrivalCode: flight.arrivalCode,
                          arrivalCity: 'London',
                          arrivalTime: flight.arrivalTime,
                          duration: flight.duration,
                          stopType: 'Non-stop',
                          date: 'Jun 24, 2026',
                          price: flight.price,
                        ),
                      );
                    },
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}