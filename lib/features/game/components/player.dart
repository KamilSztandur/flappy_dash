import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flutter/widgets.dart';

class Player extends SpriteComponent with TapCallbacks, HasGameReference {
  Player({super.position})
    : super(size: Vector2.all(200), anchor: Anchor.center);

  final Vector2 velocity = Vector2.zero();
  final double terminalVelocity = 300;
  final List<ComponentKey> jumpKeys = [];

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('player.jpg');
  }

  @override
  Future<void> update(double dt) async {
    // If fell below the screen, then game over.
    if (position.y > game.size.y / 2 + size.y / 2) {
      position.y = 0;
    }

    // Apply basic gravity.
    velocity.y += 30;

    // Prevent ember from jumping to crazy fast.
    velocity.y = velocity.y.clamp(0, terminalVelocity);

    // Calculate height based on velocity and current position
    position += velocity * dt;

    // Rotate player upon jumping
    final rotationDelta = Curves.easeOut.transform(
      velocity.y / terminalVelocity,
    );

    final rotationSpeed = jumpKeys.isNotEmpty ? 50 : 300;

    angle += rotationDelta / rotationSpeed;

    super.update(dt);
  }

  @override
  void onTapDown(TapDownEvent event) {
    final key = ComponentKey.unique();

    jumpKeys.add(key);

    add(
      MoveByEffect(
        key: key,
        Vector2(0, -200),
        EffectController(duration: 0.350, curve: Curves.easeOut),
        onComplete: () => jumpKeys.remove(key),
      ),
    );
  }
}
