import 'package:flappy_dash/features/game/models/game_score.dart';
import 'package:hive_ce/hive.dart';

class GameScoreAdapter extends TypeAdapter<GameScore> {
  @override
  int get typeId => 1;

  @override
  GameScore read(BinaryReader reader) {
    final username = reader.readString();
    final value = reader.readInt();

    return GameScore(
      username: username,
      value: value,
    );
  }

  @override
  void write(BinaryWriter writer, GameScore obj) {
    writer
      ..writeString(obj.username)
      ..writeInt(obj.value);
  }
}
