import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  final String id;

  final String receiverId;
  final String? senderId;

  final String title;
  final String body;

  final String type;

  final String? referenceId;

  final bool isRead;

  final Timestamp createdAt;

  const NotificationModel({
    required this.id,
    required this.receiverId,
    this.senderId,
    required this.title,
    required this.body,
    required this.type,
    this.referenceId,
    required this.isRead,
    required this.createdAt,
  });

  NotificationModel copyWith({
    String? id,
    String? receiverId,
    String? senderId,
    String? title,
    String? body,
    String? type,
    String? referenceId,
    bool? isRead,
    Timestamp? createdAt,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      receiverId: receiverId ?? this.receiverId,
      senderId: senderId ?? this.senderId,
      title: title ?? this.title,
      body: body ?? this.body,
      type: type ?? this.type,
      referenceId: referenceId ?? this.referenceId,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'] ?? '',
      receiverId: map['receiverId'] ?? '',
      senderId: map['senderId'],
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      type: map['type'] ?? '',
      referenceId: map['referenceId'],
      isRead: map['isRead'] ?? false,
      createdAt: map['createdAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'receiverId': receiverId,
      'senderId': senderId,
      'title': title,
      'body': body,
      'type': type,
      'referenceId': referenceId,
      'isRead': isRead,
      'createdAt': createdAt,
    };
  }

  @override
  List<Object?> get props => [
    id,
    receiverId,
    senderId,
    title,
    body,
    type,
    referenceId,
    isRead,
    createdAt,
  ];
}
