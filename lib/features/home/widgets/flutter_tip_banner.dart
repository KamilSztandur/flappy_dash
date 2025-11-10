import 'dart:async';
import 'dart:math';

import 'package:flappy_dash/design_system/spacings.dart';
import 'package:flappy_dash/resources/audio/game_audio_player.dart';
import 'package:flappy_dash/resources/audio/game_sounds.dart';
import 'package:flappy_dash/resources/translations/strings.dart';
import 'package:flutter/material.dart';

class FlutterTipBanner extends StatefulWidget {
  const FlutterTipBanner({
    super.key,
  });

  @override
  State<FlutterTipBanner> createState() => _FlutterTipBannerState();
}

class _FlutterTipBannerState extends State<FlutterTipBanner>
    with TickerProviderStateMixin {
  Timer? _timer;
  int _currentIndex = 0;

  late AnimationController _rotationController;
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  static const _totalTips = 20;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

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

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentIndex >= _totalTips - 1) {
        _timer?.cancel();
        return;
      }

      setState(() {
        _currentIndex++;
      });

      GameAudioPlayer.instance.playSound(GameSounds.tip);

      _bounceController.forward(from: 0);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _rotationController.dispose();
    _bounceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = l10n(context);

    final tips = [
      s.game_flutter_tips_1,
      s.game_flutter_tips_2,
      s.game_flutter_tips_3,
      s.game_flutter_tips_4,
      s.game_flutter_tips_5,
      s.game_flutter_tips_6,
      s.game_flutter_tips_7,
      s.game_flutter_tips_8,
      s.game_flutter_tips_9,
      s.game_flutter_tips_10,
      s.game_flutter_tips_11,
      s.game_flutter_tips_12,
      s.game_flutter_tips_13,
      s.game_flutter_tips_14,
      s.game_flutter_tips_15,
      s.game_flutter_tips_16,
      s.game_flutter_tips_17,
      s.game_flutter_tips_18,
      s.game_flutter_tips_19,
      s.game_flutter_tips_20,
    ];

    final effectiveIndex = _currentIndex.clamp(0, tips.length - 1);

    final tip = tips[effectiveIndex];

    const foregroundColor = Colors.yellow;
    final backgroundColor = Colors.black.withValues(alpha: 0.5);

    final screenWidth = MediaQuery.sizeOf(context).width;

    return AnimatedBuilder(
      animation: Listenable.merge([_rotationController, _bounceController]),
      builder: (context, child) {
        final rotation = sin(_rotationController.value * 2 * pi) * 0.05;
        final scale = _bounceAnimation.value;

        return Transform.rotate(
          angle: rotation,
          child: Transform.scale(
            scale: scale,
            child: child,
          ),
        );
      },
      child: Container(
        constraints: BoxConstraints(
          maxWidth: min(screenWidth * 0.8, 350),
        ),
        padding: AppSpacings.s32.all,
        decoration: BoxDecoration(
          color: backgroundColor,

          borderRadius: BorderRadius.circular(AppSpacings.s16.value),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.lightbulb_outline,
                  color: foregroundColor,
                ),
                AppSpacings.s8.horizontalSpace,
                Expanded(
                  child: Text(
                    s.game_flutter_tips_tip_out_of(
                      effectiveIndex + 1,
                      tips.length,
                    ),
                    style: const TextStyle(
                      color: foregroundColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            AppSpacings.s16.verticalSpace,
            Text(
              tip,
              style: const TextStyle(color: Colors.white),
            ),
            if (effectiveIndex < tips.length - 1) ...[
              AppSpacings.s16.verticalSpace,
              Text(
                s.game_flutter_tips_progress_more,
                style: const TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
