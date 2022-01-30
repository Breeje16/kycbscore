import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kycbscore/presentation/journeys/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late String name;
  late String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    final _formKeyLogin = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_top.png",
                width: size.width * 0.35,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [                  
                  SizedBox(height: size.height * 0.10),
                  SvgPicture.asset(
                    "assets/images/logo.svg",
                    height: size.height * 0.35,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        name = value;
                      },
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Theme.of(context).primaryColor,
                        ),
                        labelText: "Your Username",
                        labelStyle: TextStyle(color: Theme.of(context).primaryColor, overflow: TextOverflow.ellipsis),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: TextFormField(
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Theme.of(context).primaryColor,
                        ),
                        border: InputBorder.none,
                        labelText: "Password",
                        labelStyle: TextStyle(color: Theme.of(context).primaryColor, overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: ElevatedButton(
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          // Map<String, dynamic> query = {
                          //   "username": name + '@gmail.com',
                          //   "password": password
                          // };
                          // authCubit.loginUser(query);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.w, vertical: 20.h),
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't have an Account ? ",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}