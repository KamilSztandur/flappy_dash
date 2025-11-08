import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_dash/features/game/flappy_dash_game.dart';
import 'package:flutter/painting.dart';

class Road extends PositionComponent with HasGameReference<FlappyDashGame> {
  Road();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    _positionAndSize();

    add(
      ParallaxComponent(
        parallax: Parallax(
          [
            ParallaxLayer(
              ParallaxImage(
                await game.images.load('road.jpg'),
                alignment: Alignment.bottomCenter,
                repeat: ImageRepeat.repeat,
              ),
              velocityMultiplier: Vector2(25, 0),
            ),
          ],
          baseVelocity: Vector2(8.5, 0),
        ),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    _positionAndSize();
  }

  void _positionAndSize() {
    size = Vector2(game.size.x * 5, 100);

    position = Vector2(
      -game.size.x / 2,
      game.size.y / 2 - size.y,
    );
  }
}
