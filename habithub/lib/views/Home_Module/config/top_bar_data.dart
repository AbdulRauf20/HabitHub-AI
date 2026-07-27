import 'top_bar_action.dart';

class TopBarData {
  final String title;
  final bool showGreeting;

  final List<TopBarAction> actions;

  const TopBarData({
    required this.title,
    this.showGreeting = false,
    this.actions = const [],
  });
}