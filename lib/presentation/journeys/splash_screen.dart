import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kycbscore/data/prefs/prefs.dart';
import 'package:kycbscore/presentation/blocs/cubit/auth_cubit.dart';
import 'package:kycbscore/presentation/journeys/auth/create_new_account.dart';
import 'package:kycbscore/presentation/journeys/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

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
      final token = await Prefs.getToken();
      final refresh = await Prefs.getRefreshToken();
      final uname = await Prefs.getUserName();
      final pword = await Prefs.getPassword();
      if(uname == null || pword == null){
        Navigator.push( context,
                            MaterialPageRoute(
                                builder: (context) => CreateNewAccount()));
      }
      if(uname != null && pword != null){
        //DONE: Login with Credentials and Store Access Token and Refresh Token
        Map<String, dynamic> query = {
                            "username": uname,
                            "password": pword
                          };
        authCubit.loginUser(query);
        Navigator.push( context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
      }
      
    });
  }
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SafeArea(child: Container(color: Theme.of(context).primaryColorLight,),),
        Center(
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            width: size.height * 0.6,
            height: size.width * 0.6,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
        SizedBox(
          height: 20.h,
          child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
        ),
      ]
    );
  }
}