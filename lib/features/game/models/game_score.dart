import 'package:equatable/equatable.dart';

class GameScore with EquatableMixin {
  const GameScore({
    required this.value,
    required this.username,
  });

  final String username;
  final int value;

  @override
  List<Object?> get props => [value, username];
}
