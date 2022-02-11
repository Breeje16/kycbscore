import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kycbscore/presentation/journeys/check_screen.dart';
import 'package:kycbscore/presentation/journeys/profile_screen.dart';
import 'package:kycbscore/presentation/journeys/rate_screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int index = 0;
  List listOfScreens = [
    const RateScreens(),
    const CheckScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        title: Center(
          child: Text(
            "KYCB Score",
            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      body: listOfScreens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.purple.shade100,
          labelTextStyle: MaterialStateProperty.all(TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          )),
        ),
        child: NavigationBar(
            height: 60.h,
            backgroundColor: const Color(0xFFf1f5fb),
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.rate_review_outlined),
                  selectedIcon: Icon(Icons.rate_review),
                  label: 'Rate'),
              NavigationDestination(
                  icon: Icon(Icons.find_in_page_outlined),
                  selectedIcon: Icon(Icons.find_in_page),
                  label: 'Check'),
              NavigationDestination(
                  icon: Icon(Icons.account_box_outlined),
                  selectedIcon: Icon(Icons.account_box),
                  label: 'Profile'),
            ]),
      ),
    );
  }
}