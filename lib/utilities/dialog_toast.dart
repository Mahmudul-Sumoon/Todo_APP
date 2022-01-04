import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension Toast on String {
  Future<void> showAsDialog(BuildContext context,
      {required Duration duration}) {
    builder:
    (context) {
      Future.delayed(duration, () {
        Navigator.of(context).pop(true);
      });
    };
    return showDialog(
        context: context,
        builder: (context) {
          Future.delayed(duration, () {
            Navigator.of(context).pop(true);
          });
          return Padding(
            padding: const EdgeInsets.fromLTRB(
              50,
              100,
              50,
              0.0,
            ),
            child: AlertDialog(
              backgroundColor: const Color(0xff24283b),
              //behavior: SnackBarBehavior.floating,
              elevation: 2.0,

              actionsOverflowDirection:
                  VerticalDirection.up, //SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              //  title: Text('First Enter a Task'),
              title: Center(child: Text(this)),
            ),
          );
        });
  }
}

       // showGeneralDialog(
        //   barrierLabel: "djhfdsfhkd",
        //   barrierDismissible: true,
        //   barrierColor: Colors.black.withOpacity(0.5),
        //   transitionDuration: Duration(microseconds: 200),
        //   context: context,
        //   pageBuilder: (context, anim1, anim2) {
        //     return Align(
        //       alignment: Alignment.bottomCenter,
        //       child: Container(
        //         height: 300,
        //         child: SizedBox.expand(child: FlutterLogo()),
        //         margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(40),
        //         ),
        //       ),
        //     );
        //   },
        //   transitionBuilder: (context, anim1, anim2, child) {
        //     return SlideTransition(
        //       position:
        //           Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
        //       child: child,
        //     );
        //   },
        //   //Text(this),
        // );
