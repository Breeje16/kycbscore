// ignore_for_file: unnecessary_null_comparison

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kycbscore/data/prefs/prefs.dart';
import 'package:kycbscore/presentation/blocs/auth/auth_cubit.dart';
import 'package:kycbscore/presentation/journeys/auth/create_new_account.dart';
import 'package:kycbscore/presentation/journeys/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AuthCubit authCubit;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      authCubit = BlocProvider.of<AuthCubit>(context);
      final email = await Prefs.getEmail();
      final pword = await Prefs.getPassword();
      try {
        if (email == null || pword == null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const CreateNewAccount()),
              (route) => false);
        } else
        // if(uname != null && pword != null)
        {
          //DONE: Login with Credentials and Store Access Token and Refresh Token
          Map<String, dynamic> query = {"email": email, "password": pword};
          authCubit.loginUser(query);
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(builder: (context) => const HomeScreen()),
          //     (route) => false);
        }
        // ignore: unused_catch_clause
      } on Error catch (e) {
        // print(e.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoaded) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false);
        }
      },
      child: Stack(children: [
        SafeArea(
          child: Container(
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 200.h,
            ),
            Center(
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                width: size.height * 0.7,
                height: size.width * 0.7,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            // Text("Know Your Customer Behaviour (KYCB) Score!", style: TextStyle(fontSize: 14.sp, color: Theme.of(context).primaryColor),),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {

                if(state is AuthLoading){
                  return SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
                } else {
                  return SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: const CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
                }
                
              },
            ),
          ],
        )
      ]),
    );
  }
}
