import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:kycbscore/presentation/blocs/find_customer/find_customer_cubit.dart';
import 'package:kycbscore/presentation/blocs/create_customer/create_customer_cubit.dart';
import 'package:kycbscore/presentation/blocs/rate_customer/rate_customer_cubit.dart';

class RateScreens extends StatefulWidget {
  const RateScreens({ Key? key }) : super(key: key);

  @override
  _RateScreensState createState() => _RateScreensState();
}

class _RateScreensState extends State<RateScreens> {

  int currentStep = 0;
  bool isCompleted = false;
  bool newCustomer = false;
  final formKey = GlobalKey<FormState>();
  final customerFormKey = GlobalKey<FormState>();

  double _ntBehaviourWithStaff = 4;
  double _ntCleanliness = 4;
  double _ntPayment = 4;
  double _ntPoolBehaviour = 4;
  double _ntTimelyCheckout = 4;  

  final TextEditingController fName = TextEditingController();
  final TextEditingController lName = TextEditingController();
  final TextEditingController cCity = TextEditingController();
  final TextEditingController cCountry = TextEditingController();
  final TextEditingController emailID = TextEditingController();

  late RateCustomerCubit rateCustomerCubit;
  late FindCustomerCubit findCustomerCubit;
  late CreateCustomerCubit createCustomerCubit;

