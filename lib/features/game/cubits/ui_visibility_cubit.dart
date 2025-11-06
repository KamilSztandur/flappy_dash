import 'package:flutter_bloc/flutter_bloc.dart';

class UIVisibilityCubit extends Cubit<UIVisibilityState> {
  UIVisibilityCubit() : super(const UIVisibleState());

  void show() {
    emit(const UIVisibleState());
  }

  void hide() {
    emit(const UIInvisibleState());
  }
}

sealed class UIVisibilityState {
  const UIVisibilityState();
}

class UIVisibleState extends UIVisibilityState {
  const UIVisibleState();
}

class UIInvisibleState extends UIVisibilityState {
  const UIInvisibleState();
}
