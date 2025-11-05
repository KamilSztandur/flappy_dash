import 'package:collection/collection.dart';
import 'package:flappy_dash/features/game/models/game_score.dart';
import 'package:flappy_dash/features/leaderboard/models/game_score_adapter.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

class LeaderboardRepository {
  static const boxName = 'leaderboard';

  final db = Hive.box<GameScore>(boxName);

  static Future<void> init() async {
    if (!kIsWeb) {
      final appDocumentDirectory = await getApplicationDocumentsDirectory();
      Hive.init(appDocumentDirectory.path);
    }

    Hive.registerAdapter(GameScoreAdapter());

    await Hive.openBox<GameScore>(boxName);
  }

  Future<void> writeScore(GameScore score) async {
    await db.add(score);
  }

  List<GameScore> getLeaderboard() {
    final scores = db.values.toList();

    return scores
        .sorted((a, b) => b.value.compareTo(a.value))
        .take(10)
        .toList();
  }
}
