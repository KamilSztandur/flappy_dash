import 'package:flame/components.dart';
import 'package:flappy_dash/features/game/game.dart';

class Player extends SpriteComponent with HasGameReference<FlappyDashGame> {
  Player()
    : super(
        key: playerKey,
        size: Vector2.all(100),
        anchor: Anchor.center,
      );

  static final playerKey = ComponentKey.unique();
  static const gravitalVelocity = 100.0;
  static const jumpVelocity = -500.0;

  final Vector2 velocity = Vector2(0, jumpVelocity);

  DateTime lastJumpTime = DateTime.now();

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('player.jpg');
  }

  @override
  Future<void> update(double dt) async {
    if (game.isGameOver) {
      return;
    }

    final gameStarted = game.findByKey(playerKey) != null;
    if (gameStarted) {
      // If fell below the screen, then game over.
      if (position.y > game.size.y / 2 + size.y / 2) {
        game.gameOver();
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

    super.update(dt);
  }

  void jump() {
    lastJumpTime = DateTime.now();
    velocity.y = jumpVelocity;
  }
}
