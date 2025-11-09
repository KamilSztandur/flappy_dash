import 'package:flame/game.dart';

class GameDisplayModeProvider {
  GameDisplayModeProvider._();

  static final GameDisplayModeProvider instance = GameDisplayModeProvider._();

  bool _isVertical = false;

  bool get isVertical => _isVertical;

  double get gameHorizontalSpeed => isVertical ? 0.175 : 0.3;

  void update(Vector2 gameSize) {
    _isVertical = gameSize.x < gameSize.y;
  }
}
