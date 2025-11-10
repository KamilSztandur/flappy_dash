import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/extensions.dart';
import 'package:flame/rendering.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/flappy_dash_game.dart';
import 'package:flappy_dash/resources/game_assets.dart';
import 'package:flutter/material.dart';

class BuildingsForeground extends PositionComponent
    with
        HasGameReference<FlappyDashGame>,
        FlameBlocListenable<GameCubit, GameState> {
  BuildingsForeground() : super(priority: 1);

  var _enabled = true;
  var _totalDt = 0.0;
  var _nextDt = 0.0;

  GameAssets? _lastBuildingAsset;

  final buildingsAssets = [
    GameAssets.building1,
    GameAssets.building2,
    GameAssets.building3,
  ];

  @override
  void update(double dt) {
    super.update(dt);

    _totalDt += dt;

    if (!_enabled) {
      final buildings = children.whereType<_Building>();

      for (final building in buildings) {
        building.stop();
      }
    }

    if (_enabled && _totalDt >= _nextDt) {
      final buildingAsset = [
        for (final asset in buildingsAssets)
          if (asset != _lastBuildingAsset) asset,
      ].random();

      add(
        _Building(
          onComplete: remove,
          asset: buildingAsset,
        ),
      );

      _lastBuildingAsset = buildingAsset;
      _nextDt = Random().nextDouble() * 2.5 + 0.75;
      _totalDt = 0.0;
    }
  }

  @override
  void onNewState(GameState state) {
    super.onNewState(state);

    final buildings = children.whereType<_Building>();

    switch (state) {
      case StartedPlayingState(:final isRestart) when isRestart:
        _enabled = true;
        for (final building in buildings) {
          building.resume();
        }

      case GameOverState():
        _enabled = false;
        for (final building in buildings) {
          building.stop();
        }

      default:
      // Do nothing
    }
  }
}

class _Building extends SpriteComponent
    with
        HasGameReference<FlappyDashGame>,
        FlameBlocReader<GameCubit, GameState> {
  _Building({
    required this.onComplete,
    required this.asset,
  }) : super(priority: 1);

  final ValueChanged<_Building> onComplete;
  final GameAssets asset;

  bool _enabled = true;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final screenSize = game.size;

    final buildingSprite = await Sprite.load(asset.filename);

    sprite = buildingSprite;

    width = min(400, screenSize.y / 2);
    height =
        width * buildingSprite.originalSize.y / buildingSprite.originalSize.x;

    position = Vector2(
      screenSize.x / 2 + size.x,
      screenSize.y / 2 - size.y,
    );

    add(
      MoveEffect.by(
        Vector2(-screenSize.x - 2 * size.x, 0),
        EffectController(speed: 250),
        onComplete: () => onComplete(this),
      ),
    );

    decorator
      ..addLast(PaintDecorator.blur(0.5))
      ..addLast(PaintDecorator.tint(Colors.black.withValues(alpha: 0.3)));
  }

  void stop() {
    if (!_enabled) {}

    _enabled = false;
    children.whereType<MoveEffect>().firstOrNull?.pause();
  }

  void resume() {
    _enabled = true;
    children.whereType<MoveEffect>().firstOrNull?.resume();
  }
}
