import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kycbscore/presentation/blocs/auth/auth_cubit.dart';
import 'package:kycbscore/presentation/blocs/check_customer/check_customer_cubit.dart';
import 'package:kycbscore/presentation/blocs/create_customer/create_customer_cubit.dart';
import 'package:kycbscore/presentation/blocs/find_customer/find_customer_cubit.dart';
import 'package:kycbscore/presentation/blocs/rate_customer/rate_customer_cubit.dart';
import 'package:kycbscore/presentation/journeys/splash_screen.dart';
import 'package:kycbscore/presentation/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MediaQuery(
      data: const MediaQueryData(
        size: Size(375, 812),
      ),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                AuthCubit()),
        BlocProvider(
            create: (context) =>
                CheckCustomerCubit()),

        BlocProvider(
            create: (context) =>
                RateCustomerCubit()),

        BlocProvider(
            create: (context) =>
                CreateCustomerCubit()),

        BlocProvider(
            create: (context) =>
                FindCustomerCubit()),
      ],
      child: MaterialApp(
          debugShowMaterialGrid: false,
          title: 'KYCB Score',
          theme: AppTheme.get(),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          builder: (context, widget) {
              //add this line
              ScreenUtil.setContext(context);
              return MediaQuery(
                //Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1.5,
                ),
                child: widget!,
              );
            },
        ),
      ),
    ),);
  }
}