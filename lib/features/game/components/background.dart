import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flame/rendering.dart';
import 'package:flappy_dash/features/game/flappy_dash_game.dart';
import 'package:flappy_dash/resources/game_assets.dart';
import 'package:flutter/material.dart';

class CityBackground extends ParallaxComponent<FlappyDashGame> {
  CityBackground();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final sky = ParallaxLayer(
      ParallaxImage(
        await game.images.load(GameAssets.city.filename),
        repeat: ImageRepeat.repeatX,
      ),
      velocityMultiplier: Vector2(15, 0),
    );

    decorator
      ..addLast(PaintDecorator.blur(5.5))
      ..addLast(
        PaintDecorator.tint(const Color(0xFF000000).withValues(alpha: 0.15)),
      );

    parallax = Parallax(
      [sky],
      baseVelocity: Vector2(5, 0),
    );

    position = Vector2(
      -game.size.x / 2,
      -game.size.y / 2,
    );

    size = game.size;
  }

  @override
  void update(double dt) {
    super.update(dt);

    _positionAndSize();
  }

  void _positionAndSize() {
    position = Vector2(
      -game.size.x / 2,
      -game.size.y / 2,
    );

    size = game.size;
  }
}
