import 'package:bikex/data/restaurant_handler.dart';
import 'package:bikex/models/food.dart';
import 'package:bikex/models/restaurant.dart';
import 'package:bikex/screens/chef_pages/dashboard_screen.dart';
import 'package:bikex/screens/user_pages/Dashboard/dashboard.dart';
import 'package:bikex/screens/user_pages/Dashboard/search_page.dart';
import 'package:bikex/screens/user_pages/My%20cart/my_cart.dart';
import 'package:bikex/screens/user_pages/check_out%20page/add_payment.dart';
import 'package:bikex/screens/user_pages/check_out%20page/check_out.dart';
import 'package:bikex/screens/user_pages/check_out%20page/successfulpay.dart';
import 'package:bikex/screens/user_pages/food_pages/food_pages.dart';
import 'package:bikex/screens/user_pages/orderHistory%20pages/order_list_page.dart';
import 'package:bikex/screens/user_pages/profile%20pages/personal_profile_page.dart';
import 'package:bikex/screens/user_pages/profile%20pages/profile_page.dart';
import 'package:bikex/screens/user_pages/restaurant%20_page/restaurant_page.dart';
import 'package:bikex/screens/user_pages/tracking%20pages/map.dart';
import 'package:bikex/screens/user_pages/user_credential_pages/forgot_password.dart';
import 'package:bikex/screens/user_pages/user_credential_pages/login.dart';
import 'package:bikex/screens/user_pages/onboarding%20screens/onboarding_screen.dart';
import 'package:bikex/screens/user_pages/user_credential_pages/signup.dart';
import 'package:bikex/screens/user_pages/user_credential_pages/verification.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: StreamBuilder<fb.User?>(
        stream: fb.FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return const RestaurantDashboard();
          }
          return const LoginPage();
        },
      ),
      routes: {
        '/chef_dashboard': (context) => ChefDashboard(),
        '/personal_profile': (context) => PersonalProfilePage(),
        '/profile': (context) => ProfilePage(),
        '/order_history': (context) => MyOrdersPage(),
        '/map': (context) => TrackOrderPage(),
        '/payment_successful': (context) => PaymentSuccessPage(),
        '/add_payment': (context) => AddCardPage(),
        '/check_out': (context) => CheckOutPage(hasCard: true),
        '/my_cart': (context) => MyCart(),
        '/food_page': (context) =>
            FoodPages(food: ModalRoute.of(context)!.settings.arguments as Food),
        '/restaurant': (context) => RestaurantPage(
            restaurant: ModalRoute.of(context)!.settings.arguments as Restaurant),
        '/search': (context) => SearchPage(),
        '/dashboard': (context) => const RestaurantDashboard(),
        '/onboarding1': (context) => OnboardingScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/verification': (context) => const VerificationPage(),
        '/forgot_password': (context) => const ForgotPasswordPage(),
      },
    );
  }
}