  @override
  void initState() {
    super.initState();
    rateCustomerCubit = BlocProvider.of<RateCustomerCubit>(context);
    findCustomerCubit = BlocProvider.of<FindCustomerCubit>(context);
    createCustomerCubit = BlocProvider.of<CreateCustomerCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    
    return isCompleted ?
           stepsCompleted()
      : Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.purple),
          ),
          child: Stepper(
            margin: EdgeInsets.only(right: 10.w),
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepCancel: ()
            {
              currentStep > 0 ?
              setState(() => currentStep -= 1) : null;
            },
            onStepContinue: ()
            {
              if(currentStep == 0){
                final isValid = formKey.currentState!.validate();                
                Map<String, dynamic> query = {"email": emailID.text};
                findCustomerCubit.getCustomerData(query);
                if (isValid) {
                  formKey.currentState?.save();
                }
              } else if(currentStep == 1){
                if(newCustomer){
                  Map<String, dynamic> query = {
                  "cEmail": emailID.text.toString(),
                  "cFirstName" : fName.text.toString(),
                  "cLastName": lName.text.toString(),
                  "cCity": cCity.text.toString(),
                  "cCountry": cCountry.text.toString()
                };
                createCustomerCubit.createCustomer(query);
                }                
              } else if(currentStep == 2){
                Map<String, dynamic> query = {
                  "cEmail": emailID.text.toString(),
                  "behaviourWithStaff": _ntBehaviourWithStaff.ceil(),
                  "cleanliness": _ntCleanliness.ceil(),
                  "payment": _ntPayment.ceil(),
                  "poolBehaviour": _ntPoolBehaviour.ceil(),
                  "timelyCheckout": _ntTimelyCheckout.ceil()
                };
                rateCustomerCubit.postCustomerData(query);
                setState(() {
                  isCompleted = true;
                });
              }
              currentStep < 2 ?
              setState(() => currentStep += 1): setState(() => isCompleted = true);
            },
            controlsBuilder: (context, details) {
              final isLastStep = currentStep == getSteps().length - 1;
              return Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(                        
                      child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
                      onPressed: details.onStepContinue,
                    ),
                  ),
                  SizedBox(width: 16.w,),              
                  if(currentStep != 0)
                    
                    Expanded(
                      child: ElevatedButton(
                        child: const Text('BACK'),
                        onPressed: details.onStepCancel,
                      ),
                    ),
                  
                    
                ],
              );
            },
          ) 
        );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Text("Email"),
          ), 
          content: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),
                      TextFormField(
                        controller: emailID,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.search),
                          labelText: ' Customer Email ID',
                          border: const OutlineInputBorder(),
                          focusColor: Colors.purple,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3.w, color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          focusedBorder:  OutlineInputBorder(
                            borderSide: BorderSide(width: 3.w, color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!);
                          if (!emailValid) {
                            return 'Enter Valid Email ID';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h,),
                ],
            ),
          ),
        
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: const Text("Details"),
          ),
          content:  Column(            
            children: [
              BlocBuilder<FindCustomerCubit, FindCustomerState>(
                  builder: (context, state) {
                  if (state is FindCustomerLoaded) {
          
                    Size size = MediaQuery.of(context).size;          
                    return Column(
                      children: [
                        Container(
                          height: 160.h,
                          width: size.width * 0.8,
                          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Column(                          
                            children: [
                              Row(                              
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 32.h, left: 32.w),
                                    child: Text("Name: ", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),),
                                  ),
                                  SizedBox(width: 16.w,),
                                  Padding(
                                    padding: EdgeInsets.only(top: 32.h, left: 8.w),
                                    child: Text(state.customer.cFirstName, style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.h,),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 16.h, left: 24.w),
                                    child: Text("Email ID: ", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),),
                                  ),
                                  SizedBox(width: 16.w,),
                                  Padding(
                                    padding: EdgeInsets.only(top: 16.h, left: 2.w),
                                    child: Text(state.customer.cEmail, style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6.h,),
                            ],
                            
                          ),
                        
                        ),]);
                            
                  } else if(state is FindCustomerError){
                    newCustomer = true;
                    return Column(
                      children: [
                        Form(
                        key: customerFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 24.h,
                            ),
                            TextFormField(
                              controller: fName,
                              decoration: InputDecoration(
                                suffixIcon: const Icon(Icons.person),
                                labelText: ' First Name',
                                border: const OutlineInputBorder(),
                                focusColor: Colors.purple,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 3.w, color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(width: 3.w, color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                              },
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            TextFormField(
                              controller: lName,
                              decoration: InputDecoration(
                                suffixIcon: const Icon(Icons.person),
                                labelText: ' Last Name',
                                border: const OutlineInputBorder(),
                                focusColor: Colors.purple,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 3.w, color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(width: 3.w, color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                              },
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            TextFormField(
                              controller: cCity,
                              decoration: InputDecoration(
                                suffixIcon: const Icon(Icons.location_city),
                                labelText: ' City',
                                border: const OutlineInputBorder(),
                                focusColor: Colors.purple,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 3.w, color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(width: 3.w, color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                              },
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            TextFormField(
                              controller: cCountry,
                              decoration: InputDecoration(
                                suffixIcon: const Icon(Icons.my_location),
                                labelText: ' Country',
                                border: const OutlineInputBorder(),
                                focusColor: Colors.purple,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 3.w, color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(width: 3.w, color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                              },
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                          ],
                        ),
                      ),
                      
                      ],
                    );
          
                  } else if(state is FindCustomerLoading){
                    return SizedBox(
                    height: 20.h,
                    width: 20.h,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ));
                  } else{
                    return const SizedBox.shrink();
                  }
                }),
              SizedBox(height: 24.h,),
              Container(
                height: 120.h,
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 24.h,),
                    Center(child: Text("Rate Behaviour With Staff:", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),)),
                    SizedBox(height: 16.h,),
                    GFRating(
                      value: _ntBehaviourWithStaff,
                      onChanged: (value) {
                        setState(() {
                          _ntBehaviourWithStaff = value;
                        });
                      },
                    ),
            
                  ]
                ),
              ),
              Container(
                height: 120.h,
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 24.h,),
                    Center(child: Text("Rate Cleanliness:", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),)),
                    SizedBox(height: 16.h,),
                    GFRating(
                      value: _ntCleanliness,
                      onChanged: (value) {
                        setState(() {
                          _ntCleanliness = value;
                        });
                      },
                    ),
            
                  ]
                ),
              ),
              Container(
                height: 120.h,
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 24.h,),
                    Center(child: Text("Rate Payment:", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),)),
                    SizedBox(height: 16.h,),
                    GFRating(
                      value: _ntPayment,
                      onChanged: (value) {
                        setState(() {
                          _ntPayment = value;
                        });
                      },
                    ),
            
                  ]
                ),
              ),
              Container(
                height: 120.h,
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 24.h,),
                    Center(child: Text("Rate Pool Behaviour:", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),)),
                    SizedBox(height: 16.h,),
                    GFRating(
                      value: _ntPoolBehaviour,
                      onChanged: (value) {
                        setState(() {
                          _ntPoolBehaviour = value;
                        });
                      },
                    ),
            
                  ]
                ),
              ),
              Container(
                height: 120.h,
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 24.h,),
                    Center(child: Text("Rate Timely Checkout:", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),)),
                    SizedBox(height: 16.h,),
                    GFRating(
                      value: _ntTimelyCheckout,
                      onChanged: (value) {
                        setState(() {
                          _ntTimelyCheckout = value;
                        });
                      },
                    ),
            
                  ]
                ),
              ),
                          
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 2,
          title: Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: const Text("Confirm"),
          ),
          content: Column(
            children: [
              Container(
                height: 120.h,
                margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(children: [
                  SizedBox(height: 24.h,),
                  Center(child: Text("Behaviour With Staff:", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),)),
                  SizedBox(height: 16.h,),
                  Center(child: Text(_ntBehaviourWithStaff.toString() + " / 5.0", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),)),
                ],),
              ),
              Container(
                height: 120.h,
                margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(children: [
                  SizedBox(height: 24.h,),
                  Center(child: Text("Cleanliness:", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),)),
                  SizedBox(height: 16.h,),
                  Center(child: Text(_ntCleanliness.toString() + " / 5.0", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),)),
                ],),
              ),
              Container(
                  height: 120.h,
                  margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(children: [
                    SizedBox(height: 24.h,),
                    Center(child: Text("Payment:", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),)),
                    SizedBox(height: 16.h,),
                    Center(child: Text(_ntPayment.toString() + " / 5.0", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),)),
                  ],),
                ),
              Container(
                  height: 120.h,
                  margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(children: [
                    SizedBox(height: 24.h,),
                    Center(child: Text("Pool Behaviour:", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),)),
                    SizedBox(height: 16.h,),
                    Center(child: Text(_ntPoolBehaviour.toString() + " / 5.0", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),)),
                  ],),
                ),
              
              Container(
                height: 120.h,
                margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(children: [
                  SizedBox(height: 24.h,),
                  Center(child: Text("Timely Checkout:", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),)),
                  SizedBox(height: 16.h,),
                  Center(child: Text(_ntTimelyCheckout.toString() + " / 5.0", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),)),
                ],),
              )
            ],
          ),
        ),
  ];

  Widget stepsCompleted() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.verified_rounded,
            color: Colors.green,
            size: 120.r,
          ),
          SizedBox(height: 16.h,),
          Text("Successfully Submitted!", style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),),
          SizedBox(height: 64.h,),
          // const Text("Click on the Back Button below to Submit Another Rating"),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                textStyle: TextStyle(fontSize: 18.sp),
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                setState(() {
                  isCompleted = false;
                  newCustomer = false;
                  currentStep = 0;
                  _ntBehaviourWithStaff = 4;
                  _ntCleanliness = 4;
                  _ntPayment = 4;
                  _ntPoolBehaviour = 4;
                  _ntTimelyCheckout = 4;  

                  fName.clear();
                  lName.clear();
                  cCity.clear();
                  cCountry.clear();
                  emailID.clear();
                });
              },
              child: const Text("Back"))
        ],
      ),
    );
  }
}