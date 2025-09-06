import 'package:flutter/material.dart';
import 'package:frut_hub_dashboard/core/utils/app_colors.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.white,fontSize:16),
        ),
      ),
    );
  }
}
