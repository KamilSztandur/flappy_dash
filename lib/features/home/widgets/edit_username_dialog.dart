import 'dart:math';

import 'package:flappy_dash/common/shared_preferences.dart';
import 'package:flappy_dash/design_system/spacings.dart';
import 'package:flappy_dash/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUsernameDialog extends StatefulWidget {
  const EditUsernameDialog._();

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (context) => const EditUsernameDialog._(),
    );
  }

  @override
  State<EditUsernameDialog> createState() => _EditUsernameDialogState();
}

class _EditUsernameDialogState extends State<EditUsernameDialog> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller.text = context.read<AppSharedPreferences>().username;
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = l10n(context);

    final screenWidth = MediaQuery.sizeOf(context).width;

    const foregroundColor = Colors.white;
    const backgroundColor = Colors.white38;

    return AlertDialog(
      backgroundColor: backgroundColor,
      constraints: BoxConstraints(
        maxWidth: max(
          screenWidth - AppSpacings.s24.horizontal.horizontal,
          300,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacings.s12.value),
      ),
      contentPadding: AppSpacings.s24.horizontal + AppSpacings.s8.vertical,
      content: Padding(
        padding: AppSpacings.s24.all,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              child: TextField(
                controller: controller,
                autofocus: true,
                style: const TextStyle(color: foregroundColor),
                cursorColor: foregroundColor,
                decoration: InputDecoration(
                  labelText: s.home_username,
                  hintText: s.home_enter_username,
                  fillColor: foregroundColor,
                  iconColor: foregroundColor,
                  hoverColor: foregroundColor,
                  labelStyle: const TextStyle(color: foregroundColor),

                  hintStyle: const TextStyle(color: foregroundColor),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: foregroundColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: foregroundColor),
                  ),
                ),
              ),
            ),
            AppSpacings.s24.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: foregroundColor,
                      foregroundColor: Colors.blueGrey,
                    ),
                    onPressed: () {
                      context.read<AppSharedPreferences>().setUsername(
                        controller.text,
                      );

                      Navigator.of(context).pop();
                    },
                    child: Text(s.home_save),
                  ),
                ),
                AppSpacings.s16.horizontalSpace,
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: backgroundColor,
                      foregroundColor: foregroundColor,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(s.home_cancel),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
