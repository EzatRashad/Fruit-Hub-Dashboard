import 'package:flutter/material.dart';
import 'package:frut_hub_dashboard/core/utils/app_colors.dart'; 

class BackWidget extends StatelessWidget {
  const BackWidget({super.key, this.onBack, this.color, this.icon, this.size});
  final VoidCallback? onBack;
  final Color? color;
  final IconData? icon;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (onBack != null) {
          onBack?.call();
        } else {
          Navigator.pop(context);
        }
      },
      icon: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.gray50),
        ),
        child: Icon(
          icon ?? Icons.arrow_back_ios_new,
          color: color ?? AppColors.black,
          size: size,
        ),
      ),
    );
  }
}
