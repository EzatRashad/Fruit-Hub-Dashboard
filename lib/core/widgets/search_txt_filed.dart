import 'package:flutter/material.dart';
import 'package:frut_hub_dashboard/core/utils/app_images.dart';
import 'package:frut_hub_dashboard/core/widgets/default_image_widget.dart';
 

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            width: 20,
            child: Center(
              child: DefaultImageWidget(Assets.assetsImagesSearch),
            ),
          ),
          suffixIcon: SizedBox(
            width: 20,
            child: Center(
              child: DefaultImageWidget(Assets.assetsImagesFilter),
            ),
          ),
          hintStyle: Theme.of(context)
              .textTheme
              .titleSmall ,
          hintText: 'ابحث عن.......',
          filled: true,
          fillColor: Colors.white,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.white,
      ),
    );
  }
}
