import 'package:flutter/material.dart';
import 'package:simplechatvlu/services/auth/auth_service.dart';
import 'package:simplechatvlu/components/my_button.dart';
import 'package:simplechatvlu/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  // email vs pw controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  // tap to go to register page
  final void Function()? onTap;

  RegisterPage({super.key, this.onTap});

  // register method
  void register(BuildContext context) {
    // Implement registration logic here
    final AuthService authService = AuthService();
    // Try to register the user fix
    if (_pwController.text == _confirmPwController.text) {
      try {
        authService.signUpWithEmailPassword(
          _emailController.text,
          _pwController.text,
        );
        // Navigate to home page or show success message
      } catch (e) {
        // Handle error, e.g., show a snackbar with the error message
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text("Passwords do not match")),
      );
    }
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
              'Let\'s get you started!',
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
            // confirm pw textfield
            const SizedBox(height: 10),
            //pw textfield
            MyTextField(
              hintText: 'Confirm your password',
              obscureText: true,
              controller: _confirmPwController,
            ),

            const SizedBox(height: 25),
            //login button
            MyButton(text: "Register", onTap: () => register(context)),
            const SizedBox(height: 25),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Login Now!",
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
