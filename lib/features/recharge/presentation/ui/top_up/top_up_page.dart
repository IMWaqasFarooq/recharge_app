import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:recharge_app/core/services/secure_storage.dart';
import 'package:recharge_app/core/widgets/button_widget.dart';
import 'package:recharge_app/core/widgets/custom_dialog_widget.dart';
import 'package:recharge_app/features/recharge/data/model/benificiary/beneficiary_model.dart';
import 'package:recharge_app/features/recharge/presentation/ui/top_up/bloc/top_up_bloc.dart';

import '../../../../../core/di/dependency_injection.dart';

class TopUpPage extends StatefulWidget {
  final BeneficiaryModel beneficiary;

  const TopUpPage({super.key, required this.beneficiary});

  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  final int serviceCharge = 1;
  int selectedAmount = 5;
  final List<int> topUpOptions = [5, 10, 20, 30, 50, 75, 100];

  late BeneficiaryModel beneficiary;

  late TopUpBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    beneficiary = widget.beneficiary;
    _bloc = sl<TopUpBloc>();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => _bloc,
      child: BlocListener<TopUpBloc, TopUpState>(
        listener: (context, state) {
          // TODO: implement listener

          if(state.isSuccess){
            Fluttertoast.showToast(msg: "Top up Successfully");
            Navigator.pop(context);
          }else if(state.error!.isNotEmpty){
            showCustomDialog(
                context: context,
                title: "Error",
                message: state.error??"error",
                onPositivePressed: (){
                  Navigator.pop(context);
                });
          }

        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Top Up',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),
          ),
          body: BlocBuilder<TopUpBloc, TopUpState>(
            builder: (context, state) {
              int totalAmount = (state.selectedAmount??5) + serviceCharge;

              return ModalProgressHUD(
                inAsyncCall: state.isLoading??false,
                child: Padding(
                  padding: EdgeInsets.all(15.r),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Balance Display
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Balance: ${SecureStorage().balance}',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Theme
                                    .of(context)
                                    .primaryColor
                            ),

                          ),
                        ),
                        SizedBox(height: 20),

                        Text(
                          'Beneficiary Details',
                          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.h),
                        Text('Name: ${beneficiary.nickname}'), // Replace with dynamic data
                        Text('Number: ${beneficiary.phoneNumber}'), // Replace with dynamic data
                        SizedBox(height: 20.h),

                        // Top Up Label
                        Text(
                          'Top Up',
                          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.h),

                        // Top Up Options
                        Wrap(
                          spacing: 8.w,
                          runSpacing: 4.h,
                          children: topUpOptions.map((amount) {
                            return ChoiceChip(
                              label: Text(
                                '$amount AED',
                                style: TextStyle(
                                    fontSize: 13.sp
                                ),
                              ),
                              selected: state.selectedAmount == amount,
                              onSelected: (bool selected) {
                                _bloc.add(SelectAmountEvent(amount: amount));
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 20.h),

                        // Details Section
                        Text(
                          'Details',
                          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Top Up Amount',
                              style: TextStyle(
                                  fontSize: 13.sp
                              ),
                            ),
                            Text(
                              '${state.selectedAmount??0} AED',
                              style: TextStyle(
                                  fontSize: 13.sp
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Service Charge',
                              style: TextStyle(
                                  fontSize: 13.sp
                              ),
                            ),
                            Text(
                              '$serviceCharge AED',
                              style: TextStyle(
                                  fontSize: 13.sp
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp
                              ),
                            ),
                            Text(
                              '$totalAmount AED',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp

                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),

                        // Recharge Button
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: ButtonWidget(
                              onPressed: () {
                                _bloc.add(TopUpBeneficiaryEvent(
                                    amount: state.selectedAmount??(totalAmount-1),
                                    beneficiary: beneficiary
                                ));
                              },
                              text: 'Recharge',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}