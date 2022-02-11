import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kycbscore/data/prefs/prefs.dart';
import 'package:kycbscore/presentation/journeys/profile/hotel_details.dart';
import 'package:kycbscore/presentation/widgets/hotel_detail/profile_widget.dart';

class EditHotelDetails extends StatefulWidget {
  const EditHotelDetails({ Key? key }) : super(key: key);

  @override
  _EditHotelDetailsState createState() => _EditHotelDetailsState();
}

class _EditHotelDetailsState extends State<EditHotelDetails> {

  final TextEditingController hName = TextEditingController();
  final TextEditingController hCity = TextEditingController();
  final TextEditingController hCountry = TextEditingController();

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
            isEdit: true,
            onClicked: () async {
              await Prefs.setHotelName(hName.text.toString());
              await Prefs.setHotelCity(hCity.text.toString());
              await Prefs.setHotelCountry(hCountry.text.toString());
              Navigator.push(context, MaterialPageRoute(builder: (context) => HotelDetails(hotelCity: hCity.text.toString(), hotelCountry: hCountry.text.toString(), hotelName: hName.text.toString(),)));
            },
          ),
          SizedBox(height: 24.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hotel Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: hName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                maxLines: 1,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hotel City",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: hCity,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                maxLines: 1,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hotel Country",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: hCountry,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                maxLines: 1,
              ),
            ],
          ),
        ],
      ),
    );
  
  }
}