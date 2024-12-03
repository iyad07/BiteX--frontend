import 'package:bikex/components/buttons.dart';
import 'package:bikex/components/cred_textfields.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            'assets/bg_asset.png', // Ensure this path is correct
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width,
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height:120,
                      ),
                      const Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Please sign in to your existing account",
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
                        buildCredTextField("EMAIL"),
                        const SizedBox(
                          height: 10,
                        ),
                        buildCredTextField("PASSWORD"),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: false,
                                  onChanged: (value) {},
                                  activeColor: Colors.orange,
                                ),
                                const Text(
                                  "Remember me",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            textButton("Forgot Password", () {Navigator.pushNamed(context, '/forgot_password');})
                          ],
                        ),
                        const SizedBox(height: 20),
                        elevatedButton("LOG IN", () {}),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                            ),
                            textButton("SIGN UP", () {
                              Navigator.pushNamed(context, '/signup');
                            })
                          ],
                        ),
                        const Text(
                          "Or",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            otherLoginMethods(Icons.facebook, Colors.blue[900]),
                            otherLoginMethods(
                                Icons.alternate_email, Colors.lightBlue),
                            otherLoginMethods(Icons.apple, Colors.black),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}