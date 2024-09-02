import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recharge_app/features/recharge/data/model/recharge/recharge_model.dart';
import 'package:intl/intl.dart';

class RechargeHistoryItem extends StatelessWidget {
  final RechargeModel history;

  RechargeHistoryItem({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('yyyy-MM-dd – hh:mm a').format(history.date);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      elevation: 4.r,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding:  EdgeInsets.all(15.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    history.beneficiary.nickname,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    history.beneficiary.phoneNumber,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey[700],
                    ),
                  ),

                  const SizedBox(height: 4.0),
                  Text(
                    'Date: $formattedDate',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'AED ${history.amount}',
              style: TextStyle(
                fontSize: 14.sp,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
