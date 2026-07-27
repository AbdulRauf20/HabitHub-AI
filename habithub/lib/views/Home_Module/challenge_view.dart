import 'package:flutter/material.dart';
import 'package:habithub/views/Home_Module/widgets/app_top_bar.dart';

class ChallengeView extends StatefulWidget {
  const ChallengeView({super.key});

  @override
  State<ChallengeView> createState() => _ChallengeViewState();
}

class _ChallengeViewState extends State<ChallengeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
  body: SafeArea(
    child: Column(
      children: [

        AppTopBar(),

        Expanded(
          child: Center(
            child: Text("Challenges"),
          ),
        ),

      ],
    ),
  ),
);
  }
}