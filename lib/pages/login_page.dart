import 'package:flutter/material.dart';
import 'package:simplechatvlu/services/auth/auth_service.dart';
import 'package:simplechatvlu/components/my_button.dart';
import 'package:simplechatvlu/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // email vs pw controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  // login method
  void login() async {
    // Removed BuildContext context from here
    // auth service
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
        _emailController.text,
        _pwController.text,
      );
    
    } catch (e) {
      // Ensure the widget is still mounted before showing the dialog
      if (mounted) {
        // <--- ADD THIS CHECK
        showDialog(
          context: context, // Now using the state's context
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 50),
            //welcome back message
            Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 25),
            //email textfield
            MyTextField(
              hintText: 'Enter your email',
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            //pw textfield
            MyTextField(
              hintText: 'Enter your password',
              obscureText: true,
              controller: _pwController,
            ),

            const SizedBox(height: 25),
            //login button
            MyButton(
              text: "Login",
              onTap: login,
            ), // Call login directly without passing context
            const SizedBox(height: 25),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    " Register now!",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
