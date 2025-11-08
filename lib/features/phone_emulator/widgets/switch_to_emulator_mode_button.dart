import 'package:flappy_dash/features/phone_emulator/cubits/phone_emulator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchToPhoneEmulatorModeButton extends StatelessWidget {
  const SwitchToPhoneEmulatorModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: #phoneEmulatorModeButton,
      onPressed: () => context.read<AppDisplayModeCubit>().set(
        AppDisplayMode.phoneEmulator,
      ),
      backgroundColor: Colors.black.withValues(alpha: 0.33),
      foregroundColor: Colors.yellow,
      child: const Icon(Icons.smartphone),
    );
  }
}
