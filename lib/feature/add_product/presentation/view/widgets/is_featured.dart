import 'package:flutter/material.dart';
import 'package:frut_hub_dashboard/core/utils/utils.dart';

import '../../../../../core/utils/app_colors.dart';
import 'custom_check_box.dart';

class IsFeatured extends StatefulWidget {
  const IsFeatured({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<IsFeatured> createState() => _IsFeaturedState();
}

class _IsFeaturedState extends State<IsFeatured> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        10.pw,
        Expanded(
          child: Text(
            "Is Featured Product",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.primaryColor, fontSize: 13),
          ),
        )
      ],
    );
  }
}
