import 'package:flights_app/core/colors/appcolors.dart';
import 'package:flights_app/core/images/imagespathes.dart';
import 'package:flights_app/core/texts/textstyle.dart';
import 'package:flights_app/core/widgets/feature_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../view_model/booking_cubit.dart';

class FlightInformation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7F8),
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        iconTheme:IconThemeData(color: Colors.white),
        leading:
        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),),
        title: Text(
          'Flight Details',
          style: AppTextStyles.font18MediumWhite,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 124,
            color: AppColors.primaryBlue,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24,horizontal:24 ,),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    width: 64,
                    height: 64,
                    child: Image( width: 40,
                      height: 40,
                      image: AssetImage(ImagePaths.britishAirwaysLogo,
                    ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'British Airways',
                        style: AppTextStyles.font23BoldWhite,
                      ),
                      SizedBox(height: 7),
                      Text(
                        'BA 301',
                        style: AppTextStyles.font16MediumWhite,
                      ),
                    ],
                  ),
                  SizedBox(width: 14,),
                  Container(
                    padding:  EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child:  Icon(
                      Icons.favorite_border,
                      color: Colors.redAccent,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
           Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.only(top: 32, left: 24, right: 24 ,bottom: 24, ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration:  BoxDecoration(
                          color: Color(0xFFE8F1FC),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            ImagePaths.blueFlight,
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFF1E56A0),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 60,
                        color: Colors.grey.shade200,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1E56A0),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            ImagePaths.whiteFlight,
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                   SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text(
                              '10:40 AM',
                              style: AppTextStyles.font20MediumBlack ,
                            ),
                            Text(
                              'CDG',
                              style: AppTextStyles.font16Medium2Gray,
                            ),
                          ],
                        ),
                         SizedBox(height: 4),
                        Text(
                          'Charles de Gaulle Airport, Paris',
                          style:AppTextStyles.font14MediumGray ,
                        ),
                        SizedBox(height: 22),
                        Row(
                          children: [
                            Expanded(child: Divider(color: Colors.grey.shade200, thickness: 1.5)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                '1H 30M FLIGHT',
                                style: AppTextStyles.font12Medium2Gray ,
                              ),
                            ),
                            Expanded(child: Divider(color: Colors.grey.shade200, thickness: 1.5)),
                          ],
                        ),
                        SizedBox(height: 22),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text(
                              '10:40 AM',
                              style: AppTextStyles.font20MediumBlack
                            ),
                            Text(
                              'LHR',
                              style: AppTextStyles.font16Medium2Gray,
                            ),
                          ],
                        ),
                         SizedBox(height: 4),
                        Text(
                          'Heathrow Airport, London',
                          style: AppTextStyles.font14MediumGray ,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Flight Experience',
                    style: AppTextStyles.font18MediumBlack,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        height: 54,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: AppColors.borderColor,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              ImagePaths.airplane,
                              width: 18,
                              height: 18,
                              colorFilter:  ColorFilter.mode(
                                Color(0xFF1E56A0),
                                BlendMode.srcIn,
                              ),
                            ),
                             SizedBox(width: 11),
                            Text(
                              'Airbus A319',
                              style: AppTextStyles.font14BoldBlack,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        height: 54,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color:  Color(0xFFE8F1FC),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              ImagePaths.bluePerson,
                              width: 18,
                              height: 18,
                              colorFilter: ColorFilter.mode(
                                Color(0xFF1976D2),
                                BlendMode.srcIn,
                              ),
                            ),
                             SizedBox(width: 8),
                            Text(
                              'Economy Class',
                              style: AppTextStyles.font13MediumBlue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,),
            child: Text(
              'Extensions',
              style: AppTextStyles.font18MediumBlack,
            ),
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 40),
              children: [
                FlightFeatureItem(iconPath: ImagePaths.ruler, title: 'Average legroom (31 in)',iconHeight:12 ,iconWidth:20 ,),
                FlightFeatureItem(iconPath: ImagePaths.wifi, title: 'Wi-Fi for a fee)',iconHeight:17 ,iconWidth:24 ,),
                FlightFeatureItem(iconPath: ImagePaths.outlet, title: 'In-seat power & USB outlets)',iconHeight:16 ,iconWidth:18 ,),
                FlightFeatureItem(iconPath: ImagePaths.video, title: 'On-demand video)',iconHeight:16 ,iconWidth:20 ,),
                FlightFeatureItem(iconPath: ImagePaths.tree, title: 'Carbon emissions estimate: 461 kg)',iconHeight:16.99 ,iconWidth:17 ,),
              ],
            ),
          ),
          SafeArea(
            bottom: true,
            top: false,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TOTAL PRICE',
                            style:AppTextStyles.font12BoldBlack ,
                          ),
                          SizedBox(height: 4),
                          Text(
                            '€142.00',
                            style: AppTextStyles.font24BoldBlack,
                          ),
                        ],
                      ),
                      Text(
                        'SAVER FARE',
                        style: GoogleFonts.inter(
                          color: Color(0xFF0F9D58),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  InkWell(
                    onTap: () { Map<String, dynamic> myFlight = {
                      'airlineName': 'British Airways',
                      'departureCity': 'Paris',
                      'arrivalCity': 'London',
                      'date': 'Jun 24, 2024',
                      'price': '\$150',
                    };
                    context.read<BookingCubit>().bookFlight(myFlight);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Flight Booked Successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Book Flight',
                            style:AppTextStyles.font16MediumWhite,
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
