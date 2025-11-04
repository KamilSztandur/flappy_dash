import 'package:flame/game.dart';
import 'package:flappy_dash/features/game/world.dart';
import 'package:flutter/material.dart';

class FlappyDashApp extends StatelessWidget {
  const FlappyDashApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return MaterialApp(
      home: Scaffold(
        body: GameWidget(
          game: FlameGame(
            world: MyWorld(width: size.width, height: size.height),
          ),
        ),
      ),
    );
  }
}
