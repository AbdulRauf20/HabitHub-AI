import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {
  const LoadProfile();
}

class RefreshProfile extends ProfileEvent {
  const RefreshProfile();
}

class UpdateProfile extends ProfileEvent {
  final String name;
  final String username;
  final String bio;
  final String? profileImageUrl;

  const UpdateProfile({
    required this.name,
    required this.username,
    required this.bio,
    this.profileImageUrl,
  });

  @override
  List<Object?> get props => [name, username, bio, profileImageUrl];
}

class UpdateActiveBadge extends ProfileEvent {
  final String? badgeId;

  const UpdateActiveBadge({required this.badgeId});

  @override
  List<Object?> get props => [badgeId];
}
