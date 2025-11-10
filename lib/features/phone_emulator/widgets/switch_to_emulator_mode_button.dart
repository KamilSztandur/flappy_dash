import 'package:flappy_dash/features/phone_emulator/cubits/phone_emulator_cubit.dart';
import 'package:flappy_dash/resources/translations/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchToPhoneEmulatorModeButton extends StatelessWidget {
  const SwitchToPhoneEmulatorModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final s = l10n(context);

    return FloatingActionButton.extended(
      heroTag: #phoneEmulatorModeButton,
      onPressed: () => context.read<AppDisplayModeCubit>().set(
        AppDisplayMode.phoneEmulator,
      ),
      foregroundColor: Colors.black,
      backgroundColor: Colors.yellow,
      icon: const Icon(Icons.smartphone),
      label: Text(s.phone_emulator_wrapper_switch_to_phone),
    );
  }
}
