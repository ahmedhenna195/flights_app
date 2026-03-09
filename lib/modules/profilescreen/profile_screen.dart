import 'package:flights_app/core/colors/appcolors.dart';
import 'package:flights_app/core/images/imagespathes.dart';
import 'package:flights_app/core/texts/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        currentIndex: 2,
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
                  AppColors.primaryBlue,
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
        iconTheme:IconThemeData(color: Colors.white),
        leading:
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),),
        title: Text(
          'Profile',
          style: AppTextStyles.font18MediumWhite,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.primaryBlue,
            width: double.infinity,
            padding:  EdgeInsets.only(top: 32, bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  margin: EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, 
                    border: Border.all(
                      color: Colors.white,
                      width: 3, 
                    ),
                    image: DecorationImage(
                      image: AssetImage(ImagePaths.picture),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color:  Color(0xFFF5B03A),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child:  Text(
                    'GOLD MEMBER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                SizedBox(height:5 ,),
                Text(
                  'John',
                  style: AppTextStyles.font24BoldWhite,
                ),
                SizedBox(height: 4,),
                Text(
                  'John@traveler.com',
                  style: AppTextStyles.font16SmallWhite,
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24,),
            child:
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 15,
                    offset:  Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ACCOUNT',
                    style: AppTextStyles.font12Medium2Gray,
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration:  BoxDecoration(
                          color: Color(0xFFF0F5FA),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            ImagePaths.heart,
                            width: 11.67,
                            height: 10.7,
                            colorFilter: ColorFilter.mode(
                              Colors.redAccent, // لون القلب أحمر
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                       SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Favorite Flights',
                          style: AppTextStyles.font16BoldBlack ,
                        ),
                      ),
                       Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(
                      color: Colors.grey.shade100,
                      thickness: 1.5,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration:  BoxDecoration(
                          color: Color(0xFFFCEAE9),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            ImagePaths.out,
                            width: 18,
                            height: 18,
                            colorFilter: ColorFilter.mode(
                              Color(0xFFD32F2F),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                       SizedBox(width: 16),
                       Text(
                        'Log Out',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffDC2626),),
                      ),
                    ],
                  ),
                ],
              ),
          ),
          ),],
      ),
    );
  }
}
