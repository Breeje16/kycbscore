import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kycbscore/presentation/blocs/auth/auth_cubit.dart';
import 'package:kycbscore/presentation/journeys/auth/create_new_account.dart';
import 'package:kycbscore/presentation/journeys/profile/about_us.dart';
import 'package:kycbscore/presentation/journeys/profile/contact_us.dart';
import 'package:open_mail_app/open_mail_app.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  late AuthCubit authCubit;

  @override
  void initState() {
    super.initState();
    authCubit = BlocProvider.of<AuthCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 12.h),
          //   child: Text(
          //     "Account",
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 22.sp,
          //     ),
          //   ),
          // ),
          SizedBox(height: 30.h,),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: CircleAvatar(
                  radius: 60.r,
                  backgroundImage: const AssetImage(
                    'assets/images/logo.png',
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    child: Text(
                      "WELCOME,",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  Text(
                    "Hotelier",
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  
                ],
              ),
              
            ],
          ),
          SizedBox(height: 60.h,),
          ListTile(
            title: const Text('About KYCB Score'),
            leading: const Icon(Icons.details),
            onTap: () {
              Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutUs()));
            },
          ),
          // SizedBox(height: 8.h,),
          // ListTile(
          //   title: const Text('Hotel Details'),
          //   leading: const Icon(Icons.hotel),
          //   onTap: () async {
          //     String hotelName = await Prefs.getHotelName() ?? "";
          //     String hotelCity = await Prefs.getHotelName() ?? "";
          //     String hotelCountry = await Prefs.getHotelName() ?? "";
          //     Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => HotelDetails(hotelName: hotelName, hotelCity: hotelCity, hotelCountry: hotelCountry)));
          //   },
          // ),
          SizedBox(height: 8.h,),
          ListTile(
            title: const Text('Report a Bug'),
            leading: const Icon(Icons.bug_report),
            onTap: () async {
              EmailContent email = EmailContent(
                  to: [
                    'breejemodi16@gmail.com',
                  ],
                  subject: 'KYCB Score App: Reporting a Bug',
                );

                OpenMailAppResult result =
                    await OpenMailApp.composeNewEmailInMailApp(
                        nativePickerTitle: 'Select email app to compose',
                        emailContent: email);
                if (!result.didOpen && !result.canOpen) {
                  showNoMailAppsDialog(context);
                } else if (!result.didOpen && result.canOpen) {
                  showDialog(
                    context: context,
                    builder: (_) => MailAppPickerDialog(
                      mailApps: result.options,
                      emailContent: email,
                    ),
                  );
                }
            },
          ),
          SizedBox(height: 8.h,),
          ListTile(
            title: const Text('Contact Us'),
            leading: const Icon(Icons.contact_mail),
            onTap: () {
              Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ContactUsScreen()));
            },
          ),
          SizedBox(height: 8.h,),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () {
              showLogoutDialog(context);
            },
          ),
          BlocConsumer<AuthCubit, AuthState>(
              buildWhen: (previous, current) => current is AuthError,
              builder: (context, state) {
                if (state is AuthError) {
                  return const SizedBox.shrink();
                }
                return const SizedBox.shrink();
              },
              listenWhen: (previous, current) => current is AuthLogoutLoaded,
              listener: (context, state) {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => const CreateNewAccount()), (route) => false);
              }),
        ],
      ),
    );
  }

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Open Mail App"),
          content: const Text("No mail apps installed"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Logout", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
          content: const Text("Are you sure you want to Log Out?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                Navigator.pop(context);
                authCubit.logoutUser();
              },
            ),
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}