import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/rendering.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_dash/features/game/components/player.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/game.dart';
import 'package:flappy_dash/features/game/models/game_sounds.dart';
import 'package:flutter/material.dart';

enum PipeAlignment { top, bottom }

class Pipe extends SpriteComponent
    with
        HasGameReference<FlappyDashGame>,
        CollisionCallbacks,
        FlameBlocReader<GameCubit, GameState> {
  Pipe({
    required this.globalOffset,
    required this.verticalOffset,
    required this.alignment,
  }) : super(anchor: Anchor.topCenter);

  static const horizontalVelocity = 5000.0;

  final PipeAlignment alignment;
  final double globalOffset;
  final double verticalOffset;
  bool wasHit = false;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await Sprite.load('obstacle.png');

    final gameRadius = game.size.y / 2;

    size = Vector2(100, gameRadius);

    if (alignment == PipeAlignment.top) {
      flipVertically();
    }

    _updateScreenPosition();

    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player && !wasHit) {
      wasHit = true;

      decorator.addLast(
        PaintDecorator.tint(
          Colors.red.withValues(alpha: 0.6),
        ),
      );

      GameSounds.crash.play();

      bloc.gameOver();
    }

    super.onCollision(intersectionPoints, other);
  }

  @override
  Future<void> update(double dt) async {
    _updateScreenPosition();
  }

  void _updateScreenPosition() {
    final localOffset = globalOffset - bloc.state.calculateDistanceTravelled();
    final gameRadius = game.size.y / 2;

    position = switch (alignment) {
      PipeAlignment.top => Vector2(
        localOffset,
        -gameRadius + verticalOffset,
      ),
      PipeAlignment.bottom => Vector2(
        localOffset,
        gameRadius - verticalOffset,
      ),
    };
  }
}
