
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:recharge_app/features/recharge/presentation/ui/home/home_page.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigations.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../bloc/login_bloc.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late LoginBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = LoginBloc(loginUseCase: sl<LoginUseCase>());

  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state.isSuccess ?? false) {
            navigateAndReplace(context: context, widget: HomePage());
          } else if (state.error!.isNotEmpty) {
            Fluttertoast.showToast(msg: state.error ?? "error");
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state.isLoading ?? false,
              child: Scaffold(
                // backgroundColor:
                // CustomAppTheme.of(context).primaryBackground,
                body: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.r),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ButtonWidget(
                                  text: "Continue as Verified user",
                                  onPressed: () {

                                        _bloc.add(LoginUserEvent(
                                           isVerified: true,
                                        ));


                                  },
                                ),
                                SizedBox(height: 20.h,),
                                ButtonWidget(
                                  text: "Continue as normal user",
                                  onPressed: () {

                                    _bloc.add(LoginUserEvent(
                                      isVerified: false,
                                    ));


                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}







