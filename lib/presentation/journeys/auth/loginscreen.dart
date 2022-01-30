import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kycbscore/presentation/blocs/cubit/auth_cubit.dart';
import 'package:kycbscore/presentation/journeys/auth/create_new_account.dart';
import 'package:kycbscore/presentation/journeys/home_screen.dart';
import 'package:kycbscore/presentation/themes/pallete.dart';
import 'package:kycbscore/presentation/widgets/background_image.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late AuthCubit authCubit;
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();

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
        const BackgroundImage(
          image: 'assets/images/login_bg.png',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/logo.svg",
                    height: 320.h,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
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
                                FontAwesomeIcons.envelope,
                                size: 24.r,
                                color: kWhite,
                              ),
                            ),
                            hintText: 'Email',
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
                        var uname = name.text.split("@");
                         Map<String, dynamic> query = {
                            "username": uname[0],
                            "password": password.text
                          };
                          authCubit.loginUser(query);
                      },
                      child: Text(
                        'Login',
                        style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                

                  SizedBox(
                    height: 25.h,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.push( context,
                            MaterialPageRoute(
                                builder: (context) => CreateNewAccount()))
                   
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New Here?',
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push( context,
                          MaterialPageRoute(
                              builder: (context) => CreateNewAccount()));
                    
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Text(
                            'Register',
                            style: TextStyle(fontSize: 16.sp, color: kBlue, fontWeight: FontWeight.bold),
                            
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        )
      ],
    );
  }
}