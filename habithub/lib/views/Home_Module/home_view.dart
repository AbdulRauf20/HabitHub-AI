import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habithub/views/Home_Module/challenge_details_view.dart';
import 'package:habithub/views/Home_Module/community_view.dart';
import 'package:habithub/views/Home_Module/create_challenge_view.dart';
import 'package:habithub/views/Home_Module/profile_view.dart';
import 'Bloc/bottom_nav_bloc.dart';
import 'Bloc/bottom_nav_state.dart';
import 'widgets/bottom_navbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavBloc(),
      child: const _HomeViewBody(),
    );
  }
}
class _HomeViewBody extends StatelessWidget {
  const _HomeViewBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: _pages[state.currentIndex],
          bottomNavigationBar: const HabitHubBottomNavBar(),
        );
      },
    );
  }
}
final List<Widget> _pages = [
  const HomeView(),
  const ChallengeDetailsView(),
  const CreateChallengeView(),
  const CommunityView(),
  const ProfileView(),
];