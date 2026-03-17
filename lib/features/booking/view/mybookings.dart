import 'package:flights_app/core/colors/appcolors.dart';
import 'package:flights_app/core/images/imagespathes.dart';
import 'package:flights_app/core/texts/textstyle.dart';
import 'package:flights_app/core/widgets/flight_ticket_card.dart';
import 'package:flights_app/features/booking/view_model/booking_cubit.dart';
import 'package:flights_app/features/booking/view_model/booking_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Mybookings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFFF5F7FA),
        appBar: AppBar(
          backgroundColor: AppColors.primaryBlue,
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(
            'My Bookings',
            style: AppTextStyles.font18MediumWhite,
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 55,
              color: AppColors.primaryBlue,
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorColor: Colors.white,
                indicatorWeight: 3.0,
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                labelStyle:AppTextStyles.font14MediumWhite ,
                unselectedLabelStyle: AppTextStyles.font14SmallWhite,
                tabs: [
                  Tab(text: 'Upcoming'),
                  Tab(text: 'Past'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  BlocBuilder<BookingCubit, BookingState>(
                    builder: (context, state) {
                      List<Map<String, dynamic>> flights = [];
                      if (state is BookingUpdated) {
                        flights = state.bookedFlights;
                      }
                      if (flights.isEmpty) {
                        return Center(
                          child: Text(
                            'No flights booked yet.',
                            style: AppTextStyles.font18MediumBlack,
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: flights.length,
                        itemBuilder: (context, index) {
                          var flight = flights[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            child: FlightTicketCard(
                              airlineName: flight['airlineName'],
                              departureCity: flight['departureCity'],
                              arrivalCity: flight['arrivalCity'],
                              date: flight['date'],
                              price: flight['price'],
                              logoBgColor: Colors.red.shade50,
                              airlineLogo: ImagePaths.redFlight,
                              flightClass: 'Economy Class',
                              classBgColor: Colors.blue.shade50,
                              classTextColor: Colors.blue.shade700,
                              departureCode: 'CDG',
                              departureTime: '10:10',
                              arrivalCode: 'LHR',
                              arrivalTime: '10:40',
                              duration: '90 min',
                              stopType: 'Non-stop',
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Center(
                    child: Text(
                      'No past bookings yet',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}