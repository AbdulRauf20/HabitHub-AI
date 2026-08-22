import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:habithub/models/community_challenge_model.dart';
import 'package:habithub/services/firestore_service.dart';
import 'package:habithub/views/Home_Module/Community/Bloc/community_bloc.dart';
import 'package:habithub/views/Home_Module/Community/Bloc/community_event.dart';
import 'package:habithub/views/Home_Module/Community/Bloc/community_state.dart';
import 'package:habithub/views/Home_Module/widgets/app_top_bar.dart';
import 'package:habithub/views/repositories/community_repository.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) =>
          CommunityRepository(firestoreService: FirestoreService.instance),
      child: BlocProvider(
        create: (context) =>
            CommunityBloc(repository: context.read<CommunityRepository>())
              ..add(const LoadCommunity()),
        child: const _CommunityBody(),
      ),
    );
  }
}

class _CommunityBody extends StatelessWidget {
  const _CommunityBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppTopBar(),

            Expanded(
              child: BlocBuilder<CommunityBloc, CommunityState>(
                builder: (context, state) {
                  if (state is CommunityLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is CommunityError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(state.message, textAlign: TextAlign.center),
                      ),
                    );
                  }

                  if (state is CommunityLoaded) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<CommunityBloc>().add(
                          const RefreshCommunity(),
                        );
                      },
                      child: ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                          const Text(
                            'Community',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            'Discover challenges and see what others are working on.',
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.color,
                            ),
                          ),

                          const SizedBox(height: 20),

                          if (state.challenges.isEmpty) const _EmptyCommunity(),

                          ...state.challenges.map(
                            (challenge) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: _ChallengeCard(challenge: challenge),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return const Center(
                    child: Text('No community data available.'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChallengeCard extends StatelessWidget {
  final CommunityChallengeModel challenge;

  const _ChallengeCard({required this.challenge});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CommunityBloc>();

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CreatorHeader(
            challenge: challenge,
            onFollow: challenge.creatorId.isEmpty
                ? null
                : () {
                    bloc.add(
                      ToggleCommunityFollow(creatorId: challenge.creatorId),
                    );
                  },
          ),

          if (challenge.imageUrl.isNotEmpty)
            AspectRatio(
              aspectRatio: 16 / 8,
              child: Image.network(
                challenge.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return const _ImagePlaceholder();
                },
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  challenge.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  challenge.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    _InfoChip(
                      icon: Icons.calendar_today_outlined,
                      text: '${challenge.durationDays} days',
                    ),

                    const SizedBox(width: 8),

                    _InfoChip(
                      icon: Icons.star_outline,
                      text: '${challenge.rewardXP} XP',
                    ),

                    const SizedBox(width: 8),

                    _InfoChip(
                      icon: Icons.people_outline,
                      text: '${challenge.participantsCount}',
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        bloc.add(
                          ToggleChallengeLike(challengeId: challenge.id),
                        );
                      },
                      icon: Icon(
                        challenge.isLiked
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                    ),

                    Text('${challenge.likesCount}'),

                    const Spacer(),

                    SizedBox(
                      height: 42,
                      child: FilledButton(
                        onPressed: challenge.isJoined
                            ? null
                            : () {
                                bloc.add(
                                  JoinCommunityChallenge(
                                    challengeId: challenge.id,
                                  ),
                                );
                              },
                        child: Text(
                          challenge.isJoined ? 'Joined' : 'Join Challenge',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CreatorHeader extends StatelessWidget {
  final CommunityChallengeModel challenge;
  final VoidCallback? onFollow;

  const _CreatorHeader({required this.challenge, required this.onFollow});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 12, 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 21,
            backgroundImage: challenge.creatorProfileImageUrl.isNotEmpty
                ? NetworkImage(challenge.creatorProfileImageUrl)
                : null,
            child: challenge.creatorProfileImageUrl.isEmpty
                ? const Icon(Icons.person_outline)
                : null,
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  challenge.creatorName.isEmpty
                      ? 'Unknown User'
                      : challenge.creatorName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                if (challenge.creatorUsername.isNotEmpty)
                  Text(
                    '@${challenge.creatorUsername}',
                    style: const TextStyle(fontSize: 12),
                  ),
              ],
            ),
          ),

          if (challenge.creatorId.isNotEmpty)
            TextButton(
              onPressed: onFollow,
              child: Text(
                challenge.isFollowingCreator ? 'Following' : 'Follow',
              ),
            ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14),

            const SizedBox(width: 4),

            Flexible(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
      child: const Center(child: Icon(Icons.image_outlined, size: 40)),
    );
  }
}

class _EmptyCommunity extends StatelessWidget {
  const _EmptyCommunity();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          children: [
            const Icon(Icons.groups_outlined, size: 48),

            const SizedBox(height: 12),

            const Text(
              'No challenges yet',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            Text(
              'Public challenges created by the community will appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
