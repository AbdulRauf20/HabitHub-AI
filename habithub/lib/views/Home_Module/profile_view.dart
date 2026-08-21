import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:habithub/services/firestore_service.dart';
import 'package:habithub/views/Home_Module/Profile/Bloc/profile_bloc.dart';
import 'package:habithub/views/Home_Module/Profile/Bloc/profile_event.dart';
import 'package:habithub/views/Home_Module/Profile/Bloc/profile_state.dart';
import 'package:habithub/views/Home_Module/Profile/edit_profile_view.dart';
import 'package:habithub/views/Home_Module/Profile/profile_widgets/activity_grid.dart';
import 'package:habithub/views/Home_Module/widgets/app_top_bar.dart';
import 'package:habithub/views/repositories/profile_repository.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) =>
          ProfileRepository(firestoreService: FirestoreService.instance),
      child: BlocProvider(
        create: (context) =>
            ProfileBloc(repository: context.read<ProfileRepository>())
              ..add(const LoadProfile()),
        child: const _ProfileBody(),
      ),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppTopBar(),

            Expanded(
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ProfileError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(state.message, textAlign: TextAlign.center),
                      ),
                    );
                  }

                  if (state is ProfileLoaded || state is ProfileUpdating) {
                    final profile = state is ProfileLoaded
                        ? state.profile
                        : (state as ProfileUpdating).profile;

                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<ProfileBloc>().add(const RefreshProfile());
                      },
                      child: ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                          _ProfileHeader(
                            name: profile.name,
                            username: profile.username,
                            bio: profile.bio,
                            profileImageUrl: profile.profileImageUrl,
                          ),

                          const SizedBox(height: 24),

                          _StatsSection(
                            totalXP: profile.totalXP,
                            level: profile.level,
                            currentStreak: profile.currentStreak,
                            completedTasks: profile.completedTasks,
                            completedChallenges: profile.completedChallenges,
                            leaderboardRank: profile.leaderboardRank,
                          ),

                          const SizedBox(height: 24),

                          const _SectionTitle(title: 'Activity'),

                          const SizedBox(height: 12),

                          ActivityGrid(activities: profile.activities),
                          const SizedBox(height: 24),

                          const _SectionTitle(title: 'Analytics'),

                          const SizedBox(height: 12),

                          _AnalyticsPlaceholder(
                            completedTasks: profile.completedTasks,
                            completedChallenges: profile.completedChallenges,
                            currentStreak: profile.currentStreak,
                          ),

                          const SizedBox(height: 24),

                          const _SectionTitle(title: 'Badge'),

                          const SizedBox(height: 12),

                          _BadgePlaceholder(
                            activeBadgeId: profile.activeBadgeId,
                            ownedBadges: profile.ownedBadgeIds,
                          ),
                        ],
                      ),
                    );
                  }

                  return const Center(
                    child: Text('No profile data available.'),
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

class _ProfileHeader extends StatelessWidget {
  final String name;
  final String username;
  final String bio;
  final String profileImageUrl;

  const _ProfileHeader({
    required this.name,
    required this.username,
    required this.bio,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundImage: profileImageUrl.isNotEmpty
              ? NetworkImage(profileImageUrl)
              : null,
          child: profileImageUrl.isEmpty
              ? const Icon(Icons.person_outline, size: 42)
              : null,
        ),

        const SizedBox(height: 12),

        Text(
          name.isEmpty ? 'Unnamed User' : name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
        ),

        if (username.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text('@$username', style: const TextStyle(fontSize: 14)),
        ],

        if (bio.isNotEmpty) ...[
          const SizedBox(height: 10),
          Text(bio, textAlign: TextAlign.center),
        ],

        const SizedBox(height: 16),

        OutlinedButton.icon(
          onPressed: () {
            final bloc = context.read<ProfileBloc>();

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: bloc,
                  child: EditProfileView(
                    name: name,
                    username: username,
                    bio: bio,
                    profileImageUrl: profileImageUrl,
                  ),
                ),
              ),
            );
          },
          icon: const Icon(Icons.edit_outlined),
          label: const Text('Edit Profile'),
        ),
      ],
    );
  }
}

class _StatsSection extends StatelessWidget {
  final int totalXP;
  final int level;
  final int currentStreak;
  final int completedTasks;
  final int completedChallenges;
  final int leaderboardRank;

  const _StatsSection({
    required this.totalXP,
    required this.level,
    required this.currentStreak,
    required this.completedTasks,
    required this.completedChallenges,
    required this.leaderboardRank,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.7,
      children: [
        _StatCard(value: '$totalXP', label: 'XP', icon: Icons.star_outline),
        _StatCard(value: '$level', label: 'Level', icon: Icons.trending_up),
        _StatCard(
          value: '$currentStreak',
          label: 'Current Streak',
          icon: Icons.local_fire_department_outlined,
        ),
        _StatCard(
          value: '$completedTasks',
          label: 'Tasks Completed',
          icon: Icons.check_circle_outline,
        ),
        _StatCard(
          value: '$completedChallenges',
          label: 'Challenges Completed',
          icon: Icons.emoji_events_outlined,
        ),
        _StatCard(
          value: leaderboardRank > 0 ? '#$leaderboardRank' : '--',
          label: 'Leaderboard',
          icon: Icons.leaderboard_outlined,
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;

  const _StatCard({
    required this.value,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(label, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
    );
  }
}

// ignore: unused_element
class _ActivityPlaceholder extends StatelessWidget {
  const _ActivityPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 150,
        child: Center(
          child: Text(
            'Activity grid will be connected to task history.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class _AnalyticsPlaceholder extends StatelessWidget {
  final int completedTasks;
  final int completedChallenges;
  final int currentStreak;

  const _AnalyticsPlaceholder({
    required this.completedTasks,
    required this.completedChallenges,
    required this.currentStreak,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              '$completedTasks',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const Text('Tasks completed'),

            const SizedBox(height: 16),

            Text(
              '$completedChallenges',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('Challenges completed'),

            const SizedBox(height: 16),

            Text(
              '$currentStreak days',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('Current streak'),
          ],
        ),
      ),
    );
  }
}

class _BadgePlaceholder extends StatelessWidget {
  final String? activeBadgeId;
  final List<String> ownedBadges;

  const _BadgePlaceholder({
    required this.activeBadgeId,
    required this.ownedBadges,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.workspace_premium_outlined, size: 48),

            const SizedBox(height: 10),

            Text(
              activeBadgeId ?? 'No active badge',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            Text('${ownedBadges.length} badge(s) owned'),
          ],
        ),
      ),
    );
  }
}
