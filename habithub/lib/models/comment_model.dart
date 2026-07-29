import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CommentModel extends Equatable {
  final String id;
  final String postId;
  final String authorId;

  final String content;

  final String? parentCommentId;

  final int likesCount;
  final int repliesCount;

  final bool isEdited;
  final bool isArchived;

  final Timestamp createdAt;
  final Timestamp? updatedAt;

  const CommentModel({
    required this.id,
    required this.postId,
    required this.authorId,
    required this.content,
    this.parentCommentId,
    required this.likesCount,
    required this.repliesCount,
    required this.isEdited,
    required this.isArchived,
    required this.createdAt,
    this.updatedAt,
  });

  CommentModel copyWith({
    String? id,
    String? postId,
    String? authorId,
    String? content,
    String? parentCommentId,
    int? likesCount,
    int? repliesCount,
    bool? isEdited,
    bool? isArchived,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return CommentModel(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      authorId: authorId ?? this.authorId,
      content: content ?? this.content,
      parentCommentId: parentCommentId ?? this.parentCommentId,
      likesCount: likesCount ?? this.likesCount,
      repliesCount: repliesCount ?? this.repliesCount,
      isEdited: isEdited ?? this.isEdited,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] ?? '',
      postId: map['postId'] ?? '',
      authorId: map['authorId'] ?? '',
      content: map['content'] ?? '',
      parentCommentId: map['parentCommentId'],
      likesCount: map['likesCount'] ?? 0,
      repliesCount: map['repliesCount'] ?? 0,
      isEdited: map['isEdited'] ?? false,
      isArchived: map['isArchived'] ?? false,
      createdAt: map['createdAt'] ?? Timestamp.now(),
      updatedAt: map['updatedAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'postId': postId,
      'authorId': authorId,
      'content': content,
      'parentCommentId': parentCommentId,
      'likesCount': likesCount,
      'repliesCount': repliesCount,
      'isEdited': isEdited,
      'isArchived': isArchived,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  List<Object?> get props => [
    id,
    postId,
    authorId,
    content,
    parentCommentId,
    likesCount,
    repliesCount,
    isEdited,
    isArchived,
    createdAt,
    updatedAt,
  ];
}
