import 'package:flutter/material.dart';
import 'package:frut_hub_dashboard/core/utils/app_images.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
       
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 👋 Welcome Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Welcome Back,",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      Text(
                        "Admin 👋",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(Assets.assetsImagesProfile),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: const [
                    DashboardCard(
                      title: "Add Product",
                      icon: Icons.add_circle_outline,
                      color: Colors.orange,
                    ),
                    DashboardCard(
                      title: "View Products",
                      icon: Icons.inventory_2_outlined,
                      color: Colors.blue,
                    ),
                    DashboardCard(
                      title: "View Orders",
                      icon: Icons.shopping_cart_outlined,
                      color: Colors.green,
                    ),
                    DashboardCard(
                      title: "View Users",
                      icon: Icons.people_outline,
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) { 
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        // TODO: Add navigation logic
      },
      child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withAlpha(51), color.withAlpha(13)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withAlpha(51),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color.withAlpha(38),
              child: Icon(icon, size: 32, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
