import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simplechatvlu/services/auth/login_or_register.dart';
import 'package:simplechatvlu/pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Check if the user is logged in
          if (snapshot.hasData) {
            return  HomePage(); // Replace with your home page widget
          }

          // If the user is not logged in, show the login page
          return const LoginOrRegister();
        },
      ),
    );
  }
}
