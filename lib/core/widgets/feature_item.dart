import 'package:flights_app/core/texts/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlightFeatureItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final Color iconColor;
  final double iconWidth;
  final double iconHeight;

  const FlightFeatureItem({
    super.key,
    required this.iconPath,
    required this.title,
    this.iconWidth = 20.0,
    this.iconHeight = 16.0,

    this.iconColor = const Color(0xFF1E56A0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,),
      child: Container(
        height: 54,
        margin:  EdgeInsets.only(bottom: 12),
        padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: iconWidth,
              height: iconHeight,
              colorFilter: ColorFilter.mode(
                iconColor,
                BlendMode.srcIn,
              ),
            ),
             SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.font14MediumBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}