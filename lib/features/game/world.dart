import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flappy_dash/features/game/components/background.dart';
import 'package:flappy_dash/features/game/components/ground.dart';
import 'package:flappy_dash/features/game/components/player.dart';

class MyWorld extends World with TapCallbacks {
  MyWorld({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Future<void> onLoad() async {
    final topStart = Vector2(-width / 2, -height / 2);

    add(Background(position: topStart, size: Vector2(width, height)));

    add(Ground());

    add(Player(position: Vector2(0, 0)));
  }
}
