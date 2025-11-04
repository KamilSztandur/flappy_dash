import 'package:flame/game.dart';
import 'package:flutter/animation.dart';

class FlightPosition extends NotifyingVector2 {
  FlightPosition({required double totalHeight})
    : _totalHeight = totalHeight,
      super.zero() {
    _startGravityPull();
  }

  static const gravityPullForce = 10.0; // pixels per second
  static const jumpForce = 20.0; // pixels per second

  final double _totalHeight;

  var _isJumping = false;
  var _isGravityOn = false;

  void launchGravity() {
    _isGravityOn = true;
  }

  void stopGravity() {
    _isGravityOn = false;
  }

  Future<void> _startGravityPull() async {
    print('xcf gravity pull started');
    final gravityInterval = Duration(
      milliseconds: (1000 / gravityPullForce).round(),
    );

    while (true) {
      print('xcf gravity pull loop ${_isGravityOn}');
      if (!_isGravityOn) {
        continue;
      }

      await Future<void>.delayed(gravityInterval);

      if (!_isJumping && y < _totalHeight / 2) {
        setValues(x, y + gravityPullForce);
      }
    }
  }

  Future<void> jump() async {
    if (_isJumping) {
      return;
    }

    try {
      _isJumping = true;

      final jumpDuration = Duration(milliseconds: 500);
      final jumpInterval = Duration(milliseconds: 16); // ~60fps
      final startY = y;
      final endY = y - 200; // Total jump height

      final startTime = DateTime.now();

      while (true) {
        await Future<void>.delayed(jumpInterval);

        final elapsed = DateTime.now().difference(startTime);
        final progress = (elapsed.inMilliseconds / jumpDuration.inMilliseconds)
            .clamp(0.0, 1.0);

        if (progress >= 1.0) {
          setValues(x, endY);
          break;
        }

        final curvedProgress = Curves.easeOut.transform(progress);
        final newY = startY + (endY - startY) * curvedProgress;

        setValues(x, newY);
      }
    } finally {
      _isJumping = false;
    }
  }
}
