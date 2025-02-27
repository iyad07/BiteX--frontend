import 'package:bikex/data/restaurant_handler.dart';
import 'package:bikex/models/food.dart';
import 'package:bikex/models/restaurant.dart';
import 'package:bikex/pages/Dashboard/dashboard.dart';
import 'package:bikex/pages/Dashboard/search_page.dart';
import 'package:bikex/pages/My%20cart/my_cart.dart';
import 'package:bikex/pages/check_out%20page/add_payment.dart';
import 'package:bikex/pages/check_out%20page/check_out.dart';
import 'package:bikex/pages/check_out%20page/successfulpay.dart';
import 'package:bikex/pages/food_pages/food_pages.dart';
import 'package:bikex/pages/orderHistory%20pages/order_list_page.dart';
import 'package:bikex/pages/profile%20pages/profile_page.dart';
import 'package:bikex/pages/restaurant%20_page/restaurant_page.dart';
import 'package:bikex/pages/tracking%20pages/map.dart';
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
      
      initialRoute: '/profile',
      routes: {
        '/profile':(context)=>ProfilePage(),
        '/order_history':(context)=>MyOrdersPage(),
        '/map':(context)=>TrackOrderPage(),
        '/payment_successful': (context)=> PaymentSuccessPage(),
        '/add_payment':(context)=> AddCardPage(),
        '/check_out':(context)=>CheckOutPage(hasCard: true,),
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

