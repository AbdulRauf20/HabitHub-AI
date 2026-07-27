import 'package:flutter/material.dart';
import 'package:habithub/views/Home_Module/widgets/app_top_bar.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppTopBar(),

            Expanded(child: Center(child: Text("Profile"))),
          ],
        ),
      ),
    );
  }
}
