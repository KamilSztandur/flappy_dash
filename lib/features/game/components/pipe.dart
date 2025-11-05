import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flappy_dash/features/game/game.dart';

enum PipeAlignment { top, bottom }

class Pipe extends SpriteComponent with HasGameReference<FlappyDashGame> {
  Pipe({
    required this.horizontalOffset,
    required this.verticalOffset,
    required this.alignment,
  }) : super(anchor: Anchor.bottomCenter);

  static const horizontalVelocity = 5000.0;

  final PipeAlignment alignment;
  final double horizontalOffset;
  final double verticalOffset;

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('pipe.png');

    final gameRadius = game.size.y / 2;

    size = Vector2(100, gameRadius);

    angle = switch (alignment) {
      PipeAlignment.top => math.pi,
      PipeAlignment.bottom => 0,
    };

    _updateScreenPosition();
  }

  @override
  Future<void> update(double dt) async {
    _updateScreenPosition();
  }

  void _updateScreenPosition() {
    final gameRadius = game.size.y / 2;

    final localOffset = horizontalOffset + game.horizontalOffset;
    position = switch (alignment) {
      PipeAlignment.top => Vector2(
        localOffset,
        -gameRadius + 100 - verticalOffset,
      ),
      PipeAlignment.bottom => Vector2(
        localOffset,
        gameRadius - 100 + verticalOffset,
      ),
    };
  }
}
