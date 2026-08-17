import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:habithub/services/firestore_service.dart';
import 'package:habithub/views/Challenges_Module/Challenges/Bloc/challenge_bloc.dart';
import 'package:habithub/views/Challenges_Module/Challenges/Bloc/challenge_event.dart';
import 'package:habithub/views/Challenges_Module/Challenges/Bloc/challenge_state.dart';
import 'package:habithub/views/Home_Module/widgets/app_top_bar.dart';
import 'package:habithub/views/repositories/challenge_repository.dart';

class ChallengeView extends StatelessWidget {
  const ChallengeView({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) =>
          ChallengeRepository(firestoreService: FirestoreService.instance),
      child: BlocProvider(
        create: (context) =>
            ChallengeBloc(repository: context.read<ChallengeRepository>())
              ..add(const LoadJoinedChallenges()),
        child: const _ChallengeViewBody(),
      ),
    );
  }
}

class _ChallengeViewBody extends StatelessWidget {
  const _ChallengeViewBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppTopBar(),

            Expanded(
              child: BlocBuilder<ChallengeBloc, ChallengeState>(
                builder: (context, state) {
                  if (state is ChallengeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ChallengeError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.error_outline, size: 48),

                            const SizedBox(height: 16),

                            const Text(
                              'Unable to load challenges',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(state.message, textAlign: TextAlign.center),

                            const SizedBox(height: 20),

                            ElevatedButton(
                              onPressed: () {
                                context.read<ChallengeBloc>().add(
                                  const LoadJoinedChallenges(),
                                );
                              },
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  if (state is ChallengeLoaded) {
                    if (state.challenges.isEmpty) {
                      return const Center(
                        child: Text(
                          'No challenges yet.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.challenges.length,
                      itemBuilder: (context, index) {
                        final challenge = state.challenges[index];

                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  challenge.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                Text(
                                  challenge.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                const SizedBox(height: 12),

                                Row(
                                  children: [
                                    Text(
                                      'Day ${challenge.currentDay}/${challenge.totalDays}',
                                    ),

                                    const SizedBox(width: 16),

                                    Text(
                                      '${challenge.progress.toStringAsFixed(0)}%',
                                    ),

                                    const Spacer(),

                                    Text('${challenge.streak} 🔥'),
                                  ],
                                ),

                                const SizedBox(height: 10),

                                LinearProgressIndicator(
                                  value: challenge.progress.clamp(0.0, 1.0),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
