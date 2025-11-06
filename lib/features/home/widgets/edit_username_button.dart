import 'package:flappy_dash/features/game/cubits/ui_visibility_cubit.dart';
import 'package:flappy_dash/features/home/widgets/edit_username_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUsernameButton extends StatelessWidget {
  const EditUsernameButton({super.key});

  @override
  Widget build(BuildContext context) {
    final uiVisibilityCubit = context.read<UIVisibilityCubit>();

    return FloatingActionButton(
      heroTag: #edit_username_button,
      onPressed: () async {
        try {
          uiVisibilityCubit.hide();

          await EditUsernameDialog.show(context);
        } finally {
          uiVisibilityCubit.show();
        }
      },
      backgroundColor: Colors.white30,
      foregroundColor: Colors.white,
      child: const Icon(Icons.edit),
    );
  }
}
