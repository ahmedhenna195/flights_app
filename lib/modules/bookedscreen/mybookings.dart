import 'package:flights_app/core/colors/appcolors.dart';
import 'package:flights_app/core/images/imagespathes.dart';
import 'package:flights_app/core/texts/textstyle.dart';
import 'package:flights_app/core/widgets/flight_ticket_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Mybookings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFFF5F7FA),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          currentIndex: 1,
          selectedItemColor: AppColors.primaryBlue,
          unselectedItemColor: Colors.grey.shade500,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
          onTap: (index) {},
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset(
                  ImagePaths.home,
                  width: 16,
                  height: 16,
                  colorFilter: ColorFilter.mode(
                    Colors.grey.shade500,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset(
                  ImagePaths.home,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryBlue,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset(
                  ImagePaths.booked,
                  width: 20,
                  height: 16,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryBlue,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Booked',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset(
                  ImagePaths.person,
                  width: 16,
                  height: 16,
                  colorFilter: ColorFilter.mode(
                    Colors.grey.shade500,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
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
                  ListView(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    children: [
                      FlightTicketCard(
                        logoBgColor: Colors.red.shade50,
                        airlineLogo: ImagePaths.redFlight,
                        airlineName: 'British Airways',
                        flightClass: 'Economy Class',
                        classBgColor: Colors.blue.shade50,
                        classTextColor: Colors.blue.shade700,
                        departureCode: 'CDG',
                        departureCity: 'Paris',
                        departureTime: '10:10',
                        arrivalCode: 'LHR',
                        arrivalCity: 'London',
                        arrivalTime: '10:40',
                        duration: '90 min',
                        stopType: 'Non-stop',
                        date: 'Jun 24, 2024',
                        price: '\$150',
                      ),
                      SizedBox(height: 16),
                      FlightTicketCard(
                        logoBgColor: Colors.blue.shade50,
                        airlineLogo: ImagePaths.blueFlight,
                        airlineName: 'Air France',
                        flightClass: 'Business Class',
                        classBgColor: Colors.orange.shade50,
                        classTextColor: Colors.orange.shade700,
                        departureCode: 'HND',
                        departureCity: 'Tokyo',
                        departureTime: '08:00',
                        arrivalCode: 'CDG',
                        arrivalCity: 'Paris',
                        arrivalTime: '20:45',
                        duration: '12h 45m',
                        stopType: 'Non-stop',
                        date: 'Jun 24, 2024',
                        price: '\$150',
                      ),
                      SizedBox(height: 16),
                      FlightTicketCard(
                        airlineLogo: ImagePaths.redFlight,
                        logoBgColor: Color(0xFFFFF0F0),
                        airlineName: 'British Airways',
                        flightClass: 'ECONOMY CLASS',
                        classBgColor: Colors.blue.shade50,
                        classTextColor: Colors.blue.shade700,
                        departureCode: 'CDG',
                        departureCity: 'Paris',
                        departureTime: '10:10',
                        arrivalCode: 'LHR',
                        arrivalCity: 'London',
                        arrivalTime: '10:40',
                        duration: '90 min',
                        stopType: 'Non-stop',
                        date: 'Jun 24, 2024',
                        price: '\$150',
                      ),
                    ],
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