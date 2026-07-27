import 'package:flutter/material.dart';

class TopBarAction {
  final IconData icon;
  final VoidCallback? onPressed;

  const TopBarAction({
    required this.icon,
    this.onPressed,
  });
}