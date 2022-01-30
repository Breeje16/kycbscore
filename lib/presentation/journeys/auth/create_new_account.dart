import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kycbscore/presentation/blocs/cubit/auth_cubit.dart';
import 'package:kycbscore/presentation/journeys/auth/loginscreen.dart';
import 'package:kycbscore/presentation/journeys/home_screen.dart';
import 'package:kycbscore/presentation/themes/pallete.dart';
import 'package:kycbscore/presentation/widgets/background_image.dart';
import 'package:kycbscore/presentation/widgets/password_input.dart';
import 'package:kycbscore/presentation/widgets/rounded_button.dart';
import 'package:kycbscore/presentation/widgets/text_field_input.dart';

class CreateNewAccount extends StatefulWidget {
  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {

  late AuthCubit authCubit;
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController password2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    authCubit = BlocProvider.of<AuthCubit>(context);
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const BackgroundImage(image: 'assets/images/login_bg.png'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        "assets/images/logo.svg",
                        height: 220.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Column(
                  children: [
                    
                    Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Container(
                      height: size.height * 0.07,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Center(
                        child: TextField(
                          controller: name,
                          style: TextStyle(fontSize: 11.sp, color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Icon(
                                FontAwesomeIcons.user,
                                size: 24.r,
                                color: kWhite,
                              ),
                            ),
                            hintText: 'Your Name',
                            hintStyle: TextStyle(fontSize: 11.sp, color: Colors.white),                            
                          ),
                          maxLines: 1,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Container(
                      height: size.height * 0.07,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Center(
                        child: TextField(
                          controller: email,
                          style: TextStyle(fontSize: 11.sp, color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Icon(
                                FontAwesomeIcons.envelope,
                                size: 24.r,
                                color: kWhite,
                              ),
                            ),
                            hintText: 'Email ID',
                            hintStyle: TextStyle(fontSize: 11.sp, color: Colors.white),                            
                          ),
                          maxLines: 1,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                  ),
                    
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Container(
                      height: size.height * 0.07,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500]?.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Center(
                        child: TextField(
                          controller: password,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Icon(
                                FontAwesomeIcons.lock,
                                size: 24.r,
                                color: kWhite,
                              ),
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(fontSize: 11.sp, color: Colors.white),
                          ),
                          obscureText: true,
                          style: TextStyle(fontSize: 11.sp, color: Colors.white),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Container(
                      height: size.height * 0.07,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500]?.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Center(
                        child: TextField(
                          controller: password2,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Icon(
                                FontAwesomeIcons.lock,
                                size: 24.r,
                                color: kWhite,
                              ),
                            ),
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(fontSize: 11.sp, color: Colors.white),
                          ),
                          obscureText: true,
                          style: TextStyle(fontSize: 11.sp, color: Colors.white),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ),
                  ),
                  
                    
                    SizedBox(
                      height: 15.h,
                    ),
                    
                   BlocConsumer<AuthCubit, AuthState>(
                      buildWhen: (previous, current) =>
                          current is AuthError,
                      builder: (context, state) {
                        if (state is AuthError) {
                          return const Text("Some Error");
                        }
                        return const SizedBox.shrink();
                      },
                      listenWhen: (previous, current) =>
                          current is AuthLoaded,
                      listener: (context, state) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      }),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: size.height * 0.08,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kBlue,
                      ),
                      child: TextButton(
                        onPressed: () {
                          var uname = email.text.split("@");
                          Map<String, dynamic> query = {
                            "username": uname[0].toString(),
                            "first_name": name.text,
                            "email": email.text,
                            "password": password.text,
                            "password2": password2.text
                          };
                          authCubit.authenticateUser(query);
                        },
                        child: Text(
                          'Register',
                          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(fontSize: 14.sp, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push( context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 16.sp, color: kBlue, fontWeight: FontWeight.bold),
                              
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}