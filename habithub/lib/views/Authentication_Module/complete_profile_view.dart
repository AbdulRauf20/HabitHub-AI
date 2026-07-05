import 'package:flutter/material.dart';
import 'package:habithub/core/theme/app_colors.dart';
import 'package:habithub/views/Authentication_Module/verify_email_view.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  String selectedGender = "male";
  String selectedGoal = "Build Better Habits";
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
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VerifyEmailView(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    height: 7,
                    width: 25,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(color: AppColors.primary),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const SizedBox(
                    height: 7,
                    width: 25,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(color: AppColors.primary),
                    ),
                  ),
                  const SizedBox(width: 5),

                  const SizedBox(
                    height: 7,
                    width: 25,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(color: AppColors.primary),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 45),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "FINAL STEP",
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
                            text: "Make it ",
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 25,
                            ),
                          ),
                          TextSpan(
                            text: "yours",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // We'll add image picker functionality later.
                          },
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: AppColors.card,
                            child: const Icon(
                              Icons.add_a_photo_rounded,
                              size: 35,
                              color: AppColors.iconSecondary,
                            ),
                          ),
                        ),
                
                        const SizedBox(height: 12),
                
                        const Text(
                          "Add Photo",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              TextField(
                maxLines: 5,
                style: const TextStyle(color: AppColors.textPrimary),
                decoration: InputDecoration(
                  hintText: "Tell us about yourself...",
                  hintStyle: TextStyle(
                    color: AppColors.textSecondary.withValues(alpha: 0.6),
                  ),
                  filled: true,
                  fillColor: AppColors.card,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                "Gender",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              RadioListTile<String>(
                title: const Text(
                  "Male",
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                value: "male",
                groupValue: selectedGender,
                activeColor: AppColors.primary,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),

              RadioListTile<String>(
                title: const Text(
                  "Female",
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                value: "female",
                groupValue: selectedGender,
                activeColor: AppColors.primary,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),

              RadioListTile<String>(
                title: const Text(
                  "Prefer not to say",
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                value: "prefer_not_to_say",
                groupValue: selectedGender,
                activeColor: AppColors.primary,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),

              const SizedBox(height: 24),

              const Text(
                "Primary Goal",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 12),

              DropdownButtonFormField<String>(
                value: selectedGoal,
                dropdownColor: AppColors.surface,
                style: const TextStyle(color: AppColors.textPrimary),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.card,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Build Better Habits",
                    child: Text("Build Better Habits"),
                  ),
                  DropdownMenuItem(
                    value: "Fitness & Health",
                    child: Text("Fitness & Health"),
                  ),
                  DropdownMenuItem(
                    value: "Study Consistently",
                    child: Text("Study Consistently"),
                  ),
                  DropdownMenuItem(
                    value: "Increase Productivity",
                    child: Text("Increase Productivity"),
                  ),
                  DropdownMenuItem(
                    value: "Improve Sleep",
                    child: Text("Improve Sleep"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedGoal = value!;
                  });
                },
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
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
                    "Continue",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
