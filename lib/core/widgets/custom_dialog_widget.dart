import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void showCustomDialog(
     {required BuildContext context,
      required String title,
      required String message,
      required VoidCallback onPositivePressed,
       String? positiveBtnText,
       String? negativeBtnText,
      VoidCallback? onNegativePressed,
      bool isCancelable = false,
    }) {
    showDialog(
      context: context,
      barrierDismissible: isCancelable,
      builder: (alertContext) {
          return PopScope(
            canPop: isCancelable,
            child: Theme.of(context).platform == TargetPlatform.iOS?CupertinoAlertDialog(
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: onPositivePressed,
                  child: Text(
                      positiveBtnText??"OK",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor
                    ),
                  ),
                ),
                if (onNegativePressed != null)
                  CupertinoDialogAction(
                    onPressed: onNegativePressed,
                    child: Text(
                        negativeBtnText??'Cancel',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor
                      ),
                    ),
                  ),
              ],
            ): AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                if (onNegativePressed != null)
                  TextButton(
                    onPressed: onNegativePressed ,
                    child: Text(
                        'Cancel',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor
                      ),
                    ),
                  ),
                TextButton(
                  onPressed: onPositivePressed,
                  child: Text(
                      'OK',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor
                    ),
                  ),
                ),
              ],
            ),
          );

      },
    );
}

Future<bool?> backAlert(
    {required BuildContext context,
      required String title,
      required String message,
    }) async {
  return await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (alertContext) {
      return PopScope(
        canPop: false,
        child: Theme.of(context).platform == TargetPlatform.iOS?
        CupertinoAlertDialog(
          title: Text(
              title,
          ),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: (){
                Navigator.of(context).pop(true);
              },
              child: Text(
                "Yes",
                style: TextStyle(
                    color: Theme.of(context).primaryColor
                ),
              ),
            ),
              CupertinoDialogAction(
                onPressed: (){
                  Navigator.of(context).pop(false);

                },
                child: Text(
                  'No',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor
                  ),
                ),
              ),
          ],
        ): AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop(false);
                  } ,
                child: Text(
                  'No',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor
                  ),
                ),
              ),
            TextButton(
              onPressed: (){
                Navigator.of(context).pop(true);
              },
              child: Text(
                'Yes',
                style: TextStyle(
                    color: Theme.of(context).primaryColor
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}