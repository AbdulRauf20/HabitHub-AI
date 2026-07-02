import 'package:flutter/material.dart';
import 'package:habithub/core/theme/app_colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 10, height: 10, child: Text('<')),
                SizedBox(
                  width: 10,
                  height: 10,
                  child: Image.asset("assets/logo.png"),
                ),
              ],
            ),
            Text(
              'WELCOME BACK',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Log in to keep your ',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'streak alive.',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 15),
            Text(
              'Email Address',
              style: TextStyle(fontSize: 8, color: AppColors.textPrimary),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter you email',
              ),
            ),
            Text(
              'Password',
              style: TextStyle(fontSize: 8, color: AppColors.textPrimary),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter you password',
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                Text('Keep me logged in on this device'),
              ],
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.buttonPrimaryText,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Log In ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            Text(
              'or continue with',
              style: TextStyle(
                fontSize: 8,
                color: AppColors.textPrimary.withValues(alpha: 0.5),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset("assets/google.png"),
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset("assets/apple.png"),
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset("assets/facebook.png"),
                ),
              ],
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'New to HabitHub? ',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Create an account',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
