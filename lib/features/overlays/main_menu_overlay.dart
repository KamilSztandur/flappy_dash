import 'dart:math';

import 'package:flutter/material.dart';

class MainMenuOverlay extends StatelessWidget {
  const MainMenuOverlay({
    super.key,
    required this.onStartTap,
  });

  final VoidCallback onStartTap;

  static const _padding = EdgeInsetsDirectional.all(32);

  @override
  Widget build(BuildContext context) {
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
            'PRESS ANYWHERE TO START',
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
