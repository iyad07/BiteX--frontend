import 'package:bikex/data/restaurant_handler.dart';
import 'package:bikex/pages/Dashboard/dashboard.dart';
import 'package:bikex/pages/Dashboard/search_page.dart';
import 'package:bikex/pages/user_credential_pages/forgot_password.dart';
import 'package:bikex/pages/user_credential_pages/login.dart';
import 'package:bikex/pages/onboarding%20screens/onboarding_screen.dart';
import 'package:bikex/pages/user_credential_pages/signup.dart';
import 'package:bikex/pages/user_credential_pages/verification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RestaurantHandler()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BikeX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        //useMaterial3: true,
        fontFamily: 'Sen',
      ),
      initialRoute: '/dashboard',
      routes: {
        '/search': (context) => SearchPage(),
        '/dashboard': (context) => RestaurantDashboard(),
        '/onboarding1': (context) => OnboardingScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/verification': (context) => const VerificationPage(),
        '/forgot_password': (context) => const ForgotPasswordPage(),
      },
    );
  }
}
