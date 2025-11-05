import 'dart:math';

import 'package:flappy_dash/design_system/spacings.dart';
import 'package:flappy_dash/resources/strings.dart';
import 'package:flutter/material.dart';

class MainMenuOverlay extends StatefulWidget {
  const MainMenuOverlay({
    super.key,
    required this.onStartTap,
  });

  final VoidCallback onStartTap;

  static final _padding = AppSpacings.s32.all;

  @override
  State<MainMenuOverlay> createState() => _MainMenuOverlayState();
}

class _MainMenuOverlayState extends State<MainMenuOverlay>
    with TickerProviderStateMixin {
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();

    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _bounceAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1,
          end: 0.8,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.8,
          end: 1,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
    ]).animate(_bounceController);
  }

  @override
  void dispose() {
    _bounceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = l10n(context);

    final screenSize = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: widget.onStartTap,
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: min(
              screenSize.width - MainMenuOverlay._padding.horizontal,
              300,
            ),
          ),
          child: AnimatedBuilder(
            animation: _bounceController,
            builder: (context, child) {
              final scale = _bounceAnimation.value;

              return Transform.scale(
                scale: scale,
                child: Text(
                  s.main_menu_press_anywhere_to_start,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
