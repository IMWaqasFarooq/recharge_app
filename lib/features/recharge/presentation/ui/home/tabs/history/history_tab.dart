import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:recharge_app/features/recharge/presentation/ui/home/tabs/history/bloc/history_bloc.dart';
import 'package:recharge_app/features/recharge/presentation/ui/home/widgets/recharge_history_item.dart';

import '../../../../../../../core/di/dependency_injection.dart';
import '../../../../../data/model/recharge/recharge_model.dart';

class HistoryTab extends StatefulWidget {
   HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {

  late HistoryBloc _bloc;

  List<RechargeModel> rechargeHistory =[];

  @override
  void initState() {
    // TODO: implement initState
    _bloc = sl<HistoryBloc>();
    _bloc.add(GetRechargeHistoryEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocListener<HistoryBloc, HistoryState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state.isSuccess??false) {
            rechargeHistory = state.rechargeHistory ?? [];

            // navigateAndReplace(context: context, widget: RechargePage());
          } else if (state.error!.isNotEmpty) {
            Fluttertoast.showToast(msg: state.error ?? "error");
          }
        },
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state.isLoading ?? false,
              child: Scaffold(
                backgroundColor: Colors.grey.shade200,
                body: rechargeHistory.isNotEmpty
                    ? ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: rechargeHistory.length,
                    itemBuilder: (context, index) {
                      final history = rechargeHistory[index];
                      return RechargeHistoryItem(history: history);
                    },
                  )

                    : Padding(
                  padding: EdgeInsets.all(15.r),
                  child: Center(
                    child: Text(
                      "No Record found",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.sp),
                    ),
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
