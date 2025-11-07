import 'package:flappy_dash/features/game/cubits/ui_visibility_cubit.dart';
import 'package:flappy_dash/features/leaderboard/leaderboard_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaderboardButton extends StatelessWidget {
  const LeaderboardButton({super.key});

  @override
  Widget build(BuildContext context) {
    final uiVisibilityCubit = context.read<UIVisibilityCubit>();

    return FloatingActionButton(
      heroTag: #leaderboard_button,
      onPressed: () async {
        try {
          uiVisibilityCubit.hide();

          await LeaderboardDialog.show(context);
        } finally {
          uiVisibilityCubit.show();
        }
      },
      backgroundColor: Colors.white30,
      foregroundColor: Colors.white,
      child: const Icon(Icons.leaderboard),
    );
  }
}
