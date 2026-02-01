import 'package:court_kutchery_app/splash_screen.dart';
import 'package:court_kutchery_app/walkthrough_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dashboard_screen.dart';
import 'lawyers_screen.dart';
import 'login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const CourtKutcheryApp());
}

class CourtKutcheryApp extends StatelessWidget {
  const CourtKutcheryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Court Kutchery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF5B7FD9),
        scaffoldBackgroundColor: const Color(0xFF6B8FE8),
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/walkthrough': (context) => const WalkthroughScreen(),
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/lawyers': (context) => const LawyersScreen(),
      },
    );
  }
}
