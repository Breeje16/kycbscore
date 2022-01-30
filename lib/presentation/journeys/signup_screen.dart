import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kycbscore/presentation/journeys/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({ Key? key }) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  late String name;
  late String email;
  late String password;
  late String password2;

  @override
  void initState() {
    super.initState();

    // final TextEditingController _name = TextEditingController();
    // final TextEditingController _email = TextEditingController();
    // final TextEditingController _password = TextEditingController();
    // final TextEditingController _password2 = TextEditingController();

  }

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _password2 = TextEditingController();

  bool _validateName = false;
  bool _validateEmail = false;
  bool _validatePassword = false;
  bool _validatePassword2 = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _password2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/signup_top.png",
                width: size.width * 0.35,
              ),
            ),
            
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/images/logo.svg",
                    height: size.height * 0.25,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8.h),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            
                            controller: _name,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: Theme.of(context).primaryColor,
                              ),
                              
                              // errorText: _validateName ? 'Username Can\'t Be Empty' : null,
                              labelText: "Your Name",
                              labelStyle: TextStyle(color: Theme.of(context).primaryColor, overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color:  Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              email = value;
                            },                         
                            validator: (email) {
                              if (email != null && EmailValidator.validate(email)) {
                                return null;
                              }
                              return "Invalid email address";
                            },
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Theme.of(context).primaryColor,
                              ),
                              // errorText: _validateEmail ? 'Enter a Valid Email ID' : null,
                              border: InputBorder.none,
                              
                              // hintText: 'Enter Email Address',
                  
                              labelText: "Your Email ID",
                              labelStyle: TextStyle(color: Theme.of(context).primaryColor, overflow: TextOverflow.ellipsis),
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
                            controller: _password,
                            onChanged: (value) {
                              password = value;
                            },
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                color: Theme.of(context).primaryColor,
                              ),
                              errorText: _validatePassword ? 'Password Can\'t Be Empty' : null,
                              border: InputBorder.none,
                              labelText: "Password",
                              labelStyle: TextStyle(color: Theme.of(context).primaryColor, overflow: TextOverflow.ellipsis),
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
                            controller: _password2,
                            onChanged: (value) {
                              password2 = value;
                            },
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              icon: Icon(
                                Icons.lock,
                                color: Theme.of(context).primaryColor,
                              ),
                              errorText: _validatePassword2 ? 'Confirm Password not Matching!' : null,
                              border: InputBorder.none,
                              labelStyle: TextStyle(color: Theme.of(context).primaryColor, overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            child: ElevatedButton(
                              child: const Text(
                                "SIGN UP",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                
                                // setState(() {
                                //   _name.text.isEmpty ? _validateName = true : _validateName = false;
                                //   _validateEmail = EmailValidator.validate(_email.text);
                                //   _password.text.isEmpty ? _validatePassword = true : _validatePassword = false;
                                //   _password.text == _password2.text ? _validatePassword2 = true : _validatePassword2 = false;
                                // });
                    
                                // Map<String, dynamic> query = {
                                //   "username": username,
                                //   "email": email,
                                //   "password": password,
                                //   "password2": password2
                                // };
                                // authCubit.authenticateUser(query);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40.w, vertical: 20.h),
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                    
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an Account ? ",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "Sign In",
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