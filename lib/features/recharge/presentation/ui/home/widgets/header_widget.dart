
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/services/secure_storage.dart';

class HeaderWidget extends StatelessWidget {
  final VoidCallback logoutPressed;

  const HeaderWidget({super.key, required this.logoutPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(
                    SecureStorage().userName,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        SecureStorage().isVerified?"Verified":"Non-Verified",
                        style: TextStyle(
                          // color: CustomAppTheme.of(context).primaryText,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      Icon(
                        SecureStorage().isVerified?Icons.check_circle_outline:Icons.clear,
                        color: SecureStorage().isVerified?Colors.green:Colors.red,
                        size: 15.r,
                      )
                    ],
                  ),

              ],
            ),
          ),

          InkWell(
            onTap: logoutPressed,
            child: Text(
              "Logout",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          )

        ],
      ),
    );
  }
}
