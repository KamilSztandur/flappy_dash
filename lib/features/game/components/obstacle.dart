import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/rendering.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_dash/features/game/components/dash.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/flappy_dash_game.dart';
import 'package:flappy_dash/resources/game_assets.dart';
import 'package:flappy_dash/resources/game_sounds.dart';
import 'package:flutter/material.dart';

enum ObstacleAlignment { top, bottom }

class Obstacle extends SpriteComponent
    with
        HasGameReference<FlappyDashGame>,
        CollisionCallbacks,
        FlameBlocReader<GameCubit, GameState> {
  Obstacle({
    required this.globalOffset,
    required this.verticalOffset,
    required this.alignment,
  }) : super(anchor: Anchor.topCenter, priority: 2);

  static const horizontalVelocity = 5000.0;

  final ObstacleAlignment alignment;
  final double globalOffset;
  final double verticalOffset;
  bool wasHit = false;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final obstacleAsset = [
      GameAssets.obstacle1,
      GameAssets.obstacle2,
      GameAssets.obstacle3,
    ].random();

    sprite = await Sprite.load(obstacleAsset.filename);

    size = Vector2(100, game.size.y * 0.85);

    if (alignment == ObstacleAlignment.top) {
      flipVertically();
    }

    _updateScreenPosition();

    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Dash && !wasHit) {
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
      ObstacleAlignment.top => Vector2(
        localOffset,
        -gameRadius + verticalOffset,
      ),
      ObstacleAlignment.bottom => Vector2(
        localOffset,
        gameRadius - verticalOffset,
      ),
    };
  }
}
