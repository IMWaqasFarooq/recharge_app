import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entity/beneficiary.dart';

Future<Beneficiary?> showAddBeneficiaryDialog(BuildContext context) async {
  final _formKey = GlobalKey<FormState>();
  String nickname = '';
  String phoneNumber = '+971';

  return showDialog<Beneficiary>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text(
              'Add Beneficiary',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Nickname Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nickname',
                  hintText: 'Enter nickname',
                  labelStyle: TextStyle(
                    fontSize: 13.sp,
                  ),
                  hintStyle: TextStyle(
                      fontSize: 13.sp
                  )
                ),
                maxLength: 20,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a nickname';
                  }
                  return null;
                },
                onSaved: (value) {
                  nickname = value!;
                },
              ),
              SizedBox(height: 10.h),
              // Phone Number Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixText: '+971 ',
                  hintText: '5xxxxxxxxx',
                    labelStyle: TextStyle(
                      fontSize: 13.sp,
                    ),
                    hintStyle: TextStyle(
                        fontSize: 13.sp
                    ),
                  prefixStyle:TextStyle(
                      fontSize: 13.sp
                  ) ,

                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Restrict to digits only
                ],
                maxLength: 10, // The max length for the mobile number without the prefix
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 10) {
                    return 'Please enter a valid mobile number';
                  }
                  return null;
                },
                onSaved: (value) {
                  phoneNumber += value!;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(null);
            },
            child: Text(
                'Cancel',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Beneficiary newBeneficiary = Beneficiary(
                  nickname: nickname,
                  phoneNumber: phoneNumber,
                );
                Navigator.of(context).pop(newBeneficiary);
              }
            },
            child: Text(
              'Add',
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      );
    },
  );
}