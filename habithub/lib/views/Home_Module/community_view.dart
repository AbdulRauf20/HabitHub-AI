import 'package:flutter/material.dart';
import 'package:habithub/views/Home_Module/widgets/app_top_bar.dart';

class CommunityView extends StatefulWidget {
  const CommunityView({super.key});

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppTopBar(),

            Expanded(child: Center(child: Text("Community"))),
          ],
        ),
      ),
    );
  }
}
