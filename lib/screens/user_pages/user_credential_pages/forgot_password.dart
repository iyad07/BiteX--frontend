import 'package:flutter/material.dart';
import 'package:bikex/components/buttons.dart';
import 'package:bikex/components/cred_textfields.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _sendCode() {
    String email = _emailController.text.trim();

    if (email.isEmpty || !email.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email')),
      );
      return;
    }

    // Logic to send the reset code
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(foregroundColor: Colors.white,backgroundColor: Colors.transparent,),
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                ),
                const Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Please enter your email to reset your password",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  buildCredTextField(
                    "EMAIL",
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 30),
                  elevatedButton("SEND CODE", _sendCode),
                  const SizedBox(height: 60),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
} 