import 'package:flutter/material.dart';
import 'package:habithub/views/Home_Module/widgets/app_top_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppTopBar(),

            Expanded(child: Center(child: Text("Home Screen"))),
          ],
        ),
      ),
    );
  }
}
