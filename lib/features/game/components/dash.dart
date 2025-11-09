import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/flappy_dash_game.dart';
import 'package:flappy_dash/resources/game_assets.dart';
import 'package:flappy_dash/resources/game_display_mode_provider.dart';
import 'package:flappy_dash/resources/game_sounds.dart';

class Dash extends SpriteComponent
    with
        HasGameReference<FlappyDashGame>,
        CollisionCallbacks,
        FlameBlocReader<GameCubit, GameState> {
  Dash()
    : super(
        key: playerKey,
        size: Vector2.all(
          GameDisplayModeProvider.instance.isVertical ? 50 : 75,
        ),
        anchor: Anchor.center,
        priority: 3,
      );

  static const dashSize = 75.0;

  static final playerKey = ComponentKey.unique();
  static const gravitalVelocity = 100.0;
  static const jumpVelocity = -300.0;

  final velocity = Vector2(0, jumpVelocity);

  DateTime lastJumpTime = DateTime.now();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await _resolveSprite();

    add(CircleHitbox());
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);

    if (bloc.state is GameOverState) {
      return;
    }

    // If fell below the screen, then game over.
    if (position.y > game.size.y / 2 + size.y / 2) {
      unawaited(bloc.gameOver());

      return;
    }

    final millisecondsSinceLastJump = lastJumpTime
        .difference(DateTime.now())
        .inMilliseconds
        .abs();

    // Apply basic gravity.
    final gravityAcceleration = (millisecondsSinceLastJump / 5000).clamp(
      0,
      1,
    );
    velocity.y += 500 * gravityAcceleration;

    // Calculate height based on velocity and current position
    position += velocity * dt;

    final gameRadius = game.size.y / 2;
    position.y = position.y.clamp(-gameRadius, double.infinity);

    // Rotate player upon jumping
    if (millisecondsSinceLastJump > 650) {
      angle = 0.5;
    } else {
      angle = velocity.y < 0 ? -0.5 : 0;
    }

    await _resolveSprite();
  }

  Future<void> _resolveSprite() async {
    final dashSprite = velocity.y < 0
        ? GameAssets.dash
        : GameAssets.dashJumping;

    sprite = await game.loadSprite(dashSprite.filename);
  }

  void jump() {
    unawaited(GameSounds.playRandomJump());

    lastJumpTime = DateTime.now();
    velocity.y = velocity.y.clamp(1.5 * jumpVelocity, 0);

    velocity.y += jumpVelocity;
  }
}
