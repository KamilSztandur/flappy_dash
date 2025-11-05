import 'package:flame/components.dart';

class Player extends SpriteComponent with HasGameReference {
  Player() : super(size: Vector2.all(100), anchor: Anchor.center);

  final Vector2 velocity = Vector2.zero();
  final double terminalVelocity = 400;
  final double jumpVelocity = -350;
  DateTime lastJumpTime = DateTime.now();

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('player.jpg');
  }

  @override
  Future<void> update(double dt) async {
    // If fell below the screen, then game over.
    if (position.y > game.size.y / 2 + size.y / 2) {
      reset();
    }

    final millisecondsSinceLastJump = lastJumpTime
        .difference(DateTime.now())
        .inMilliseconds
        .abs();

    // Apply basic gravity.
    final gravityAcceleration = (millisecondsSinceLastJump / 5000).clamp(0, 1);
    velocity.y += 150 * gravityAcceleration;

    // Calculate height based on velocity and current position
    position += velocity * dt;

    final gameRadius = game.size.y / 2;
    position.y = position.y.clamp(-gameRadius, gameRadius);

    // Rotate player upon jumping
    if (millisecondsSinceLastJump > 650) {
      angle = 0.5;
    } else {
      angle = velocity.y < 0 ? -0.5 : 0;
    }

    super.update(dt);
  }

  void reset() {
    position.y = 0;
    angle = 0;
    lastJumpTime = DateTime.now();
    velocity.y = 0;
  }

  void jump() {
    lastJumpTime = DateTime.now();
    velocity.y = jumpVelocity;
  }
}
