import 'package:device_frame_plus/device_frame_plus.dart';
import 'package:flappy_dash/design_system/spacings.dart';
import 'package:flappy_dash/features/phone_emulator/cubits/phone_emulator_cubit.dart';
import 'package:flappy_dash/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneEmulatorWrapper extends StatefulWidget {
  const PhoneEmulatorWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<PhoneEmulatorWrapper> createState() => _PhoneEmulatorWrapperState();
}

class _PhoneEmulatorWrapperState extends State<PhoneEmulatorWrapper> {
  @override
  void didUpdateWidget(PhoneEmulatorWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);

    final displayMode = context.read<AppDisplayModeCubit>().state;
    if (displayMode == AppDisplayMode.phoneEmulator) {
      final screenSize = MediaQuery.sizeOf(context);

      final isVertical = screenSize.width < screenSize.height;

      if (isVertical) {
        context.read<AppDisplayModeCubit>().set(AppDisplayMode.desktop);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = l10n(context);

    final displayMode = context.watch<AppDisplayModeCubit>().state;

    return switch (displayMode) {
      AppDisplayMode.desktop => widget.child,
      AppDisplayMode.phoneEmulator => Container(
        color: Colors.blueGrey.shade900,
        child: Padding(
          padding: AppSpacings.s32.all,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white38,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => context.read<AppDisplayModeCubit>().set(
                  AppDisplayMode.desktop,
                ),

                child: Text(s.phone_emulator_wrapper_switch_to_fullscreen),
              ),
              AppSpacings.s16.verticalSpace,
              Expanded(
                child: DeviceFrame(
                  device: Devices.ios.iPhone14Pro,
                  screen: widget.child,
                ),
              ),
            ],
          ),
        ),
      ),
    };
  }
}
