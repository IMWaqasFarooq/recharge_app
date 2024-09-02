import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:recharge_app/core/di/dependency_injection.dart';
import 'package:recharge_app/core/functions/navigations.dart';
import 'package:recharge_app/core/widgets/button_widget.dart';
import 'package:recharge_app/features/recharge/presentation/ui/top_up/top_up_page.dart';

import '../../../../../data/model/benificiary/beneficiary_model.dart';
import '../../widgets/add_beneficairy_dialog.dart';
import 'bloc/recharge_bloc.dart';

class RechargeTab extends StatefulWidget {
  const RechargeTab({super.key});

  @override
  State<RechargeTab> createState() => _RechargeTabState();
}

class _RechargeTabState extends State<RechargeTab> {
  late RechargeBloc _bloc;
  List<BeneficiaryModel> beneficiariesList = [];

  @override
  void initState() {
    // TODO: implement initState
    _bloc = sl<RechargeBloc>();
    _bloc.add(GetBeneficiariesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocListener<RechargeBloc, RechargeState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state.beneficiarySuccess!.isNotEmpty) {
            Fluttertoast.showToast(msg: state.beneficiarySuccess ?? "success");
            beneficiariesList = state.beneficiariesList ?? [];

            // navigateAndReplace(context: context, widget: RechargePage());
          } else if (state.beneficiaryError!.isNotEmpty) {
            Fluttertoast.showToast(msg: state.beneficiaryError ?? "error");
          }

          if (state.beneficiariesList!.isNotEmpty) {
            beneficiariesList = state.beneficiariesList ?? [];
          }
        },
        child: BlocBuilder<RechargeBloc, RechargeState>(
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state.isLoading ?? false,
              child: Scaffold(
                backgroundColor: Colors.grey.shade200,
                body: beneficiariesList.isNotEmpty
                    ? SizedBox(
                  height: MediaQuery.of(context).size.height*0.25,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemCount: beneficiariesList.length,
                          itemBuilder: (context, index) {
                            final beneficiary = beneficiariesList[index];
                            return Container(
                              margin: EdgeInsets.all(5.r),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 15.h),
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      beneficiary.nickname,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      beneficiary.phoneNumber,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    ButtonWidget(
                                      text: "Recharge",
                                      onPressed: () {
                                        navigateAndPush(context: context, widget: TopUpPage(beneficiary: beneficiary,));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                    )
                    : Padding(
                        padding: EdgeInsets.all(15.r),
                        child: Center(
                          child: Text(
                            "No beneficiary added, please click + button below to add beneficiary",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                      ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                    BeneficiaryModel? newBeneficiary =
                        await showAddBeneficiaryDialog(context);
                    if (newBeneficiary != null) {
                      _bloc.add(
                          AddBeneficiaryEvent(beneficiary: newBeneficiary));
                    }
                  },
                  child: Icon(
                    Icons.add,
                    size: 22.sp,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
