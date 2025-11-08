import 'package:flappy_dash/design_system/language/switch_language_button.dart';
import 'package:flappy_dash/design_system/spacings.dart';
import 'package:flappy_dash/features/home/widgets/edit_username_button.dart';
import 'package:flappy_dash/features/home/widgets/leaderboard_button.dart';
import 'package:flappy_dash/features/phone_emulator/widgets/switch_to_emulator_mode_button.dart';
import 'package:flutter/material.dart';

class HomeControls extends StatelessWidget {
  const HomeControls({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final isVertical = screenSize.width < screenSize.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: AppSpacings.s16.value,
      children: [
        if (!isVertical) const SwitchToPhoneEmulatorModeButton(),
        const SwitchLanguageButton(),
        const EditUsernameButton(),
        const LeaderboardButton(),
      ],
    );
  }
}
