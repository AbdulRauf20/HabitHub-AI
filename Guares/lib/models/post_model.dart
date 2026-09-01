import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final String id;
  final String authorId;

  final String caption;

  final List<String> imageUrls;

  final String? challengeId;
  final String? communityId;

  final String visibility;
  final String type;

  final int likesCount;
  final int commentsCount;
  final int sharesCount;

  final bool isEdited;
  final bool isArchived;

  final Timestamp createdAt;
  final Timestamp? updatedAt;

  const PostModel({
    required this.id,
    required this.authorId,
    required this.caption,
    required this.imageUrls,
    this.challengeId,
    this.communityId,
    required this.visibility,
    required this.type,
    required this.likesCount,
    required this.commentsCount,
    required this.sharesCount,
    required this.isEdited,
    required this.isArchived,
    required this.createdAt,
    this.updatedAt,
  });

  PostModel copyWith({
    String? id,
    String? authorId,
    String? caption,
    List<String>? imageUrls,
    String? challengeId,
    String? communityId,
    String? visibility,
    String? type,
    int? likesCount,
    int? commentsCount,
    int? sharesCount,
    bool? isEdited,
    bool? isArchived,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return PostModel(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      caption: caption ?? this.caption,
      imageUrls: imageUrls ?? this.imageUrls,
      challengeId: challengeId ?? this.challengeId,
      communityId: communityId ?? this.communityId,
      visibility: visibility ?? this.visibility,
      type: type ?? this.type,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      sharesCount: sharesCount ?? this.sharesCount,
      isEdited: isEdited ?? this.isEdited,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] ?? '',
      authorId: map['authorId'] ?? '',
      caption: map['caption'] ?? '',
      imageUrls: List<String>.from(map['imageUrls'] ?? []),
      challengeId: map['challengeId'],
      communityId: map['communityId'],
      visibility: map['visibility'] ?? 'Public',
      type: map['type'] ?? 'Post',
      likesCount: map['likesCount'] ?? 0,
      commentsCount: map['commentsCount'] ?? 0,
      sharesCount: map['sharesCount'] ?? 0,
      isEdited: map['isEdited'] ?? false,
      isArchived: map['isArchived'] ?? false,
      createdAt: map['createdAt'] ?? Timestamp.now(),
      updatedAt: map['updatedAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'authorId': authorId,
      'caption': caption,
      'imageUrls': imageUrls,
      'challengeId': challengeId,
      'communityId': communityId,
      'visibility': visibility,
      'type': type,
      'likesCount': likesCount,
      'commentsCount': commentsCount,
      'sharesCount': sharesCount,
      'isEdited': isEdited,
      'isArchived': isArchived,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  List<Object?> get props => [
    id,
    authorId,
    caption,
    imageUrls,
    challengeId,
    communityId,
    visibility,
    type,
    likesCount,
    commentsCount,
    sharesCount,
    isEdited,
    isArchived,
    createdAt,
    updatedAt,
  ];
}
