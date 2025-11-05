import 'package:flappy_dash/design_system/language/switch_language_button.dart';
import 'package:flappy_dash/design_system/spacings.dart';
import 'package:flappy_dash/features/home/widgets/edit_username_button.dart';
import 'package:flappy_dash/features/home/widgets/leaderboard_button.dart';
import 'package:flutter/material.dart';

class HomeControls extends StatelessWidget {
  const HomeControls({
    super.key,
    required this.toggleUI,
  });

  final ValueChanged<bool> toggleUI;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: AppSpacings.s16.value,
      children: [
        const SwitchLanguageButton(),
        EditUsernameButton(toggleUI: toggleUI),
        const LeaderboardButton(),
      ],
    );
  }
}
