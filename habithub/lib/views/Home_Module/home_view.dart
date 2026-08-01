import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:habithub/services/firestore_service.dart';

import 'package:habithub/views/Home_Module/Home/Bloc/home_bloc.dart';
import 'package:habithub/views/Home_Module/Home/Bloc/home_event.dart';
import 'package:habithub/views/Home_Module/Home/Bloc/home_state.dart';

import 'package:habithub/views/Home_Module/Home/home_widgets/dashboard_card.dart';
import 'package:habithub/views/Home_Module/Home/home_widgets/joined_challenges_section.dart';
import 'package:habithub/views/Home_Module/widgets/app_top_bar.dart';
import 'package:habithub/views/repositories/challenge_repository.dart';
import 'package:habithub/views/repositories/home_repository.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HomeRepository>(
          create: (_) =>
              HomeRepository(firestoreService: FirestoreService.instance),
        ),

        RepositoryProvider<ChallengeRepository>(
          create: (_) =>
              ChallengeRepository(firestoreService: FirestoreService.instance),
        ),
      ],

      child: BlocProvider(
        create: (context) => HomeBloc(
          homeRepository: context.read<HomeRepository>(),
          challengeRepository: context.read<ChallengeRepository>(),
        )..add(const LoadHomeData()),

        child: const _HomeViewBody(),
      ),
    );
  }
}

class _HomeViewBody extends StatelessWidget {
  const _HomeViewBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeError) {
              return Center(child: Text(state.message));
            }

            if (state is HomeLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<HomeBloc>().add(const RefreshHome());
                },

                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),

                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const AppTopBar(),

                        const SizedBox(height: 10),

                        DashboardCard(home: state.home),

                        const SizedBox(height: 24),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),

                          child: JoinedChallengesSection(
                            challenges: state.challenges,

                            onViewAll: () {
                              // We'll connect navigation
                              // to ChallengesView later.
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
