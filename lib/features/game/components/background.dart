import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flame/rendering.dart';
import 'package:flutter/painting.dart';

class Background extends ParallaxComponent {
  Background({required Vector2 super.position, required Vector2 super.size});

  @override
  Future<void> onLoad() async {
    final sky = ParallaxLayer(
      ParallaxImage(
        await game.images.load('sky.webp'),
        repeat: ImageRepeat.repeatX,
      ),
      velocityMultiplier: Vector2(15, 0),
    );

    decorator
      ..addLast(PaintDecorator.blur(5.5))
      ..addLast(
        PaintDecorator.tint(const Color(0xFF000000).withValues(alpha: 0.15)),
      );

    parallax = Parallax([sky], baseVelocity: Vector2(5, 0));
  }
}
