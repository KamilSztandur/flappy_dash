import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flappy_dash/features/game/flappy_dash_game.dart';

class Explosion extends SpriteAnimationComponent
    with HasGameReference<FlappyDashGame> {
  Explosion({required super.position})
    : super(
        anchor: Anchor.center,
        size: Vector2.all(200),
      );

  @override
  Future<void> onLoad() async {
    super.onLoad();

    animation =
        SpriteSheet(
          image: await game.images.load('explosion.png'),
          srcSize: Vector2(150, 150),
        ).createAnimation(
          row: 0,
          stepTime: 0.01,
          to: 60,
          loop: false,
        );
  }
}
