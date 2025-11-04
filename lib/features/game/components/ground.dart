import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/painting.dart';

class Ground extends ParallaxComponent {
  Ground();

  @override
  Future<void> onLoad() async {
    final sky = ParallaxLayer(
      ParallaxImage(
        await game.images.load('grass.png'),
        repeat: ImageRepeat.repeatX,
      ),
      velocityMultiplier: Vector2(15, 0),
    );

    parallax = Parallax([sky], baseVelocity: Vector2(5, 0));

    position = Vector2(-game.size.x / 2, -game.size.y / 4);
  }
}
