import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:recharge_app/core/services/secure_storage.dart';
import 'package:recharge_app/features/login/presentation/ui/login_page.dart';
import 'package:recharge_app/features/recharge/presentation/ui/tabs/history/history_tab.dart';
import 'package:recharge_app/features/recharge/presentation/ui/tabs/recharge/recharge_tab.dart';
import 'package:recharge_app/features/recharge/presentation/ui/widgets/header_widget.dart';

import '../../../../core/functions/navigations.dart';

class RechargePage extends StatefulWidget {
  const RechargePage({super.key});

  @override
  _RechargePageState createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      body: SafeArea(
        child: Container(
          // padding: EdgeInsets.all(15.r),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                child: HeaderWidget(
                  logoutPressed: () async {
                    await SecureStorage().clearSession();
                    navigateAndReplace(context: context, widget: LoginPage());
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.r),
                  ),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.r),
                  ),
                  child: TabBar(
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.all(2.r),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.r),
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(
                        child: Text(
                          'Recharge',
                          style: TextStyle(fontSize: 13.sp),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'History',
                          style: TextStyle(fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10.h,
                  ),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      RechargeTab(),
                      HistoryTab(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
