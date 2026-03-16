import 'package:flights_app/core/colors/appcolors.dart';
import 'package:flights_app/core/images/imagespathes.dart';
import 'package:flights_app/features/booking/view/mybookings.dart';
import 'package:flights_app/features/home/home_layout.dart';
import 'package:flights_app/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int currentIndex = 0;
  final List<Widget> screens = [
    HomeLayout(),
    Mybookings(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: Colors.grey.shade500,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: SvgPicture.asset(
                ImagePaths.home,
                width: 16, height: 16,
                colorFilter: ColorFilter.mode(Colors.grey.shade500, BlendMode.srcIn),
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: SvgPicture.asset(
                ImagePaths.home,
                width: 16, height: 16,
                colorFilter: ColorFilter.mode(AppColors.primaryBlue, BlendMode.srcIn),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: SvgPicture.asset(
                ImagePaths.booked,
                width: 20, height: 16,
                colorFilter: ColorFilter.mode(Colors.grey.shade500, BlendMode.srcIn),
              ),
            ),
            activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: SvgPicture.asset(
              ImagePaths.booked,
              width: 20, height: 16,
              colorFilter: ColorFilter.mode(AppColors.primaryBlue, BlendMode.srcIn),
            ),
          ),
            label: 'Booked',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: SvgPicture.asset(
                ImagePaths.person,
                width: 16, height: 16,
                colorFilter: ColorFilter.mode(Colors.grey.shade500, BlendMode.srcIn),
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: SvgPicture.asset(
                ImagePaths.person,
                width: 16, height: 16,
                colorFilter: ColorFilter.mode(AppColors.primaryBlue, BlendMode.srcIn),
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}