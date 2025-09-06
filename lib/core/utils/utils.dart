import 'package:flutter/material.dart'; 

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );
  SizedBox get pw => SizedBox(
        width: toDouble(),
      );
}



extension SnackbarExtension on String {
  void showSnackbar({
    required BuildContext context,
    bool isSuccess = true,
    int duration = 2,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(this),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        duration: Duration(seconds: duration),
        behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
// "تم إنشاء الحساب بنجاح".showSnackbar(context: context, isSuccess: true);
// "حدث خطأ أثناء إنشاء الحساب".showSnackbar(context: context, isSuccess: false);
