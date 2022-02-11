import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About KYCB Score"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 16.h,),
            Text("Why KYCB Score?", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.sp, fontWeight: FontWeight.bold),),
            SizedBox(height: 24.h,),
            const Text("KYCB (Know Your Customer Behaviour) Score is an Attempt Made to Solve Problems that Hotelier Faces and at the Same time, incentivize the Customer for their Good Behaviour during their Stay at the Hotels.")
          ],
        ),
      ),
    );
  }
}