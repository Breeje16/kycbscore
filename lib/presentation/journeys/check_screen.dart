import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kycbscore/presentation/blocs/check_customer/check_customer_cubit.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({ Key? key }) : super(key: key);

  @override
  _CheckScreenState createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {

  TextEditingController searchController = TextEditingController();
  // late List<CustomerRating> _chartData;
  late TooltipBehavior _tooltipBehavior;
  // late Customer customer;
  bool searchDone = false;

  late CheckCustomerCubit checkCustomerCubit;

  @override
  void initState() {
    super.initState();
    checkCustomerCubit = BlocProvider.of<CheckCustomerCubit>(context);
    // _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: const Icon(
                      Icons.search,
                      color: Colors.purple,
                    ),
                    margin: const EdgeInsets.fromLTRB(3, 0, 7, 0),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    textInputAction: TextInputAction.search,
                    keyboardType: TextInputType.emailAddress,
                    onSubmitted: (value) {
                      Map<String, dynamic> query = {"email": value};
                      checkCustomerCubit.getCustomerData(query);
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Customer using Email",
                        hintStyle: TextStyle(fontSize: 12.sp)),
                  ),
                )
              ],
            )),
            BlocBuilder<CheckCustomerCubit, CheckCustomerState>(
            builder: (context, state) {
              if(state is CheckCustomerLoading){
                return SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ));
              } else
              if (state is CheckCustomerLoaded) {
                final List<CustomerRating> _chartData = [
                  CustomerRating("Behaviour With Staff", double.parse(state.customer.netBehaviourWithStaff)),
                  CustomerRating("Cleanliness", double.parse(state.customer.netCleanliness)),
                  CustomerRating("Payment", double.parse(state.customer.netPayment)),
                  CustomerRating("Pool Behaviour", double.parse(state.customer.netPoolBehaviour)),
                  CustomerRating("Timely Checkout", double.parse(state.customer.netTimelyCheckout)),
                ];
                return Column(
                  children: [
                    Text(
                      "Results of " + state.customer.cEmail.toString(),
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SfCircularChart(
                        title: ChartTitle(
                          text: "Customer Ratings Chart",
                          textStyle: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                          ),
                        ),
                        legend: Legend(
                            isVisible: true,
                            overflowMode: LegendItemOverflowMode.wrap,
                            backgroundColor: Colors.white),
                        tooltipBehavior: _tooltipBehavior,
                        series: <CircularSeries>[
                          RadialBarSeries<CustomerRating, String>(
                              dataSource: _chartData,
                              xValueMapper: (CustomerRating data, _) =>
                                  data.name,
                              yValueMapper: (CustomerRating data, _) =>
                                  data.value,
                              dataLabelSettings:
                                  const DataLabelSettings(isVisible: true),
                              maximumValue: 5,                              
                              enableTooltip: true)
                        ]),
                    
                    Text(
                      "Net Score: " + state.customer.netScore.toString(),
                      style: TextStyle( fontSize: 16.sp,
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
            
              } else if(state is CheckCustomerError){
                return Text(state.messege.toString());
              }
              return const SizedBox.shrink();
            }

            // searchDone ? const SizedBox(height: 8.0,) : 
            // Column(
            //       children: [
            //         Text(
            //           "Results of " + customer.cEmail.toString(),
            //           style: const TextStyle(
            //               color: Colors.black, fontWeight: FontWeight.bold),
            //         ),
            //         // SfCircularChart(
            //         //     title: ChartTitle(
            //         //       text: "Customer Ratings Chart",
            //         //       textStyle: TextStyle(
            //         //         color: Colors.white70,
            //         //         fontWeight: FontWeight.w700,
            //         //         fontSize: 16.sp,
            //         //       ),
            //         //     ),
            //         //     legend: Legend(
            //         //         isVisible: true,
            //         //         overflowMode: LegendItemOverflowMode.wrap,
            //         //         backgroundColor: Colors.white),
            //         //     tooltipBehavior: _tooltipBehavior,
            //         //     series: <CircularSeries>[
            //         //       RadialBarSeries<CustomerRating, String>(
            //         //           dataSource: _chartData,
            //         //           xValueMapper: (CustomerRating data, _) =>
            //         //               data.name,
            //         //           yValueMapper: (CustomerRating data, _) =>
            //         //               data.value,
            //         //           dataLabelSettings:
            //         //               const DataLabelSettings(isVisible: true),
            //         //           enableTooltip: true)
            //         //     ]),
                    
            //         Text(
            //           "Net Score: " + customer.netScore.toString(),
            //           style: const TextStyle(
            //               color: Colors.black, fontWeight: FontWeight.bold),
            //         ),
            //       ],
            //     ),
              
            )],
    );
  }

  
}

class CustomerRating {
  final String name;
  final double value;
  CustomerRating(this.name, this.value);
}