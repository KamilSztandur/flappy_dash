import 'package:flutter_bloc/flutter_bloc.dart';

enum AppDisplayMode {
  phoneEmulator,
  desktop,
}

class AppDisplayModeCubit extends Cubit<AppDisplayMode> {
  AppDisplayModeCubit() : super(AppDisplayMode.desktop);

  void set(AppDisplayMode mode) {
    emit(mode);
  }
}
