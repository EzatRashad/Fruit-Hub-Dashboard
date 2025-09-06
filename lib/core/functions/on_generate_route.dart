import 'package:flutter/material.dart';
import 'package:frut_hub_dashboard/feature/dashboard/presentation/views/dashboard_view.dart'; 

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (_) => const DashboardView());

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
//    Navigator.pushReplacementNamed(context, LoginView.routeName);
//Navigator.pushNamed(context, SignupView.routeName);
