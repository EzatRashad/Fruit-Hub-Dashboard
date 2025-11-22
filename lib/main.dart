import 'package:flutter/material.dart';
import 'package:frut_hub_dashboard/core/functions/on_generate_route.dart';
import 'package:frut_hub_dashboard/core/services/get_it_service.dart';
import 'package:frut_hub_dashboard/feature/dashboard/presentation/views/dashboard_view.dart';
import 'package:frut_hub_dashboard/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  //   await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      //locale: const Locale('ar'),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: AppTheme.currentTheme,
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.routeName,
    );
  }
}
