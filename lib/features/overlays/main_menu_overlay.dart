import 'dart:math';

import 'package:flappy_dash/design_system/spacings.dart';
import 'package:flappy_dash/resources/strings.dart';
import 'package:flutter/material.dart';

class MainMenuOverlay extends StatelessWidget {
  const MainMenuOverlay({
    super.key,
    required this.onStartTap,
  });

  final VoidCallback onStartTap;

  static final _padding = AppSpacings.s32.all;

  @override
  Widget build(BuildContext context) {
    final s = l10n(context);

    final screenSize = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: onStartTap,
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: min(screenSize.width - _padding.horizontal, 300),
          ),
          child: Text(
            s.main_menu_press_anywhere_to_start,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.yellow,
            ),
          ),
        ),
      ),
    );
  }
}
