import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CommunityModel extends Equatable {
  final String id;

  final String name;
  final String description;

  final String imageUrl;
  final String coverImageUrl;

  final String ownerId;

  final String category;

  final String visibility;

  final int membersCount;
  final int postsCount;

  final bool isVerified;
  final bool isArchived;

  final Timestamp createdAt;

  const CommunityModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.coverImageUrl,
    required this.ownerId,
    required this.category,
    required this.visibility,
    required this.membersCount,
    required this.postsCount,
    required this.isVerified,
    required this.isArchived,
    required this.createdAt,
  });

  CommunityModel copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? coverImageUrl,
    String? ownerId,
    String? category,
    String? visibility,
    int? membersCount,
    int? postsCount,
    bool? isVerified,
    bool? isArchived,
    Timestamp? createdAt,
  }) {
    return CommunityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      ownerId: ownerId ?? this.ownerId,
      category: category ?? this.category,
      visibility: visibility ?? this.visibility,
      membersCount: membersCount ?? this.membersCount,
      postsCount: postsCount ?? this.postsCount,
      isVerified: isVerified ?? this.isVerified,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory CommunityModel.fromMap(Map<String, dynamic> map) {
    return CommunityModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      coverImageUrl: map['coverImageUrl'] ?? '',
      ownerId: map['ownerId'] ?? '',
      category: map['category'] ?? '',
      visibility: map['visibility'] ?? 'Public',
      membersCount: map['membersCount'] ?? 0,
      postsCount: map['postsCount'] ?? 0,
      isVerified: map['isVerified'] ?? false,
      isArchived: map['isArchived'] ?? false,
      createdAt: map['createdAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'coverImageUrl': coverImageUrl,
      'ownerId': ownerId,
      'category': category,
      'visibility': visibility,
      'membersCount': membersCount,
      'postsCount': postsCount,
      'isVerified': isVerified,
      'isArchived': isArchived,
      'createdAt': createdAt,
    };
  }

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    imageUrl,
    coverImageUrl,
    ownerId,
    category,
    visibility,
    membersCount,
    postsCount,
    isVerified,
    isArchived,
    createdAt,
  ];
}
