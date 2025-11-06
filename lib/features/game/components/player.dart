import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/game.dart';

class Player extends SpriteComponent
    with
        HasGameReference<FlappyDashGame>,
        CollisionCallbacks,
        FlameBlocReader<GameCubit, GameState> {
  Player()
    : super(
        key: playerKey,
        size: Vector2.all(75),
        anchor: Anchor.center,
      );

  static final playerKey = ComponentKey.unique();
  static const gravitalVelocity = 100.0;
  static const jumpVelocity = -300.0;

  final _random = Random();
  final _jumpSounds = ['jump_1.mp3', 'jump_2.mp3', 'jump_3.mp3'];

  final Vector2 velocity = Vector2(0, jumpVelocity);

  DateTime lastJumpTime = DateTime.now();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await Sprite.load('player.jpg');

    add(CircleHitbox());
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);

    if (bloc.state is GameOverState) {
      return;
    }

    // FIXME: check for player position was here

    // If fell below the screen, then game over.
    if (position.y > game.size.y / 2 + size.y / 2) {
      bloc.gameOver();

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
  }

  void jump() {
    unawaited(
      FlameAudio.play(
        _jumpSounds[_random.nextInt(_jumpSounds.length)],
      ),
    );

    lastJumpTime = DateTime.now();
    velocity.y = velocity.y.clamp(2 * jumpVelocity, 0);
    velocity.y += jumpVelocity;
  }
}
