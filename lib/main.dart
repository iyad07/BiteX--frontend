import 'package:bikex/data/restaurant_handler.dart';
import 'package:bikex/models/food.dart';
import 'package:bikex/models/restaurant.dart';
import 'package:bikex/pages/Dashboard/dashboard.dart';
import 'package:bikex/pages/Dashboard/search_page.dart';
import 'package:bikex/pages/My%20cart/my_cart.dart';
import 'package:bikex/pages/food_pages/food_pages.dart';
import 'package:bikex/pages/restaurant%20_page/restaurant_page.dart';
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
        fontFamily: 'Sen',
      ),
      
      initialRoute: '/dashboard',
      routes: {
        '/my_cart':(context)=>MyCart(),
        '/food_page':(context)=> FoodPages(food: ModalRoute.of(context)!.settings.arguments as Food),
        '/restaurant': (context) => RestaurantPage(restaurant: ModalRoute.of(context)!.settings.arguments as Restaurant),
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

