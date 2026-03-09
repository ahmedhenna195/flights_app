import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flights_app/core/colors/appcolors.dart';


class FlightTicketCard extends StatelessWidget {
  final String airlineLogo;
  final Color logoBgColor;
  final String airlineName;
  final String flightClass;
  final Color classBgColor;
  final Color classTextColor;

  final String departureCode;
  final String departureCity;
  final String departureTime;

  final String arrivalCode;
  final String arrivalCity;
  final String arrivalTime;

  final String duration;
  final String stopType;

  final String date;
  final String price;

  const FlightTicketCard({
    super.key,
    required this.airlineLogo,
    required this.logoBgColor,
    required this.airlineName,
    required this.flightClass,
    required this.classBgColor,
    required this.classTextColor,
    required this.departureCode,
    required this.departureCity,
    required this.departureTime,
    required this.arrivalCode,
    required this.arrivalCity,
    required this.arrivalTime,
    required this.duration,
    required this.stopType,
    required this.date,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset:  Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [

              Container(
                width: 40,
                height: 40,
                padding:  EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: logoBgColor,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(airlineLogo),
              ),
               SizedBox(width: 12),
              Text(
                airlineName,
                style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
               Spacer(),
              Container(
                padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: classBgColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  flightClass.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: classTextColor,
                  ),
                ),
              ),
            ],
          ),
           SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(departureCode, style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                   SizedBox(height: 4),
                  Text(departureCity.toUpperCase(), style:  TextStyle(fontSize: 12, color: Colors.grey, letterSpacing: 1.2)),
                   SizedBox(height: 4),
                  Text(departureTime, style:  TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              ),
              Expanded(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Text(duration, style:  TextStyle(fontSize: 12, color: Colors.grey)),
                       SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: 8, height: 8,
                            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.primaryBlue, width: 2), color: Colors.white),
                          ),
                          Expanded(child: Container(height: 2, color: Colors.grey.shade300)),
                          Container(
                            width: 8, height: 8,
                            decoration:  BoxDecoration(shape: BoxShape.circle, color: AppColors.primaryBlue),
                          ),
                        ],
                      ),
                       SizedBox(height: 8),
                      Text(stopType, style:  TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryBlue)),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(arrivalCode, style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                   SizedBox(height: 4),
                  Text(arrivalCity.toUpperCase(), style:  TextStyle(fontSize: 12, color: Colors.grey, letterSpacing: 1.2)),
                   SizedBox(height: 4),
                  Text(arrivalTime, style:  TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
           SizedBox(height: 24),
          Row(
            children: [
               Icon(Icons.calendar_month_outlined, color: Colors.grey, size: 16),
               SizedBox(width: 4),
              Text(date, style:  TextStyle(fontSize: 14, color: Colors.grey)),
               Spacer(),
              Text(price, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
            ],
          ),
        ],
      ),
    );
  }
}