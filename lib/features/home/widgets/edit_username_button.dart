import 'package:flappy_dash/features/home/widgets/edit_username_dialog.dart';
import 'package:flutter/material.dart';

class EditUsernameButton extends StatelessWidget {
  const EditUsernameButton({
    super.key,
    required this.toggleUI,
  });

  final ValueChanged<bool> toggleUI;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: #edit_username_button,
      onPressed: () async {
        try {
          toggleUI(false);

          await EditUsernameDialog.show(context);

          toggleUI(true);
        } finally {
          toggleUI(true);
        }
      },
      backgroundColor: Colors.white30,
      foregroundColor: Colors.white,
      child: const Icon(Icons.edit),
    );
  }
}
