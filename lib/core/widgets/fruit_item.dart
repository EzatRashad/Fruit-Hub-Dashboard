import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:frut_hub_dashboard/core/utils/app_colors.dart';
import 'package:frut_hub_dashboard/core/widgets/custom_network_image.dart'; 

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                child: CustomNetworkImage(
                  imageUrl:
                      "https://images.pexels.com/photos/46174/strawberries-berries-fruit-freshness-46174.jpeg",
                ),
              ),
              Positioned(
                top: 2,
                right: 2,
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.3),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_outline,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(4.0),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "فراولة",
                maxLines: 2,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '10 جنية ',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.secondryColor,
                            fontSize: 13,
                          ),
                    ),
                    TextSpan(
                      text: '/',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.secondryColor,
                            fontSize: 13,
                          ),
                    ),
                    TextSpan(
                      text: 'كيلو',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.secondryLight,
                            fontSize: 13,
                          ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            
              /// زر الإضافة
              trailing: GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
