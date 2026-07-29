import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class BadgeModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String iconUrl;

  final String rarity;
  final String color;

  final String unlockType;
  final int unlockValue;

  final int xpBonus;

  final bool isHidden;

  final Timestamp createdAt;

  const BadgeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.iconUrl,
    required this.rarity,
    required this.color,
    required this.unlockType,
    required this.unlockValue,
    required this.xpBonus,
    required this.isHidden,
    required this.createdAt,
  });

  BadgeModel copyWith({
    String? id,
    String? name,
    String? description,
    String? iconUrl,
    String? rarity,
    String? color,
    String? unlockType,
    int? unlockValue,
    int? xpBonus,
    bool? isHidden,
    Timestamp? createdAt,
  }) {
    return BadgeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      iconUrl: iconUrl ?? this.iconUrl,
      rarity: rarity ?? this.rarity,
      color: color ?? this.color,
      unlockType: unlockType ?? this.unlockType,
      unlockValue: unlockValue ?? this.unlockValue,
      xpBonus: xpBonus ?? this.xpBonus,
      isHidden: isHidden ?? this.isHidden,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory BadgeModel.fromMap(Map<String, dynamic> map) {
    return BadgeModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      iconUrl: map['iconUrl'] ?? '',
      rarity: map['rarity'] ?? 'Common',
      color: map['color'] ?? '#22C55E',
      unlockType: map['unlockType'] ?? '',
      unlockValue: map['unlockValue'] ?? 0,
      xpBonus: map['xpBonus'] ?? 0,
      isHidden: map['isHidden'] ?? false,
      createdAt: map['createdAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'iconUrl': iconUrl,
      'rarity': rarity,
      'color': color,
      'unlockType': unlockType,
      'unlockValue': unlockValue,
      'xpBonus': xpBonus,
      'isHidden': isHidden,
      'createdAt': createdAt,
    };
  }

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    iconUrl,
    rarity,
    color,
    unlockType,
    unlockValue,
    xpBonus,
    isHidden,
    createdAt,
  ];
}
