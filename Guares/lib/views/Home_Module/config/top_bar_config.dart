import 'package:flutter/material.dart';

import 'top_bar_action.dart';
import 'top_bar_data.dart';

class TopBarConfig {
  static final List<TopBarData> items = [
    /// Home
    TopBarData(
      title: "",
      showGreeting: true,
      actions: const [
        TopBarAction(icon: Icons.notifications_outlined),
        TopBarAction(icon: Icons.settings_outlined),
      ],
    ),

    /// Challenges
    TopBarData(
      title: "Challenges",
      actions: const [
        TopBarAction(icon: Icons.notifications_outlined),
        TopBarAction(icon: Icons.settings_outlined),
      ],
    ),

    /// Create Challenge
    TopBarData(
      title: "Create Challenge",
      actions: const [TopBarAction(icon: Icons.close_rounded)],
    ),

    /// Community
    TopBarData(
      title: "Community",
      actions: const [
        TopBarAction(icon: Icons.notifications_outlined),
        TopBarAction(icon: Icons.settings_outlined),
      ],
    ),

    /// Profile
    TopBarData(
      title: "My Profile",
      actions: const [
        TopBarAction(icon: Icons.notifications_outlined),
        TopBarAction(icon: Icons.settings_outlined),
      ],
    ),
  ];
}
