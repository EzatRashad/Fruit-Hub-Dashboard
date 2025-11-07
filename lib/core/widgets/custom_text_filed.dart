import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled(
      {super.key,
      this.controller,
      this.maxLines = 1,
      this.obscureText = false,
      required this.hintText,
      this.suffixIcon,
      this.onSaved,
      //this.validator,
      bool obcureText = false});
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
 // final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      style: TextStyle(fontSize: 16),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      onSaved: onSaved,
      cursorColor: AppColors.primaryColor,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF9FAFA),
        suffixIcon: suffixIcon,
        hintText: hintText,
        isDense: true,
        hintStyle: Theme.of(context).textTheme.titleSmall,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.gray100,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
        errorMaxLines: 3,
        errorStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.red,
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.gray100,
            width: .5,
          ),
        ),
      ),
    );
  }
}
