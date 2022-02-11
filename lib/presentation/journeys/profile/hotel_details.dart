import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kycbscore/presentation/journeys/profile/edit_hotel_details.dart';
import 'package:kycbscore/presentation/widgets/hotel_detail/profile_widget.dart';

// ignore: must_be_immutable
class HotelDetails extends StatefulWidget {
  String hotelName;
  String hotelCity;
  String hotelCountry;
  HotelDetails({Key? key, 
    required this.hotelName,
    required this.hotelCity,
    required this.hotelCountry
  }) : super(key: key);

  @override
  State<HotelDetails> createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        title: const Text("Hotel Details"),
        elevation: 1,
      ),
      body: ListView(
        
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            isEdit: false,
            onClicked: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EditHotelDetails()));
            },
          ),
          SizedBox(height: 24.h),
          Text("Hotel Name",
            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 18.sp),
          ),
          Text(widget.hotelName,
            style: TextStyle(fontWeight: FontWeight.w500, color: Theme.of(context).primaryColor, fontSize: 16.sp, decoration: TextDecoration.underline),
          ),
          SizedBox(height: 24.h),
          Text("Hotel City",
            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 18.sp),
          ),
          Text(widget.hotelName,
            style: TextStyle(fontWeight: FontWeight.w500, color: Theme.of(context).primaryColor, fontSize: 16.sp, decoration: TextDecoration.underline),
          ),
          SizedBox(height: 24.h),
          Text("Hotel Country",
            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 18.sp),
          ),
          Text(widget.hotelName,
            style: TextStyle(fontWeight: FontWeight.w500, color: Theme.of(context).primaryColor, fontSize: 16.sp, decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }

  
}