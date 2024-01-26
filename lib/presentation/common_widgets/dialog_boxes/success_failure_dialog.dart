import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ostello_task/core/constants/image_constants.dart';

class CustomDialog {
  static void showSuccessDialog(BuildContext context, Function() onDonePressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(ImageConstant.success_icon, height: 74, width: 70),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  textAlign: TextAlign.center,
                  'Demo successfully booked!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                ),
                const SizedBox(height: 16.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Thank you for booking free demo class with Aakash Institute. Please check your email for all the required details of the session.',
                    textAlign: TextAlign.center,
                  ),
                ),
                const Divider(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onDonePressed();
                  },
                  child: const Text('Done',style: TextStyle(fontSize: 15)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showFailureDialog(BuildContext context, String message, Function() onTryAgainPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(ImageConstant.failure_icon, height: 74, width: 70),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  textAlign: TextAlign.center,
                  'Demo Booking Failed!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                const SizedBox(height: 16.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Apologies for the inconvenience caused! Requesting you to please try booking your free demo again with Aakash Institute.',
                    textAlign: TextAlign.center,
                  ),
                ),
                const Divider(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onTryAgainPressed();
                  },
                  child: const Text('Try Again', style: TextStyle(fontSize: 15),),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
