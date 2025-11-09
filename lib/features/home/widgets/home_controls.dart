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

    return SafeArea(
      child: Padding(
        padding: !isVertical ? AppSpacings.s48.top : AppSpacings.zero.all,
        child: Column(
          spacing: AppSpacings.s16.value,
          mainAxisSize: !isVertical ? MainAxisSize.max : MainAxisSize.min,
          crossAxisAlignment: !isVertical
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.center,
          children: [
            if (!isVertical) ...[
              const SwitchToPhoneEmulatorModeButton(),
              const Spacer(),
            ],
            const SwitchLanguageButton(),
            const EditUsernameButton(),
            const LeaderboardButton(),
          ],
        ),
      ),
    );
  }
}
