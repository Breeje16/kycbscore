import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kycbscore/presentation/blocs/cubit/auth_cubit.dart';
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