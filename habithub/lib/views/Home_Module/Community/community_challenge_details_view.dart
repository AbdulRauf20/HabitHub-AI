import 'package:flutter/material.dart';

import 'package:habithub/models/community_challenge_model.dart';

class CommunityChallengeDetailsView extends StatelessWidget {
  final CommunityChallengeModel challenge;

  const CommunityChallengeDetailsView({super.key, required this.challenge});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Challenge')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CreatorSection(challenge: challenge),

            const SizedBox(height: 24),

            if (challenge.imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  challenge.imageUrl,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return const SizedBox.shrink();
                  },
                ),
              ),

            const SizedBox(height: 24),

            Text(
              challenge.title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
            ),

            const SizedBox(height: 12),

            Text(
              challenge.description,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: _InfoCard(
                    icon: Icons.calendar_today_outlined,
                    value: '${challenge.durationDays}',
                    label: 'Days',
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _InfoCard(
                    icon: Icons.star_outline,
                    value: '${challenge.rewardXP}',
                    label: 'XP',
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _InfoCard(
                    icon: Icons.people_outline,
                    value: '${challenge.participantsCount}',
                    label: 'Joined',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            _InfoCard(
              icon: Icons.favorite_outline,
              value: '${challenge.likesCount}',
              label: 'Likes',
            ),

            const SizedBox(height: 28),

            const Text(
              'About this challenge',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
            ),

            const SizedBox(height: 10),

            const Text(
              'Complete the daily tasks, build your streak, and earn XP as you progress.',
              style: TextStyle(fontSize: 15, height: 1.5),
            ),

            const SizedBox(height: 28),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: FilledButton(
                onPressed: challenge.isJoined
                    ? null
                    : () {
                        // Joining will be wired through the CommunityBloc.
                      },
                child: Text(
                  challenge.isJoined ? 'Already Joined' : 'Join Challenge',
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _CreatorSection extends StatelessWidget {
  final CommunityChallengeModel challenge;

  const _CreatorSection({required this.challenge});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundImage: challenge.creatorProfileImageUrl.isNotEmpty
              ? NetworkImage(challenge.creatorProfileImageUrl)
              : null,
          child: challenge.creatorProfileImageUrl.isEmpty
              ? const Icon(Icons.person_outline)
              : null,
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                challenge.creatorName.isEmpty
                    ? 'Unknown User'
                    : challenge.creatorName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              if (challenge.creatorUsername.isNotEmpty)
                Text(
                  '@${challenge.creatorUsername}',
                  style: const TextStyle(fontSize: 13),
                ),
            ],
          ),
        ),

        TextButton(
          onPressed: challenge.creatorId.isEmpty
              ? null
              : () {
                  // Follow action will be connected later.
                },
          child: Text(challenge.isFollowingCreator ? 'Following' : 'Follow'),
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _InfoCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon),

            const SizedBox(height: 8),

            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),

            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
