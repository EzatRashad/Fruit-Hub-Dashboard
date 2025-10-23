import 'package:flutter/material.dart';
import 'package:frut_hub_dashboard/core/utils/app_images.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ResponsiveDashboard(),
      ),
    );
  }
}

class ResponsiveDashboard extends StatelessWidget {
  const ResponsiveDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 1100) {
      return const DesktopDashboard();
    } else if (screenWidth >= 700) {
      return const TabletDashboard();
    } else {
      return const MobileDashboard();
    }
  }
}

class DesktopDashboard extends StatelessWidget {
  const DesktopDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(flex: 2, child: SidebarMenu()),
        Expanded(flex: 8, child: DashboardContent()),
      ],
    );
  }
}

class TabletDashboard extends StatelessWidget {
  const TabletDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(flex: 3, child: SidebarMenu()),
        Expanded(flex: 7, child: DashboardContent()),
      ],
    );
  }
}

class MobileDashboard extends StatelessWidget {
  const MobileDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        margin: const EdgeInsets.only(right: 40),
        child: const Drawer(child: SidebarMenu())),
      appBar: AppBar(
        title: const Text("Fruit Hub Admin"),
        actions: const [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(Assets.assetsImagesProfile),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: const DashboardContent(),
    );
  }
}

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {"icon": Icons.dashboard_outlined, "label": "Dashboard"},
      {"icon": Icons.add_circle_outline, "label": "Add Product"},
      {"icon": Icons.inventory_2_outlined, "label": "Products"},
      {"icon": Icons.shopping_cart_outlined, "label": "Orders"},
      {"icon": Icons.people_outline, "label": "Users"},
      {"icon": Icons.bar_chart_outlined, "label": "Analytics"},
    ];

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
           
            
            padding: const EdgeInsets.all(24),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Fruit Hub 🍓",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: items
                  .map((item) => ListTile(
                        leading:
                            Icon(item["icon"] as IconData, color: Colors.green),
                        title: Text(item["label"] as String),
                        onTap: () {
                          Navigator.pushNamed(context, '${item["label"]}');
                        },
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Dashboard Overview",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              if (!isMobile)
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage(Assets.assetsImagesProfile),
                ),
            ],
          ),
          const SizedBox(height: 20),

          // Stats Grid
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 4;
              if (constraints.maxWidth < 1100 && constraints.maxWidth >= 700) {
                crossAxisCount = 2;
              } else if (constraints.maxWidth < 700) {
                crossAxisCount = 1;
              }

              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  DashboardStatCard(
                    title: "Total Products",
                    value: "120",
                    icon: Icons.inventory_2_outlined,
                    color: Colors.orange,
                  ),
                  DashboardStatCard(
                    title: "Total Orders",
                    value: "350",
                    icon: Icons.shopping_cart_outlined,
                    color: Colors.blue,
                  ),
                  DashboardStatCard(
                    title: "Active Users",
                    value: "540",
                    icon: Icons.people_outline,
                    color: Colors.purple,
                  ),
                  DashboardStatCard(
                    title: "Revenue",
                    value: "\$12,800",
                    icon: Icons.attach_money_outlined,
                    color: Colors.green,
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 30),

          // Recent Orders Section
          const Text(
            "Recent Orders",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(2, 4)),
              ],
            ),
            child:SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: DataTable(
    columns: const [
      DataColumn(label: Text("Order ID")),
      DataColumn(label: Text("Customer")),
      DataColumn(label: Text("Status")),
      DataColumn(label: Text("Amount")),
    ],
    rows: const [
      DataRow(cells: [
        DataCell(Text("#001")),
        DataCell(Text("John Doe")),
        DataCell(Text("Delivered")),
        DataCell(Text("\$120")),
      ]),
      DataRow(cells: [
        DataCell(Text("#002")),
        DataCell(Text("Sarah Lee")),
        DataCell(Text("Pending")),
        DataCell(Text("\$85")),
      ]),
      DataRow(cells: [
        DataCell(Text("#003")),
        DataCell(Text("Michael Scott")),
        DataCell(Text("Cancelled")),
        DataCell(Text("\$0")),
      ]),
    ],
  ),
),

      ),
        ],
      ),
    );
  }
}

class DashboardStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const DashboardStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;
    final isTablet = width >= 700 && width < 1100;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.08),
            color.withOpacity(0.03),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: isMobile || isTablet
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: color.withOpacity(0.15),
                  child: Icon(icon, color: color, size: 28),
                ),
                const SizedBox(height: 12),
                Text(
                  value,
                  style: TextStyle(
                    color: color,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: color.withOpacity(0.15),
                  radius: 26,
                  child: Icon(icon, color: color, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 14)),
                      const SizedBox(height: 4),
                      Text(value,
                          style: TextStyle(
                              color: color,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
