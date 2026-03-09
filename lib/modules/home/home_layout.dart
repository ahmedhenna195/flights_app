import 'package:flights_app/core/colors/appcolors.dart';
import 'package:flights_app/core/images/imagespathes.dart';
import 'package:flights_app/core/texts/textstyle.dart';
import 'package:flights_app/core/widgets/flight_ticket_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        currentIndex: 0,
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: Colors.grey.shade500,
        selectedLabelStyle:  TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        unselectedLabelStyle:  TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
        onTap: (index) {
        },
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
              padding:  EdgeInsets.only(bottom: 4.0),
              child: SvgPicture.asset(
                ImagePaths.booked,
                width: 20,
                height: 16,
                colorFilter: ColorFilter.mode(
                  Colors.grey.shade500,
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: 'Booked',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding:  EdgeInsets.only(bottom: 4.0),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: AppColors.primaryBlue,
            padding:  EdgeInsets.only(top: 32, left: 24, right: 24, bottom: 24),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration:  BoxDecoration(
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
            padding:  EdgeInsets.symmetric(horizontal: 24),
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
                      decoration:  BoxDecoration(
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
                    Text(
                      'Favorite Flights',
                      style: AppTextStyles.font18MediumBlack,
                    ),
                    Text(
                      'See all',
                      style: AppTextStyles.font14MediumBlue,
                    ),
                  ],
                ),
                 SizedBox(height: 16),
                SizedBox(
                  height: 230,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
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
                              offset:  Offset(0, 4),
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
                                  child: Container(
                                    padding:  EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.6),
                                      shape: BoxShape.circle,
                                    ),
                                    child:  Icon(
                                      Icons.favorite_border,
                                      color: Colors.redAccent,
                                      size: 20,
                                    ),
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
                              offset:  Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius:  BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image(
                                    image: AssetImage(ImagePaths.london),
                                    height: 144, width: 278, fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 12,
                                  right: 12,
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.6),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.favorite_border, color: Colors.red, size: 20),
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
                Text(
                  'Discover Flights',
                  style: AppTextStyles.font18MediumBlack,
                ),
                 SizedBox(height: 16),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding:  EdgeInsets.symmetric(horizontal: 24),
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
                  logoBgColor:  Color(0xFFFFF0F0),
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
          ),
        ],
      ),
    );
  }
}