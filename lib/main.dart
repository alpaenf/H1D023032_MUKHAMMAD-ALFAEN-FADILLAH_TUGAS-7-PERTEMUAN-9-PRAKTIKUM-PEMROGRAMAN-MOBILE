import 'package:flutter/material.dart';
import 'package:tugas7/constants/app_theme.dart';
import 'package:tugas7/services/storage_service.dart';
import 'package:tugas7/routes/app_routes.dart';
import 'package:tugas7/pages/login_page.dart';
import 'package:tugas7/pages/dashboard_page.dart';
import 'package:tugas7/pages/profile_page.dart';
import 'package:tugas7/pages/settings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: StorageService().isLoggedIn(),
      builder: (context, snapshot) {
        // Show loading screen while checking login status
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            home: Container(
              color: AppTheme.pureWhite,
              child: Center(
                child: CircularProgressIndicator(
                  color: const Color.fromARGB(255, 90, 97, 123),
                ),
              ),
            ),
          );
        }

        // Build app with appropriate initial page
        return MaterialApp(
          title: 'NIM_Tugas7',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          home: (snapshot.data == true) 
              ? DashboardPage() 
              : const LoginPage(),
          routes: {
            AppRoutes.dashboard: (context) => DashboardPage(),
            AppRoutes.profile: (context) => ProfilePage(),
            AppRoutes.settings: (context) => const SettingsPage(),
          },
        );
      },
    );
  }
}
