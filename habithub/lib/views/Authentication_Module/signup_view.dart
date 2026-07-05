import 'package:flutter/material.dart';
import 'package:habithub/core/theme/app_colors.dart';
import 'package:habithub/views/Authentication_Module/verify_email_view.dart';
import 'package:habithub/views/Authentication_Module/welcome_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Row
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeView(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 7,
                    width: 25,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(color: AppColors.primary),
                    ),
                  ),
                  SizedBox(width: 5),
                  SizedBox(
                    height: 7,
                    width: 25,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(color: AppColors.card),
                    ),
                  ),
                  SizedBox(width: 5),

                  SizedBox(
                    height: 7,
                    width: 25,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(color: AppColors.card),
                    ),
                  ),
                  const Spacer(),
                ],
              ),

              const SizedBox(height: 45),

              const Text(
                "Step 1 of 3",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 10),

              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Create your \n",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "HabitHub",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 45),

              const Text(
                "Full Name",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Arauf",
                  hintStyle: TextStyle(
                    color: Colors.white.withValues(alpha: 0.45),
                  ),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: AppColors.primary,
                  ),
                  filled: true,
                  fillColor: AppColors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Username",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "ARauf",
                  hintStyle: TextStyle(
                    color: Colors.white.withValues(alpha: 0.45),
                  ),
                  prefixIcon: const Icon(
                    Icons.person_2_outlined,
                    color: AppColors.primary,
                  ),
                  suffixIcon: const Icon(Icons.done, color: Colors.grey),
                  filled: true,
                  fillColor: AppColors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              Text(
                'Nice, Arauf20 is availabe',
                style: TextStyle(color: AppColors.primary, fontSize: 13),
              ),
              const SizedBox(height: 10),

              // email and password input
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: TextStyle(
                    color: Colors.white.withValues(alpha: 0.45),
                  ),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.primary,
                  ),
                  filled: true,
                  fillColor: AppColors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Password",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  hintStyle: TextStyle(
                    color: Colors.white.withValues(alpha: 0.45),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: AppColors.primary,
                  ),
                  suffixIcon: const Icon(
                    Icons.visibility_off_outlined,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: AppColors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              Row(
                children: [
                  SizedBox(
                    height: 7,
                    width: 25,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(color: AppColors.primary),
                    ),
                  ),
                  SizedBox(width: 5),

                  SizedBox(
                    height: 7,
                    width: 25,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(color: AppColors.card),
                    ),
                  ),
                  SizedBox(width: 5),

                  SizedBox(
                    height: 7,
                    width: 25,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(color: AppColors.card),
                    ),
                  ),
                  Text('Strong — add a symbol to make it unbreakable'),
                ],
              ),

              TextField(
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Confirm password",
                  hintStyle: TextStyle(
                    color: Colors.white.withValues(alpha: 0.45),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: AppColors.primary,
                  ),
                  suffixIcon: const Icon(
                    Icons.visibility_off_outlined,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: AppColors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    activeColor: AppColors.primary,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text(
                      "I agree to the Terms of Service and Privacy Policy.",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerifyEmailView(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.buttonPrimaryText,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    "Create Account",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.white.withValues(alpha: 0.2)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "OR SignUp with",
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Colors.white.withValues(alpha: 0.2)),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  socialButton("assets/google.png"),
                  socialButton("assets/apple.png"),
                  socialButton("assets/facebook.png"),
                ],
              ),

              const SizedBox(height: 45),

              Center(
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: "Log in",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget socialButton(String image) {
    return Container(
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Image.asset(image),
      ),
    );
  }
}
